//
//  CodingNavigationController.swift
//  coding-Swift
//
//  Created by 严楠楠 on 2018/6/22.
//  Copyright © 2018年 严楠楠. All rights reserved.
//

import UIKit

class CodingNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.tintColor = UIColor.navtigationTitleColor()

        // Do any additional setup after loading the view.
    }

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back_T_Nav"),
                                                                              style: .plain,
                                                                              target: self,
                                                                              action: #selector(navigationBack))
        }
        super.pushViewController(viewController, animated: true)
    }
    
    @objc private func navigationBack() {
        popViewController(animated: true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
