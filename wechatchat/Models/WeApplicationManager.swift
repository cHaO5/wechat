//
//  WeApplicationManager.swift
//  wechatchat
//
//  Created by Quentin on 2019/5/2.
//  Copyright © 2019 quentin. All rights reserved.
//

import UIKit
import Foundation
import RxSwift

class WeApplicationManager: NSObject {
    static func applicationConfigInit() {
        self.initNavigationBar()
        self.initNotifications()
        WeProgressHUD.ts_initHUD()
//        LocationInstance.startLocation({}, failure: {})
    }
    
    /**
     Custom NavigationBar
     */
    static func initNavigationBar() {
        UIApplication.shared.setStatusBarStyle(UIStatusBarStyle.lightContent, animated: true)
        UINavigationBar.appearance().barTintColor = UIColor.barTintColor
        UINavigationBar.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().isTranslucent = true
        let attributes = [
            NSAttributedStringKey.font: UIFont.systemFont(ofSize: 19.0),
            NSAttributedStringKey.foregroundColor: UIColor.white
        ]
        UINavigationBar.appearance().titleTextAttributes = attributes
    }
    
    /**
     Register remote notification
     */
    static func initNotifications() {
        
        let settings = UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
        UIApplication.shared.registerUserNotificationSettings(settings)
        UIApplication.shared.registerForRemoteNotifications()
    }
}



