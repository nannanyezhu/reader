//
//  NNMainTabBarViewController.swift
//  BaseNetwork
//
//  Created by 严楠楠 on 2018/10/17.
//  Copyright © 2018 严楠楠. All rights reserved.
//

import UIKit

class NNMainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let tabbar = UITabBar.appearance()
        tabbar.tintColor = .black
        addChildViewControllers()
    }
    

    private func addChildViewControllers() {
        setChildViewController(TodayViewController(), title: "今日", imageName: "today")
        setChildViewController(HistoryViewController(), title: "历史", imageName: "history")
        setChildViewController(WelfareViewController(), title: "福利", imageName: "welfare")
    }

    private func setChildViewController(_ childController: UIViewController, title: String, imageName: String) {
        childController.tabBarItem.image = UIImage(named: imageName + "_tabbar")
        childController.tabBarItem.selectedImage = UIImage(named: imageName + "_tabbar_press")
        childController.title = title;
        addChild(NNMainNavViewController(rootViewController: childController))
    }
}
