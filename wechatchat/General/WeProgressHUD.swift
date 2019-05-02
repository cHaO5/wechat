//
//  WeProgressHUD.swift
//  wechatchat
//
//  Created by Quentin on 2019/5/2.
//  Copyright © 2019 quentin. All rights reserved.
//

import Foundation
import SVProgressHUD

class WeProgressHUD: NSObject {
    class func ts_initHUD() {
        SVProgressHUD.setBackgroundColor(UIColor ( red: 0.0, green: 0.0, blue: 0.0, alpha: 0.7 ))
        SVProgressHUD.setForegroundColor(UIColor.white)
        SVProgressHUD.setFont(UIFont.systemFont(ofSize: 14))
        SVProgressHUD.setDefaultMaskType(SVProgressHUDMaskType.none)
    }
    
    //成功
    class func ts_showSuccessWithStatus(_ string: String) {
        self.WeProgressHUDShow(.success, status: string)
    }
    
    //失败 ，NSError
    class func ts_showErrorWithObject(_ error: NSError) {
        self.WeProgressHUDShow(.errorObject, status: nil, error: error)
    }
    
    //失败，String
    class func ts_showErrorWithStatus(_ string: String) {
        self.WeProgressHUDShow(.errorString, status: string)
    }
    
    //转菊花
    class func ts_showWithStatus(_ string: String) {
        self.WeProgressHUDShow(.loading, status: string)
    }
    
    //警告
    class func ts_showWarningWithStatus(_ string: String) {
        self.WeProgressHUDShow(.info, status: string)
    }
    
    //dismiss消失
    class func ts_dismiss() {
        SVProgressHUD.dismiss()
    }
    
    //私有方法
    fileprivate class func WeProgressHUDShow(_ type: HUDType, status: String? = nil, error: NSError? = nil) {
        switch type {
        case .success:
            SVProgressHUD.showSuccess(withStatus: status)
            break
        case .errorObject:
            guard let newError = error else {
                SVProgressHUD.showError(withStatus: "Error:出错拉")
                return
            }
            
            if newError.localizedFailureReason == nil {
                SVProgressHUD.showError(withStatus: "Error:出错拉")
            } else {
                SVProgressHUD.showError(withStatus: error!.localizedFailureReason)
            }
            break
        case .errorString:
            SVProgressHUD.showError(withStatus: status)
            break
        case .info:
            SVProgressHUD.showInfo(withStatus: status)
            break
        case .loading:
            SVProgressHUD.show(withStatus: status)
            break
        }
    }
    
    fileprivate enum HUDType: Int {
        case success, errorObject, errorString, info, loading
    }
}
