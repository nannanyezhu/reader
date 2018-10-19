//
//  AppDelegate+rootWindow.swift
//  BaseNetwork
//
//  Created by 严楠楠 on 2018/10/17.
//  Copyright © 2018 严楠楠. All rights reserved.
//

import UIKit

extension AppDelegate {
    func setupRootWindow() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = NNMainTabBarViewController()
        window?.makeKeyAndVisible()
    }
}
