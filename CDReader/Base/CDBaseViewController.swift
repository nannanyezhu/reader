//
//  CDBaseViewController.swift
//  CDReader
//
//  Created by nannanYZ on 2018/1/2.
//  Copyright © 2018年 nan. All rights reserved.
//

import UIKit
import SnapKit
class CDBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.backgound
        if #available(iOS 11.0, *){
            UIScrollView.appearance().contentInsetAdjustmentBehavior = .never
        }else{
            automaticallyAdjustsScrollViewInsets = false
        }
        
        configUI()
    }

    func configUI() {}
    
    func configNavigationBar() {
        guard let navi = navigationController else { return }
        if navi.visibleViewController == self {
            navi.barStyle(.theme)
            navi.disablePopGesture = false
            navi.setNavigationBarHidden(false, animated: true)
            if navi.viewControllers.count > 1 {
                navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: UIImage(named: "nav_back_white"),
                                                                        style: .plain,
                                                                        target: self,
                                                                        action: #selector(pressBack))
            }
        }
    }
    
    @objc func pressBack() {
        navigationController?.popViewController(animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension CDBaseViewController {
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .`default`
    }
}









