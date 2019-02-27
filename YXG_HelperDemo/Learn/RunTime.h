//
//  RunTime.h
//  YXG_HelperDemo
//
//  Created by  on 2019/2/26.
//  Copyright © 2019 yancy. All rights reserved.
//

#ifndef RunTime_h
#define RunTime_h


#endif /* RunTime_h */
/**
 runtime的反射调用
 反射 一般表现在：字符串和Class的转换 字符串和内部方法的转换 字符串和属性的转换
 执行函数为例子：[Class doSomething] 实际上是runtime 根据函数字符串名和类的字符串名去匹配真正的响应的方法和地址 然后执行。所以中间我们可以利用字符串去动态的检测和动态的修改
 
 Class __nullable NSClassFromString(NSString *aClassName);
 -(BOOL)isKindOfClass:(Class)aClass;
 -(BOOL)isMemberOfClass:(Class)aClass;
 - (BOOL)respondsToSelector:(SEL)aSelector  判断类型或对象有没有某个方法
 + (BOOL)instancesRespondToSelector:(SEL)aSelector; //判断静态方法
 - (id)performSelector:(SEL)aSelector  动态调用对象的方法
 - (BOOL)conformsToProtocol:(Protocol *)aProtocol; 判断对象是否实现某个Protocol协议
 //动态生成方法选择器
 SEL sel =  NSSelectorFromString(@"setAge:");
 //动态调用有参数的方法
 [stu  performSelector:@selector(setAge:) withObject:@"2"];

 OC中属性的反射通过KVC（Key-Value Coding）机制实现，KVC是一种间接访问对象属性的机制,不直接调用getter 和 setter方法，
 而使用valueForKey 来替代getter 方法，setValue:forKey来代替setter方法。
 
 */
