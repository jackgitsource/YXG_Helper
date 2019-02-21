//
//  Swift_Note.swift
//  YXG_HelperDemo
//
//  Created by  on 2019/2/21.
//  Copyright © 2019 yancy. All rights reserved.
//

import Foundation
/**
 OC 与 Swift的混编
 
 OC 调用swift
 例如在oc项目中创建swift文件会提示你创建桥文件，也可自行创建，如YXG_HelperDemo-Bridging-Header
 然后对工程做一些配置
 要调用的Swift类必须继承自NSObject 不然没法调用
 需要调用Swift的OC类中 导入头文件例如：#import "YXG_HelperDemo-Swift.h" 前面是你的工程名
 然后按照OC语法j调用即可。
 */

/**
 swift里的下划线 _
 
 作用就是各种忽略 待研究
 */


/**
 override 重写关键字
 
 定义一个名为Animal的类，添加一个方法say
 定义一个名字为dog的类 继承自Animal;增加一个name属性，添加初始化方法，以实现对name属性的初始化操作；
 在BasicTestViewController中初始化一只狗的实例，并且设置狗的名称，调用say方法
 对父类的实例方法进行重写
  */
public class Animal {
    func say () {
        print("I am an animal")
    }
}

class Dog: Animal {
    var name : String
    // 添加初始化方法，以实现对name属性的初始化操作
    init (name : String) {
        self.name = name
    }
    
    override func say() {
        print("I am a dog , name is \(name)")
    }
}

/**
 swift里面的空格 要慎用 不是那么随意的 用不好就是报错
 */


/**
 类型安全
 
 swift是类型安全的语言 在编译期进行类型检查，把不匹配的类型标记错误。
 var varA = 42
 varA = "This is hello"
 print(varA)
 error: cannot assign value of type 'String' to type 'Int'
 */

/**
 类型判断
 
 如果你没有显示的指明 swift会选择合适的类型
 let meaningOfLife = 42
 meaningOfLife会被推测为int类型
 */

/**
 可选类型
 
 用于处理值缺失的情况 可选表示“那有一个值，并且它等于x”或者“那没有值”
 这两种写法是相等的
 var optionalInteger: Int?// 注意 两者之间没有空格
 var optionalInteger: Optional<Int>
 Optional 是一个包含两种情况的枚举 None和Some(T) 用来表示可能有或者可能没有值
 
 swift是类型安全的语言 OC是弱类型语言 oc中字符串既可以是nil 也可以是字符串，但是在swift中这两种状态不能同时存在
 oc 和 swift对nil的理解不同
 oc 中nil表示缺少一个合法的对象，是指向不存在的对象的指针！对结构体 枚举类型不起作用
 swift 中nil表示任意类型的值缺失 是一个确定的值 要么是该类型的值 要么是什么都没有

 */
 var optionalStr : String? = "Swift语言可选类型"//声明可选类型字符串 并赋值
 var optionalStr1 : String?// 声明可选类型字符串 赋值nil
/**
 可选类型的强制解析
 
 当你确定自定义的可选类型一定有值时，可以使用操作符(!)进行强制解析，拿到数据
 ！表示：我知道一定有，拿到他。
 但是，当你判断错误，对nil强制解析,运行错误。
 */

/**
 可选类型的自动解析
 
 声明变量时 使用!代替?  这样在变量使用时就不需要加!来强制拆包 他会自动解析
 */

/**
 可选类型的可选绑定 if let
 
 使用可选绑定 摆脱频繁的判断是否为nil 然后再赋值。
 如果包含就把值赋给一个临时常量 或者变量。
 */

/**
 guard let :守护一定有值 如果没有 则直接返回
 */

/**
 as as! as?
 as! 向下转型 强制转换 强制从父类转成子类
 as 向上转型 子类转成父类
 as? 同 as! 但是转换不成功会返回nil 成功返回可选类型 需拆包使用
 */
