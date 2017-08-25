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
    @IBOutlet weak var smallImageView: UIImageView!
    @IBOutlet weak var bigImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func action(_ sender: UIButton) {
        let actionSheet = UIAlertController(title: "Actions", message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
        let saveAction = UIAlertAction(title: "Save", style: UIAlertActionStyle.default) { (action) in
            
        }
        let deleteAction = UIAlertAction(title: "Delete All", style: UIAlertActionStyle.destructive) { (action) in
            
        }
        let removeAction = UIAlertAction(title: "Remove 1", style: UIAlertActionStyle.destructive) { (action) in
            
        }
        let addAction = UIAlertAction(title: "Add 1", style: UIAlertActionStyle.default) { (action) in
            
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel) { (action) in
        }
        actionSheet.addAction(saveAction)
        actionSheet.addAction(addAction)
        actionSheet.addAction(removeAction)
        actionSheet.addAction(deleteAction)
        actionSheet.addAction(cancelAction)
        
        self.navigationController?.present(actionSheet, animated: true, completion: nil)


    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if(textField == eanTextField) {
            dataManager.bookBLL.getBookInformation(ean: eanTextField.text!, completion: { (book, error) in
                self.initForm(book: book!)
            })
        }
    }
    
    private func initForm(book: Book) {
        if (self.titleTextField.text!.isEmpty()) {
            self.titleTextField.text = book.title ?? ""
        }
        if (self.authorsTextField.text!.isEmpty()) {
            
        }
        if (self.descriptionTextView.text.isEmpty()) {
            self.descriptionTextView.text = book.description ?? ""
        }
        self.quantityTextField.text = String(book.quantity)
        
    }
    
    private func initBookFromForm(){
        
    }
    
}