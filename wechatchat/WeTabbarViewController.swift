//
//  WeTabbarViewController.swift
//  wechatchat
//
//  Created by Quentin on 2019/4/30.
//  Copyright © 2019 quentin. All rights reserved.
//

import Foundation
import UIKit
import TimedSilver

class WeTabbarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViewController()
    }
    
    func setupViewController() {
//        let titleArray = ["微信", "通讯录", "发现", "我"]
        let titleArray = ["微信"]
        
        let normalImagesArray = [
            WeAsset.Tabbar_mainframe.image,
//            WeAsset.Tabbar_contacts.image,
//            WeAsset.Tabbar_discover.image,
//            WeAsset.Tabbar_me.image,
        ]
        
        let selectedImagesArray = [
            WeAsset.Tabbar_mainframeHL.image,
//            WeAsset.Tabbar_contactsHL.image,
//            WeAsset.Tabbar_discoverHL.image,
//            WeAsset.Tabbar_meHL.image,
        ]
        
        let viewControllerArray = [
            WeMessageViewController.ts_initFromNib(),  //消息
//            WeContactsViewController.ts_initFromNib(), //联系人
//            WeDiscoverViewController.ts_initFromNib(), //发现
//            WeMeViewController.ts_initFromNib()   //我
        ]
        
        let navigationVCArray = NSMutableArray()
        for (index, controller) in viewControllerArray.enumerated() {
            controller.tabBarItem!.title = titleArray.get(index: index)
            controller.tabBarItem!.image = normalImagesArray.get(index: index).withRenderingMode(.alwaysOriginal)
            controller.tabBarItem!.selectedImage = selectedImagesArray.get(index: index).withRenderingMode(.alwaysOriginal)
            controller.tabBarItem!.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.lightGray], for: UIControlState())
            controller.tabBarItem!.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.tabbarSelectedTextColor], for: .selected)
            let navigationController = UINavigationController(rootViewController: controller)
            navigationVCArray.add(navigationController)
        }
        self.viewControllers = navigationVCArray.mutableCopy() as! [UINavigationController]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
