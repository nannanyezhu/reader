//
//  CDNavigationController.swift
//  CDReader
//
//  Created by nannanYZ on 2018/1/2.
//  Copyright © 2018年 nan. All rights reserved.
//

import UIKit

class CDNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.hex(hexString: "#333333")]
        guard let interationGes = interactivePopGestureRecognizer else {return}
        guard let targetView = interationGes.view else {return}
        guard let internalTargets = interationGes.value(forKeyPath: "targets") as? [NSObject] else {return}
        guard let internalTarget = internalTargets.first?.value(forKey: "target") else {return}
        let action = Selector(("handleNavigationTransition:"))
        
        let fullScreenGesture = UIPanGestureRecognizer(target: internalTarget, action: action)
        fullScreenGesture.delegate = self
        targetView.addGestureRecognizer(fullScreenGesture)
        interationGes.isEnabled = false
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if viewControllers.count > 0 { viewController.hidesBottomBarWhenPushed = true }
        super.pushViewController(viewController, animated: animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

extension CDNavigationController: UIGestureRecognizerDelegate {
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        let isLeftToRight = UIApplication.shared.userInterfaceLayoutDirection == .leftToRight
        guard let ges = gestureRecognizer as? UIPanGestureRecognizer else {
            return true
        }
        if ges.translation(in: gestureRecognizer.view).x * (isLeftToRight ? 1 : -1) <= 0
            || value(forKey: "_isTransitioning") as! Bool
            || disablePopGesture{
            return false
        }
        return viewControllers.count != 1
    }
}

extension CDNavigationController {
    override var preferredStatusBarStyle: UIStatusBarStyle{
        guard let topVC = topViewController else {
            return .lightContent
        }
        return topVC.preferredStatusBarStyle
    }
}

enum CDNavigationBarStyle {
    case theme
    case clear
    case white
}

extension UINavigationController {
    private struct AssociatedKeys {
        static var disablePopGesture: Void?
    }
    
    var disablePopGesture: Bool {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.disablePopGesture) as? Bool ?? false
        }
        set {
            return objc_setAssociatedObject(self,
                                            &AssociatedKeys.disablePopGesture,
                                            newValue,
                                            .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    func barStyle(_ style: CDNavigationBarStyle) {
        switch style {
        case .theme:
            navigationBar.barStyle = .black
            navigationBar.setBackgroundImage(UIImage(), for: .default)
            navigationBar.shadowImage = UIImage()
        case .clear:
            navigationBar.barStyle = .black
            navigationBar.setBackgroundImage(UIImage(), for: .default)
            navigationBar.shadowImage = UIImage()
        case .white:
            navigationBar.barStyle = .default
            navigationBar.setBackgroundImage(UIColor.white.image(), for: .default)
            navigationBar.shadowImage = UIImage()
        }
    }
}














