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
//        let pathString = String.init(format: "%@%@", HTTPHEADERURL,path)
        let pathString = "http://app.ghs.net/index.php/api?province_code=110000&uuid=9696fd0a61783407d09325ff8c8ff89bcefa23d4&sku=9131554&member_id=54189&umeng_channel=真机测试&sign=E14A86D49FAB87838F7BA38CB0B1B082&device_type=827384&method=b2c.cart2.goods_gift&version=2.6.0&hardware=iPhone5,2&software=10.2.1"
        // 请求方式
        var mode = HTTPMethod.get
        if method == RequestTypes.RequestTypesPost {
            mode = HTTPMethod.post
        }

        Alamofire.request(pathString,method: .get).responseJSON { (resp) in
            print(resp)
        }
//        // 发送请求
//        Alamofire.request(pathString, method: mode, parameters: nil).responseJSON { response in
//            // 请求失败
//
//            guard response.result.isSuccess else{
//                finished(nil,response.result.error as NSError?)
//                return
//            }
//            
//            // 请求成功
//            if let value = response.result.value{
//                let json = JSON(value)
//                finished(json, nil)
//            }
//        }
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
//定义一个结构体，存储认证相关信息
struct IdentityAndTrust {
    var identityRef:SecIdentity
    var trust:SecTrust
    var certArray:AnyObject
}

extension YMNetworkTool:URLSessionDelegate{
    
    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        //认证服务器证书
        if challenge.protectionSpace.authenticationMethod
            == (NSURLAuthenticationMethodServerTrust) {
            print("服务端证书认证！")
            let serverTrust:SecTrust = challenge.protectionSpace.serverTrust!
            let certificate = SecTrustGetCertificateAtIndex(serverTrust, 0)!
            let remoteCertificateData
                = CFBridgingRetain(SecCertificateCopyData(certificate))!
            let cerPath = Bundle.main.path(forResource: "server",
                                                                ofType: "cer")!
            let localCertificateData = NSData(contentsOfFile:cerPath)!
            
            if (remoteCertificateData.isEqual(localCertificateData as Data) == true) {
                let credential = URLCredential.init(trust: serverTrust)
                challenge.sender?.use(credential,
                                      for: challenge)
                completionHandler(URLSession.AuthChallengeDisposition.useCredential,
                                  URLCredential.init(trust: challenge.protectionSpace.serverTrust!))
            } else {
                completionHandler(.cancelAuthenticationChallenge, nil)
            }
        }
            
            //认证客户端证书
        else if challenge.protectionSpace.authenticationMethod
            == NSURLAuthenticationMethodClientCertificate
        {
            print("客户端证书认证！")
            //获取客户端证书相关信息
            let identityAndTrust:IdentityAndTrust = self.extractIdentity();
            
            let urlCredential:URLCredential = URLCredential(
                identity: identityAndTrust.identityRef,
                certificates: identityAndTrust.certArray as? [AnyObject],
                persistence: URLCredential.Persistence.forSession);
            
            completionHandler(.useCredential, urlCredential);
        }
            
            // 其它情况（不接受认证）
        else {
            print("其它情况（不接受认证）")
            completionHandler(.cancelAuthenticationChallenge, nil);
        }
    }
    
    //获取客户端证书相关信息
    func extractIdentity() -> IdentityAndTrust {
        var identityAndTrust:IdentityAndTrust!
        var securityError:OSStatus = errSecSuccess
        
        let path: String = Bundle.main.path(forResource: "mykey", ofType: "p12")!
        let PKCS12Data = NSData(contentsOfFile:path)!
        let key : NSString = kSecImportExportPassphrase as NSString
        let options : NSDictionary = [key : "123456"] //客户端证书密码
        //create variable for holding security information
        //var privateKeyRef: SecKeyRef? = nil
        
        var items : CFArray?
        
        securityError = SecPKCS12Import(PKCS12Data, options, &items)
        
        if securityError == errSecSuccess {
            let certItems:CFArray = items as CFArray!;
            let certItemsArray:Array = certItems as Array
            let dict:AnyObject? = certItemsArray.first;
            if let certEntry:Dictionary = dict as? Dictionary<String, AnyObject> {
                // grab the identity
                let identityPointer:AnyObject? = certEntry["identity"];
                let secIdentityRef:SecIdentity = identityPointer as! SecIdentity!;
                print("\(String(describing: identityPointer))  :::: \(secIdentityRef)")
                // grab the trust
                let trustPointer:AnyObject? = certEntry["trust"];
                let trustRef:SecTrust = trustPointer as! SecTrust;
                print("\(String(describing: trustPointer))  :::: \(trustRef)")
                // grab the cert
                let chainPointer:AnyObject? = certEntry["chain"];
                identityAndTrust = IdentityAndTrust(identityRef: secIdentityRef,
                                                    trust: trustRef,
                                                    certArray:  chainPointer!);
            }
        }
        return identityAndTrust;
    }
}
