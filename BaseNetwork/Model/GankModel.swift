//
//  GankModel.swift
//  BaseNetwork
//
//  Created by 严楠楠 on 2018/10/16.
//  Copyright © 2018 严楠楠. All rights reserved.
//

import Foundation
import HandyJSON

struct ContentModel : HandyJSON {
    var _id: String?
    var createdAt: String?
    var desc: String?
    var images: Array<String>?
    var publishedAt: String?
    var source: String?
    var type: String?
    var url: String?
    var used: Bool!
    var who: String?
}


struct TodayModel: HandyJSON {
    var category: Array<String>?
    var error: Bool!
    var results: Dictionary<String, Array<ContentModel>>?
}
