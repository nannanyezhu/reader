//
//  ContentTableViewCell.swift
//  BaseNetwork
//
//  Created by 严楠楠 on 2018/10/19.
//  Copyright © 2018 严楠楠. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher
class ContentTableViewCell: UITableViewCell {

    let contentLabel: UILabel = UILabel()
    let imgView: UIImageView = UIImageView()
    let userLabel: UILabel = UILabel()
    let timeLabel: UILabel = UILabel()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    private func setupUI() {
        
    }
    
    
    
    func updateCellInfo(info: ContentModel) {
        
    }
}
