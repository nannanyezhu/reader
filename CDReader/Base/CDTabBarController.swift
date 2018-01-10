//
//  CDTabBarController.swift
//  CDReader
//
//  Created by nannanYZ on 2018/1/2.
//  Copyright © 2018年 nan. All rights reserved.
//

import UIKit

class CDTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tabBar.isTranslucent = false
        
        let oneVC = BookShelfVCtrl()
        oneVC.view.backgroundColor = UIColor.random
        addChildViewController(oneVC, title: "畅读书城", image: UIImage(named: "shelf"), selectedImage: UIImage(named: "shelf1"))
        
        let twoVC = CDBaseViewController()
        twoVC.view.backgroundColor = UIColor.random
        addChildViewController(twoVC, title: "书城", image: UIImage(named: "store"), selectedImage: UIImage(named: "store1"))
        
        let threeVC = CDBaseViewController()
        threeVC.view.backgroundColor = UIColor.random
        addChildViewController(threeVC, title: "发现", image: UIImage(named: "discover"), selectedImage: UIImage(named: "discover1"))
        
        let fourVC = CDBaseViewController()
        fourVC.view.backgroundColor = UIColor.random
        addChildViewController(fourVC, title: "上次", image: UIImage(named: "lastread"), selectedImage: UIImage(named: "lastread1"))
    }

    func addChildViewController(_ childController: UIViewController, title:String?, image:UIImage?, selectedImage:UIImage?) {
        childController.title = title
        childController.tabBarItem = UITabBarItem.init(title: nil,
                                                       image: image?.withRenderingMode(.alwaysOriginal),
                                                       selectedImage: selectedImage?.withRenderingMode(.alwaysOriginal))
        
        if UIDevice.current.userInterfaceIdiom == .phone{
            childController.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0)
        }
        addChildViewController(CDNavigationController(rootViewController: childController))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}


extension CDTabBarController {
    override var preferredStatusBarStyle: UIStatusBarStyle{
        guard let select = selectedViewController else {
            return .`default`
        }
        return select.preferredStatusBarStyle
    }
}








