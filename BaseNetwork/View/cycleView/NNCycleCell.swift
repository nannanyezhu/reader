//
//  NNCycleCell.swift
//  BaseNetwork
//
//  Created by 严楠楠 on 2018/10/18.
//  Copyright © 2018 严楠楠. All rights reserved.
//

import UIKit
import Kingfisher

class NNCycleCell: UICollectionViewCell {
    
    fileprivate var imgView: UIImageView!
    fileprivate var descLabel: UILabel!
    fileprivate var bottomView: UIView!
    var placeholderImage: UIImage?
    
    //=======================================================
    // MARK: setter
    //=======================================================
    var imgSouce: String? {
        didSet{
            imgView.kf.setImage(with: URL.init(string: imgSouce ?? ""))
        }
    }
    
    var descText: String? {
        didSet{
            descLabel.isHidden = (descText == nil) ? true : false
            bottomView.isHidden = (descText == nil) ? true : false
            descLabel.text = descText
        }
    }
    override var frame: CGRect{
        didSet{
            bounds.size = frame.size
        }
    }
    var imageContentModel: UIView.ContentMode = .scaleAspectFill{
        didSet{
            imgView.contentMode = imageContentModel
        }
    }
    var descLabelFont: UIFont = UIFont(name: "Helvetica-Bold", size: 18)!{
        didSet{
            descLabel.font = descLabelFont
        }
    }
    var descLabelHeight: CGFloat = 24{
        didSet{
            descLabel.height = descLabelHeight
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupImgView()
        setupDescLabel()
        setupBottomView()
        backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func updateCellInfo(info: NNCycleModel) {
        imgSouce = info.photo
        descText = info.title
    }
}


extension NNCycleCell {
    fileprivate func setupImgView() {
        imgView = UIImageView()
        imgView.contentMode = imageContentModel
        imgView.clipsToBounds = true
        addSubview(imgView)
    }
    
    fileprivate func setupDescLabel() {
        descLabel = UILabel()
        descLabel.left = 0
        descLabel.top = 10
        descLabel.text = descText
        descLabel.numberOfLines = 0
        descLabel.font = descLabelFont
        descLabel.textColor = .color999
        descLabel.height = descLabelHeight
        descLabel.textAlignment = .left
        addSubview(descLabel)
        descLabel.isHidden = true
    }
    
    fileprivate func setupBottomView() {
        bottomView = UIView()
        bottomView.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        addSubview(bottomView)
        bottomView.isHidden = true
    }
}
