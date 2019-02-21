//
//  BasicTestViewController.swift
//  YXG_HelperDemo
//
//  Created by  on 2019/2/21.
//  Copyright © 2019 yancy. All rights reserved.
//

import UIKit

class BasicTestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // 设置背景颜色
        self.view.backgroundColor = UIColor.yellow
        
        
        // 重写实例方法
        let zangao = Dog(name: "藏獒");
        zangao.say()
        
        
        // 可选类型的强制解析
        var myStr : String?
        myStr = "强制解析，一定有值"
        if myStr != nil {
           print(myStr!)
        } else {
            print("mystr为nil")
        }
        
        
        // 可选类型的自动解析
        var myStr1:String! //使用！修饰
        myStr1="自动解析"
        if myStr1 != nil {
            print(myStr1)
        }else{
            print("字符串为nil")
        }
        
        
        
        // 可选绑定 if let
        var myStr2 : String?
        myStr2 = "可选绑定"
        if let tempStr = myStr2 {
            print(tempStr)
        } else {
            print("mystr2空的")
        }
        
        
        // 可选绑定的另一种 guard let
        let name : String? = "张三"
        let age : Int? = 100
        guard let newName = name ,
              let newAge = age
        else {
            // 运行到这里 肯定没值
            return;
        }
        // 运行到这里肯定有值
        print("name age 有值===\(newAge) ==\(newName)")
    }

}
