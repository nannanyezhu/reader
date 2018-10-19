//
//  TodayNavView.swift
//  BaseNetwork
//
//  Created by 严楠楠 on 2018/10/17.
//  Copyright © 2018 严楠楠. All rights reserved.
//

import UIKit

/** 初始高度 */
let kNavViewHeight:CGFloat = 82
/** 滚动的总距离 */
let kScrollHeight:CGFloat = 33
/** 右边按钮初始顶部距离 */
let kRightBtnTop:CGFloat = 34
/** 右边按钮改变后的顶部距离 */
let kRightBtnChangeTop:CGFloat = 12.5
/** 右边按钮初始宽高 */
let kRightBtnHeight:CGFloat = 26
/** 右边按钮改变后的宽高 */
let kRightBtnChangeHeight:CGFloat = 19
/** 右边按钮原始右边距离 */
let kRightBtnRight:CGFloat = 15
/** 右边按钮改变后的右边距离 */
let kRightBtnChangeRight:CGFloat = 20
/** 右边按钮背景原始宽高 */
let kRightBtnBgHeight:CGFloat = 15
/** 右边按钮背景改变后的宽高 */
let kRightBtnChangeBgHeight:CGFloat = 30
/** 标题初始高度 */
let kTitleHeight:CGFloat = 32
/** 标题改变后高度 */
let kTitleChangeHeight:CGFloat = 20
/** 标题初始字体大小 */
let kTitleFontSize:CGFloat = 30
/** 标题改变后字体大小 */
let kTitleChangeFontSize:CGFloat = 18
/** 标题初始顶部距离 */
let kTitleTop:CGFloat = 30
/** 标题改变后的顶部距离 */
let kTitleChangeTop:CGFloat = 12

class TodayNavView: UIView {

    let searchBg: UIView = UIView()
    let searchImage: UIButton = UIButton()
    let titleLab: UILabel = UILabel()
    /** 右边按钮背景原始中心点 */
    var rightBtnBGOriginalCenter:CGPoint = CGPoint.zero
    /** 右边按钮背景改变后的中心点 */
    var rightBtnBGChangeCenter:CGPoint = CGPoint.zero
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.height = kNavViewHeight
        setupUI()
    }
    
    private func setupUI() {
        self.rightBtnBGChangeCenter = CGPoint.init(x: self.width-30, y: 22)
        
        titleLab.font = UIFont.boldSystemFont(ofSize: kTitleFontSize)
        titleLab.textColor = .black
        titleLab.textAlignment = .left
        titleLab.text = "今日"
        titleLab.frame = CGRect.init(x: kLeftEdge, y: kTitleTop, width: 100, height: kTitleHeight)
        self.addSubview(titleLab)
        
        searchImage.setImage(UIImage.init(named: "home_search"), for: .normal)
        searchImage.frame = CGRect.init(x: self.right-kRightBtnRight-kRightBtnHeight,
                                        y: kRightBtnTop,
                                        width: kRightBtnHeight,
                                        height: kRightBtnHeight)
        self.addSubview(searchImage)
        
        searchBg.backgroundColor = .theme
        searchBg.frame = CGRect.init(x: searchImage.left + 2,
                                     y: 31,
                                     width: kRightBtnBgHeight,
                                     height: kRightBtnBgHeight)
        self.rightBtnBGOriginalCenter = searchBg.center
        searchBg.layer.cornerRadius = kRightBtnBgHeight * 0.5
        self.insertSubview(searchBg, belowSubview: searchImage)
        
    }
    
    public func navViewDidScroll(offsetY: CGFloat){
        if (offsetY > 0 && offsetY <= kScrollHeight) {
            self.height=kNavViewHeight-offsetY;
            searchImage.top=kRightBtnTop-(offsetY/kScrollHeight)*(kRightBtnTop-kRightBtnChangeTop);
            searchImage.height=kRightBtnHeight-(offsetY/kScrollHeight)*(kRightBtnHeight-kRightBtnChangeHeight);
            searchImage.width=kRightBtnHeight-(offsetY/kScrollHeight)*(kRightBtnHeight-kRightBtnChangeHeight);
            searchImage.right = self.width-kRightBtnRight-(offsetY/kScrollHeight)*(kRightBtnChangeRight-kRightBtnRight);
            searchBg.width=kRightBtnBgHeight-(offsetY/kScrollHeight)*(kRightBtnBgHeight-kRightBtnChangeBgHeight);
            searchBg.height=kRightBtnBgHeight-(offsetY/kScrollHeight)*(kRightBtnBgHeight-kRightBtnChangeBgHeight);
            searchBg.center=CGPoint.init(x: self.rightBtnBGOriginalCenter.x-(offsetY/kScrollHeight)*(self.rightBtnBGOriginalCenter.x-self.rightBtnBGChangeCenter.x), y: self.rightBtnBGOriginalCenter.y-(offsetY/kScrollHeight)*(self.rightBtnBGOriginalCenter.y-self.rightBtnBGChangeCenter.y))
            titleLab.font=UIFont.boldSystemFont(ofSize: kTitleFontSize-(offsetY/kScrollHeight)*(kTitleFontSize-kTitleChangeFontSize))
            titleLab.top=kTitleTop-(offsetY/kScrollHeight)*(kTitleTop-kTitleChangeTop);
            titleLab.height=kTitleHeight-(offsetY/kScrollHeight)*(kTitleHeight-kTitleChangeHeight);
        }else if (offsetY > kScrollHeight){
            self.height=kNavViewHeight-kScrollHeight;
            searchImage.top=kRightBtnChangeTop;
            searchImage.height=kRightBtnChangeHeight;
            searchImage.width=kRightBtnChangeHeight;
            searchImage.right=self.width-kRightBtnChangeRight;
            searchBg.width=kRightBtnChangeBgHeight;
            searchBg.height=kRightBtnChangeBgHeight;
            searchBg.center=rightBtnBGChangeCenter;
            titleLab.font=UIFont.boldSystemFont(ofSize: kTitleChangeFontSize)
            titleLab.top=kTitleChangeTop;
            titleLab.height=kTitleChangeHeight;
        }else{
            self.height=kNavViewHeight;
            searchImage.top=kRightBtnTop;
            searchImage.height=kRightBtnHeight;
            searchImage.width=kRightBtnHeight;
            searchImage.right=self.width - kRightBtnRight;
            searchBg.width=kRightBtnBgHeight;
            searchBg.height=kRightBtnBgHeight;
            searchBg.center=rightBtnBGOriginalCenter;
            titleLab.font=UIFont.boldSystemFont(ofSize: kTitleFontSize)
            titleLab.top=kTitleTop;
            titleLab.height=kTitleHeight;
        }
//        self.rightSecondBtn.top=searchBg.top;
        searchBg.layer.cornerRadius = searchBg.height * 0.5
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
