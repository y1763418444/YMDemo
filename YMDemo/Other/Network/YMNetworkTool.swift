//
//  YMNetwotkTool.swift
//  Qyt
//
//  Created by msy on 17/4/13.
//  Copyright © 2017年 YM. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

enum RequestTypes {
    case RequestTypesGet
    case RequestTypesPost
    
}
class YMNetworkTool: NSObject {


    // 声明
    static let shareNetworkTool = YMNetworkTool()
    
    // MARK:- 网络请求
    func requestNetwork(method:RequestTypes, path:String, params:[String: AnyObject]? = nil,finished:@escaping (_ successData: JSON?, _ error: NSError?) -> ()){
        // url 路径
        let pathString = String.init(format: "%@%@", HTTPHEADERURL,path)
        
        // 请求方式
        var mode = HTTPMethod.get
        if method == RequestTypes.RequestTypesPost {
            mode = HTTPMethod.post
        }
        
        // 发送请求
        Alamofire.request(pathString, method: mode, parameters: nil).responseJSON { response in
            // 请求失败

            guard response.result.isSuccess else{
                finished(nil,response.result.error as NSError?)
                return
            }
            
            // 请求成功
            if let value = response.result.value{
                let json = JSON(value)
                finished(json, nil)
            }
        }
    }
    
    // MARK:- post请求
    func postRequestNetwork(params:[String:Any], finished:@escaping (_ successData: JSON?, _ error: NSError?) -> ()){
        requestNetwork(method: .RequestTypesPost, path: API_URL, params: params as [String : AnyObject]?, finished: { (successData, error) in
            finished(successData,error)
        })
    }
    
    // MARK:- get请求
    func getRequestNetwork(params:[String:Any], finished:@escaping (_ successData: JSON?, _ error: NSError?) -> ()){
        requestNetwork(method: .RequestTypesGet, path: API_URL, params: params as [String : AnyObject]?, finished: { (successData, error) in
            finished(successData,error)
        })
    }
}
