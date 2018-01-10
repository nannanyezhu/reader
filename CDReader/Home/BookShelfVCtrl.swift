//
//  BookShelfVCtrl.swift
//  CDReader
//
//  Created by nannanYZ on 2018/1/10.
//  Copyright © 2018年 nan. All rights reserved.
//

import UIKit
import Kingfisher
class BookShelfVCtrl: CDBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let portraitItem = UIBarButtonItem.init(image: UIImage.init(named: "newUserheader_default.png"), style: .plain, target: self, action: #selector(rightItemAction))
        navigationItem.leftBarButtonItem = portraitItem;
        let urlStr = "http://scimg.jb51.net/touxiang/201701/201701221734594.jpg"
        let url = URL(string: urlStr)!
        
        let manager = KingfisherManager.shared
        manager.retrieveImage(with: url, options: nil, progressBlock: { (receivedSize, totalSize) in
            print("receivedSize = \(receivedSize) totalSize = \(totalSize)")
        }) { (image, error, cacheType, URL) in
//            guard let err = error else{
//                print(err)
//            }
            guard let img = image else{
                return
            }
            portraitItem.image = img
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func rightItemAction() {
        print("rightItemAction")
    }


}
