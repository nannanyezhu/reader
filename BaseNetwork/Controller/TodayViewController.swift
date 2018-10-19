//
//  TodayViewController.swift
//  BaseNetwork
//
//  Created by 严楠楠 on 2018/10/17.
//  Copyright © 2018 严楠楠. All rights reserved.
//

import UIKit

class TodayViewController: UIViewController {

    var fakeNavView: TodayNavView?
    let tableView: UITableView = UITableView()
    var category:Array<String> = [String]()
    var items:Array<Array<ContentModel>> = [Array<ContentModel>]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    func setupUI() {
        setupFakeView()
        setupTableView()
    }
    
}
// MARK: - FAKENAVView
extension TodayViewController {
    fileprivate func setupFakeView() {
        fakeNavView = TodayNavView.init(frame: CGRect.init(x: 0, y: kStatusHeight, width: view.width, height: 0))
        view.addSubview(fakeNavView!)
    }
}

// MARK: - tableView
extension TodayViewController: UITableViewDelegate, UITableViewDataSource{
    
    fileprivate func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .white
        tableView.frame = CGRect.init(x: 0,
                                      y: fakeNavView!.frame.maxY,
                                      width: view.width,
                                      height: view.height - fakeNavView!.frame.maxY)
        view.addSubview(tableView)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell()
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        fakeNavView?.navViewDidScroll(offsetY: scrollView.contentOffset.y)
    }
}
