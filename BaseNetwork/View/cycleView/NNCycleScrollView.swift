//
//  NNCycleScrollView.swift
//  BaseNetwork
//
//  Created by 严楠楠 on 2018/10/18.
//  Copyright © 2018 严楠楠. All rights reserved.
//

import UIKit

@objc protocol NNCycleScrollViewDelegate {
    /** 图片选中*/
    @objc optional func cycleScrollViewDidSelect(at index:Int, cycleScrollView:NNCycleScrollView)
    /** 图片滚动*/
    @objc optional func cycleScrollViewDidScroll(at index:Int, cycleScrollView:NNCycleScrollView)
}


class NNCycleScrollView: UIView {

    weak var delegate: NNCycleScrollViewDelegate?
    fileprivate var flowLayout:UICollectionViewFlowLayout?
    fileprivate var collectionView: UICollectionView?
    fileprivate var pageControl: UIPageControl?
    fileprivate let CellID = "NNCycleCell"
    fileprivate var totalItemsCount: Int = 0
    fileprivate var timer: Timer?
    
    fileprivate var items:Array<NNCycleModel> = [NNCycleModel](){
        didSet(newValue){
            items.removeAll()
            items = newValue
            
            totalItemsCount = items.count * 100
            setAutoScroll()
            setupPageControl()
            collectionView?.reloadData()
        }
    }
    
    
    
    deinit {
        collectionView?.delegate = nil
        collectionView?.dataSource = nil
    }
}
// MARK: - 滚动相关
extension NNCycleScrollView {
    fileprivate func setAutoScroll() {
        invalidateTime()
        setupTimer()
    }
    
    fileprivate func invalidateTime() {
        timer?.invalidate()
        timer = nil
    }
    
    fileprivate func setupTimer() {
        timer = Timer(timeInterval: 3,
                      target: self,
                      selector: #selector(automaticScroll),
                      userInfo: nil,
                      repeats: true)
        RunLoop.main.add(timer!, forMode: RunLoop.Mode.common)
    }
    
    @objc func automaticScroll() {
        if totalItemsCount == 0 {
            return
        }
        let index = currentIndex()
        let targetIndex = index + 1
        scrollToIndex(targetIndex: targetIndex)
    }
    
    fileprivate func scrollToIndex(targetIndex: Int){
        var tmp = 0
        if targetIndex > totalItemsCount {
            tmp = Int(Double(totalItemsCount) * 0.5)
            collectionView?.scrollToItem(at: IndexPath.init(item: tmp, section: 0),
                                         at: .init(rawValue: 0),
                                         animated: true)
            return
        }
        collectionView?.scrollToItem(at: IndexPath.init(item: targetIndex, section: 0),
                                     at: .init(rawValue: 0),
                                     animated: true)
    }
    
    fileprivate func currentIndex() -> Int{
        let index = Int((collectionView!.contentOffset.x + flowLayout!.itemSize.width * 0.5) / flowLayout!.itemSize.width)
        return max(0, index)
    }
    
    override func willMove(toSuperview newSuperview: UIView?) {
        if newSuperview == nil {
            invalidateTime()
        }
    }
}


// MARK: - pageControll页面
extension NNCycleScrollView {
    fileprivate func setupPageControl() {
        if pageControl == nil {
            pageControl = UIPageControl(frame: CGRect.zero)
            addSubview(pageControl!)
        }
        pageControl?.numberOfPages = items.count
        pageControl?.hidesForSinglePage = true
        pageControl?.currentPageIndicatorTintColor = .theme
        pageControl?.pageIndicatorTintColor = .color999
        pageControl?.isUserInteractionEnabled = false
    }
}

// MARK: -  UICollectionViewDelegate, UICollectionViewDataSource
extension NNCycleScrollView: UICollectionViewDelegate, UICollectionViewDataSource{
    fileprivate func setupCollectionView() {
        flowLayout = UICollectionViewFlowLayout()
        flowLayout?.itemSize = frame.size
        flowLayout?.minimumLineSpacing = 0
        flowLayout?.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: bounds, collectionViewLayout: flowLayout!)
        collectionView?.register(NNCycleCell.self, forCellWithReuseIdentifier: CellID)
        collectionView?.isPagingEnabled = true
        collectionView?.isScrollEnabled = true
        collectionView?.bounces = false
        collectionView?.showsVerticalScrollIndicator = false
        collectionView?.showsHorizontalScrollIndicator = false
        collectionView?.delegate = self
        collectionView?.dataSource = self
        addSubview(collectionView!)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return totalItemsCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let curIndex = indexPath.item % items.count
        let cell: NNCycleCell = collectionView.dequeueReusableCell(withReuseIdentifier: CellID, for: indexPath) as! NNCycleCell
        cell.updateCellInfo(info: items[curIndex])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.cycleScrollViewDidSelect?(at: indexPath.item % items.count, cycleScrollView: self)
    }
}



