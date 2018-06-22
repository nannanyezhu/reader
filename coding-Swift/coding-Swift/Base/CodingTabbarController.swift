//
//  CodingTabbarController.swift
//  coding-Swift
//
//  Created by 严楠楠 on 2018/6/22.
//  Copyright © 2018年 严楠楠. All rights reserved.
//

import UIKit

class CodingTabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChildViewController()
    }

    private func addChildViewController() {
        setChildViewController(UIViewController(), title: "项目", imageName: "project")
        setChildViewController(UIViewController(), title: "任务", imageName: "task")
        setChildViewController(UIViewController(), title: "冒泡", imageName: "tweet")
        setChildViewController(UIViewController(), title: "消息", imageName: "privatemessage")
        setChildViewController(UIViewController(), title: "我", imageName: "me")
    }
    
    private func setChildViewController(_ childController: UIViewController, title: String, imageName: String) {
        childController.tabBarItem.image = UIImage(named: imageName + "_normal")
        childController.tabBarItem.image = UIImage(named: imageName + "_selected")
        childController.title = title
        addChildViewController(CodingNavigationController(rootViewController: childController))
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

}
