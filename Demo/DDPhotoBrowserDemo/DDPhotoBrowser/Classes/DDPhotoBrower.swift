//
//  DDPhotoBrower.swift
//  DDPhotoBrowserDemo
//
//  Created by USER on 2018/11/22.
//  Copyright © 2018 dd01.leo. All rights reserved.
//

import UIKit

public protocol DDPhotoBrowerDelegate: NSObjectProtocol {
    /// 索引值改变
    ///
    /// - Parameter index: 索引
    func photoBrowser(controller: DDPhotoBrowerController?, didChanged index: Int?)

    /// 单击事件，即将消失
    ///
    /// - Parameter index: 索引
    func photoBrowser(controller: DDPhotoBrowerController?, willDismiss index: Int?)

    /// 长按事件事件
    ///
    /// - Parameter index: 索引
    func photoBrowser(controller: DDPhotoBrowerController?, longPress index: Int?)
}

extension DDPhotoBrowerDelegate {
    func photoBrowser(controller: DDPhotoBrowerController?, didChanged index: Int?) {}
    func photoBrowser(controller: DDPhotoBrowerController?, willDismiss index: Int?) {}
    func photoBrowser(controller: DDPhotoBrowerController?, longPress index: Int?) {}
}

public class DDPhotoBrower: NSObject {
    
    /// 代理
    public weak var delegate: DDPhotoBrowerDelegate?
    /// 是否需要显示状态栏，默认不显示
    public var isShowStatusBar: Bool? = false
    public var photos: [DDPhoto]?
    public var currentIndex: Int?
   
    public init(photos: [DDPhoto], currentIndex: Int) {
        super.init()
        self.photos = photos
        self.currentIndex = currentIndex
    }
}

extension DDPhotoBrower {
    
    public static func photoBrowser(Photos photos: [DDPhoto], currentIndex: Int) -> DDPhotoBrower {
        return DDPhotoBrower(photos: photos, currentIndex: currentIndex)
    }
    
    public func show() {
        let topController = getAppTopViewController()
        let vc = DDPhotoBrowerController(Photos: photos, currentIndex: currentIndex)
        vc.modalTransitionStyle = .coverVertical
        vc.modalPresentationStyle = .custom
        vc.deleagte = delegate
        // 是否接管状态栏外观，即重写的 prefersStatusBarHidden 等方法是否会被调用
        vc.modalPresentationCapturesStatusBarAppearance = true
        topController?.present(vc, animated: false, completion: nil)
    }
}

private extension DDPhotoBrower {
    func getAppTopViewController() -> (UIViewController?) {
        let rootViewController = UIApplication.shared.keyWindow?.rootViewController
        if rootViewController?.isKind(of: UITabBarController.self) == true {
            let tabBarController: UITabBarController = rootViewController as! UITabBarController
            return tabBarController.selectedViewController
        } else if rootViewController?.isKind(of: UINavigationController.self) == true {
            let navigationController: UINavigationController = rootViewController as! UINavigationController
            return navigationController.visibleViewController
        } else if let presentVC = rootViewController?.presentedViewController {
            return presentVC
        }
        return rootViewController
    }

}
