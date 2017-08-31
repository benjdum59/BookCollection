//
//  BookDetailViewController.swift
//  BookCollection
//
//  Created by Benjamin Dumont on 25/08/2017.
//  Copyright © 2017 BCFactory. All rights reserved.
//

import UIKit

class BookDetailViewController : UIViewController, UITextFieldDelegate {
    @IBOutlet weak var eanTextField: UITextField!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var quantityTextField: UITextField!
    @IBOutlet weak var authorsTextField: UITextField!
    @IBOutlet weak var bigImageView: UIImageView!
    
    var currentBook : Book?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initForm()
    }
    
    @IBAction func action(_ sender: UIButton) {
        
        initBookFromForm()
        guard self.currentBook != nil && self.currentBook!.isValid() else {
            return
        }
        
        let actionSheet = UIAlertController(title: "Actions", message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
        
        let saveAction = UIAlertAction(title: "Save", style: UIAlertActionStyle.default) { (action) in
            self.save()
        }
        let deleteAction = UIAlertAction(title: "Delete All", style: UIAlertActionStyle.destructive) { (action) in
            
            
        }
        let removeAction = UIAlertAction(title: "Remove 1", style: UIAlertActionStyle.destructive) { (action) in
            self.currentBook!.quantity = self.currentBook!.quantity - 1
            self.save()
        }
        let addAction = UIAlertAction(title: "Add 1", style: UIAlertActionStyle.default) { (action) in
            self.currentBook!.quantity = self.currentBook!.quantity + 1
            self.save()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel) { (action) in
        }
        if (self.currentBook!.quantity > 0) {
            actionSheet.addAction(saveAction)
        }
        actionSheet.addAction(addAction)
        if (self.currentBook!.quantity > 1) {
            actionSheet.addAction(removeAction)
        }
        actionSheet.addAction(deleteAction)
        actionSheet.addAction(cancelAction)
        
        self.navigationController?.present(actionSheet, animated: true, completion: nil)


    }
    
    private func save(){
//        self.currentBook!.imageStored = self.currentBook!.imageData != nil
        dataManager.bookBLL.saveBook(book: self.currentBook!)
        self.navigationController?.popViewController(animated: true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if(textField == eanTextField) {
            dataManager.bookBLL.getBookInformation(ean: eanTextField.text!, completion: { (book, error) in
                self.currentBook = book
                self.initForm()
            })
        }
    }
    
    private func initForm() {
        guard let book = currentBook else {
            return
        }
        if (self.eanTextField.text!.isEmpty()) {
            self.eanTextField.text = book.ean ?? ""
        }
        if (self.titleTextField.text!.isEmpty()) {
            self.titleTextField.text = book.title ?? ""
        }
        if (self.authorsTextField.text!.isEmpty()) {
            
        }
        if (self.descriptionTextView.text.isEmpty()) {
            self.descriptionTextView.text = book.description ?? ""
        }
        self.quantityTextField.text = String(book.quantity)
        self.bigImageView.getDataFromUrl(str: book.imgUrlStr)
        
        
    }
    
    private func initBookFromForm(){
        self.currentBook = Book(title: self.titleTextField.text, authors: self.authorsTextField.text?.toArray(), description: self.descriptionTextView.text, ean: self.eanTextField.text, thumbnail: nil, quantity: quantityTextField.text?.toInt() ?? 0, key:self.currentBook?.key, image: bigImageView.image)

 
    }
    
}
