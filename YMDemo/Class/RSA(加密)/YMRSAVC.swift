//
//  YMRSAVC.swift
//  YMDemo
//
//  Created by msy on 2017/4/20.
//  Copyright © 2017年 YM. All rights reserved.
//


/*
 1生成RSA密钥
     生成RSA私钥
     openssl genrsa -out rsa_private_key.pem 1024
     生成RSA公钥
     openssl rsa -in rsa_private_key.pem -pubout -out rsa_public_key.pem
     pem文件可以直接文本编辑器打开
     将RSA私钥转换成PKCS8格式
     openssl pkcs8 -topk8 -inform PEM -in private_rsa.pem -outform PEM -nocrypt -out private_key.pem
 2设置Search Path
     Header Search Path  ///$(PROJECT_DIR)/YMDemo/Class/RSA(加密)/YMRSAHandler/openssl/include
     Library Search Path ///$(PROJECT_DIR)/YMDemo/Class/RSA(加密)/YMRSAHandler/openssl/include
 3在桥接文件中导入 YMRSAHandler.h文件(swift)
 4正确调用 RSA加密 或 RSA+MD5加密
*/

import UIKit

class YMRSAVC: YMBaseVC {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var result1Text: UILabel!
    @IBOutlet weak var result2Text: UILabel!
    
    // 加密
    let handler = YMRSAHandler()
    
    // MARK:- 加密
    @IBAction func encryptionClick(_ sender: UIButton) {
        if textField.text!.characters.count > 0 {
            let result = handler.encrypt(withPublicKey: textField.text)
            result1Text.text = result
        }
    }
    // MARK:- 解密
    @IBAction func decryptClick(_ sender: UIButton) {
        if result1Text.text!.characters.count > 0 {
            let result = handler.decrypt(withPrivatecKey: result1Text.text)
            result2Text.text = result
        }
    }
    // MARK:- 签名
    @IBAction func autographClick(_ sender: UIButton) {
        if textField.text!.characters.count > 0 {
            let result = handler.sign(textField.text)
            result1Text.text = result
        }
    }
    // MARK:- 验证签名
    @IBAction func verifySignatureClick(_ sender: UIButton) {
        if result1Text.text!.characters.count > 0  && textField.text!.characters.count > 0 {
            let result = handler.verifyString(textField.text, withSign: result1Text.text)
            if result {
                result2Text.text = "验证签名成功"
            }else {
                result2Text.text = "验证签名失败"
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navTitleLabel.text = "RSA加密"
        
        // 本测试只使用了RSA签名  未用MD5+RSA签名  如用 请自行替换签名和验证签名方法
        ///// 第一种方法(选其一)
        // 路径
        let publicKeyFilePath = Bundle.main.path(forResource: "rsa_public_key.pem", ofType: nil)
        let privateKeyFilePath = Bundle.main.path(forResource: "rsa_private_key.pem", ofType: nil)
        
        // 配置路径
        handler.importKey(with: KeyTypePublic, andPath: publicKeyFilePath)
        handler.importKey(with: KeyTypePrivate, andPath: privateKeyFilePath)
        
        
        ///// 第二种方法(选其一)
        // 字符串
        let public_key_string = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQC4L/7MhR99+yswtvSr0dKenD/oJUaow2AEJ6OYn2n12Y4H9RIQY2W5Sr/h4iwMzQTpWFNT5y7jjpGY+qYNQOR1GS6bG2GuTMK9W1BwC41y2gd0xwqWV+df2+S9eHqxqOdib/4/+t2JYxLTJvAC5pGPEvt3z8RXmO8mvtlVzBLaZQIDAQAB"
        let private_key_string = "MIICdQIBADANBgkqhkiG9w0BAQEFAASCAl8wggJbAgEAAoGBALgv/syFH337KzC29KvR0p6cP+glRqjDYAQno5ifafXZjgf1EhBjZblKv+HiLAzNBOlYU1PnLuOOkZj6pg1A5HUZLpsbYa5Mwr1bUHALjXLaB3THCpZX51/b5L14erGo52Jv/j/63YljEtMm8ALmkY8S+3fPxFeY7ya+2VXMEtplAgMBAAECgYAguvauZWGpQ37zUy+7cLfa061PlYAu8TkYw+qAbqOnupdQtq4VF3S2LqBWhZiKVcxvovB70nM0oNsisjfb1xJBpyfDBFug7d+y2f8yr6aTOezoY5DBYEF3Svg9Kp9ra+vvAYX/7fh+tHCU0HOvp0z8ikZiRSWZaQ+3A2GiCIJrwQJBAPKVji89hGAMEWLJJFZaPiLBqZUwR2W/rp7Ely5ddKfjcosHhggHfOb71BnrMOm0h4S85Gx6a87n9R2To0c51q0CQQDCX6yYdt/9JGORyNSXfzMfSZyVOrMpIo77R0YwKa3UOwwLA56l2Lc4AYO10/lyAyZCKse2/5D9ZZUB7xoYEmGZAkB8MEJVPuoY/bSc3RqENrjetERsAwZaObJcx4oaC3AgTxmhwV1FmQfBfKTODBDDZE+Ijedm/ZlZmHhtBtstKJgVAkBKma/DgHRtUscIT90QHBjB3F3FhJb4pbPcyzksCQMXXmY73/LG0ktXqnUjlyy4zm6jnIm0OZgrOQ6chGkubfeZAkBMCGF2tPfEJh8XODOvlw5ADnUiq+Qe/abcpKowkiT9zP+rYT9XJAx7QxChjdwTZb6ahnJY1+ny1emEHUOs2fm8"
        
        // 配置字符串
        handler.importKey(with: KeyTypePublic, andkeyString: public_key_string)
        handler.importKey(with: KeyTypePrivate, andkeyString: private_key_string)
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
