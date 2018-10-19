//
//  ApiManager.swift
//  BaseNetwork
//
//  Created by 严楠楠 on 2018/5/25.
//  Copyright © 2018年 严楠楠. All rights reserved.
//

import Foundation
import Alamofire
import SVProgressHUD
import HandyJSON

enum RequestMethod: String {
    case get = "GET"
    case post = "POST"
}


enum GKCategory: String {
    case GKCategoryAll = "all"
    case GKCategoryIOS = "IOS"
    case GKCategoryAndroid = "Android"
    case GKCategoryApp = "App"
    case GKCategoryFrontend = "前端"
    case GKCategoryExplore = "瞎推荐"
    case GKCategoryExt = "拓展资源"
    case GKCategoryVideo = "休息视频"
    case GKCategoryWelfare = "福利"
}


struct NetworkTool {
    fileprivate static func requestJSON(url: String,
                     method: RequestMethod,
                     parameters: [String: AnyObject]?,
                     completion: ((String?, Bool, String?) -> ())? ) {
        guard let m = HTTPMethod(rawValue: method.rawValue) else {
            return
        }
        Alamofire.request(url, method: m,
                          parameters: parameters,
                          encoding: JSONEncoding.default,
                          headers: nil).responseString { (response) in
                            if response.result.isSuccess {
                                if let data = response.result.value {
                                    completion?(data, true, nil)
                                } else {
                                    completion?(nil, true, nil)
                                }
                            } else {
                                SVProgressHUD.showError(withStatus: response.result.error?.localizedDescription);
                                completion?(nil, false, response.result.error?.localizedDescription)
                            }
        }
    }
    /** 获取最新一天的干货*/
    static func getTodayInfo (completion: ((_ category: Array<String> ,_ items: Array<Array<ContentModel>>) -> ())?){
        let url = baseURL + "today"
        NetworkTool.requestJSON(url: url, method: .get, parameters: nil) { (data, success, errorDescribe) in
            if success {
                var sumItems = Array<Array<ContentModel>>()
                if let responseModel = TodayModel.deserialize(from: data){
                    for item: String in responseModel.category ?? [String()] {
                        print(item);
                        if let contentItems = responseModel.results?[item]{
                            sumItems.append(contentItems)
                        }
                    }
                    completion?(responseModel.category ?? [String()],sumItems)
                }
            }
            
        }
    }
    
}

