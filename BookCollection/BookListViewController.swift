//
//  ViewController.swift
//  BookCollection
//
//  Created by Benjamin Dumont on 23/08/2017.
//  Copyright © 2017 BCFactory. All rights reserved.
//

import UIKit

class BookListViewController: UIViewController, MoreMenuBarDelegate {

    var sideMenubarLeft:MTSideMenubar!
    var arrBtnImageListLeft = [MTSideMenuImageList]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
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


}

