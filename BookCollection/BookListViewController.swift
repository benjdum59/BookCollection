//
//  ViewController.swift
//  BookCollection
//
//  Created by Benjamin Dumont on 23/08/2017.
//  Copyright © 2017 BCFactory. All rights reserved.
//

import UIKit

class BookListViewController: UIViewController, MoreMenuBarDelegate, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var booksTableView: UITableView!

    var sideMenubarLeft:MTSideMenubar!
    var arrBtnImageListLeft = [MTSideMenuImageList]()
    var books : [Book] = []
    var selectedBook : Book!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initMenu()
        dataManager.bookBLL.getBooks { (books) in
            self.books = books
            self.booksTableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bookCell") as! BookCell
        cell.initWithBook(book: books[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedBook = books[indexPath.row]
        self.performSegue(withIdentifier: "toDetail", sender: self)
    }
    
    private func initMenu() {
        
        //Left Side Menu bar Create
        arrBtnImageListLeft.append(MTSideMenuImageList(imgButton: UIImage(named: "scan")!))
        arrBtnImageListLeft.append(MTSideMenuImageList(imgButton: UIImage(named: "logout")!))
        
        
        var heightOfMenuBarLeft = (DeviceScale.SCALE_X * 20.0) //Top-Bottom Spacing
        heightOfMenuBarLeft += ((DeviceScale.SCALE_X * 16.66) * CGFloat((arrBtnImageListLeft.count - 1))) //Button between spacing
        heightOfMenuBarLeft += (CGFloat(arrBtnImageListLeft.count) * 50.0) //Button height spacing
        
        let originYOfMenuBarLeft = (self.view.frame.size.height / 2.0) - (heightOfMenuBarLeft / 2)
        
        sideMenubarLeft = MTSideMenubar.init(frame: CGRect(x: (ScreenSize.WIDTH - (DeviceScale.SCALE_X * 84.0)),y: originYOfMenuBarLeft,width: (DeviceScale.SCALE_X * 84.0),height: heightOfMenuBarLeft)).createUI(view: self.view, arrBtnImageList: arrBtnImageListLeft) as! MTSideMenubar
        sideMenubarLeft.delegate = self
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - MoreMenuBar Delegate
    func tappedOnEvent(sender: UIControl, sideMenubar: MTSideMenubar) {
        
        if sideMenubar == sideMenubarLeft {
            print("Left Side Menu Button Tag : ",sender.tag)
        }
        sideMenubarLeft.hide()

    }
    func moreMenuItemHide(sideMenubar: MTSideMenubar) {
        print("moreMenuItemHide")
    }
    func moreMenuItemShow(sideMenubar: MTSideMenubar) {
        print("moreMenuItemShow")
    }
    @IBAction func swipe(_ sender: UISwipeGestureRecognizer) {
        switch sender.direction {
        case UISwipeGestureRecognizerDirection.right:
            sideMenubarLeft.show(isShowingLeftToRight: true)
        case UISwipeGestureRecognizerDirection.left:
            sideMenubarLeft.hide()

        default:
            break
        }

    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        let book = books[indexPath.row]
//        if (book.imageStored && book.imageData == nil) {
//            dataManager.bookBLL.getCover(book: book, completion: {
//
//            })
//        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            let destinationVC = segue.destination as! BookDetailViewController
            destinationVC.currentBook = selectedBook
        }
    }


}

