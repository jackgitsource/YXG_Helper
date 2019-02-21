//
//  Learn_network.m
//  YXG_KitDemo
//
//  Created by  on 2019/2/20.
//  Copyright © 2019 yxg. All rights reserved.
//

#import "Learn_network.h"

@implementation Learn_network

// 网络
/**
 http 单向请求无状态的协议 每一次客户端向服务端发送请求都需要经历 建立连接 发送请求 返回数据 关闭连接几个阶段。
 
 如果需要服务端主动向客户端进行推送服务 就是长连接
 比如 im 苹果的apns推送
 长连接的特点是 一旦通过三次握手建立连接 则该链路一直存在 而且是一种双向的通信机制 适用于频繁的网络请求
 也避免了 http每一次请求都要建立连接 和 关闭连接的操作
 
 长连接一般是基于 tcp 或者 udp协议
 
 苹果推送原理
 1.iOS应用注册推送 从apns服务器获取devicetoken;
 2.将devicetoken 传给应用服务器
 3.在需要推送的时候，业务服务器向apns服务器发消息（传devicetoken），apns消息向设备发消息(依据devicetoken找到具体设备)
 
 具体代码
 注册推送 是[[UIApplication sharedApplication] registerForRemoteNotifications]; 然后注册成功则 通过代理方法获取devicetoken
 
 apns的原理是什么呢
 
 APNS 是 apple push notification service 的简称 是远程推送功能的核心 通过apns客户端和苹果服务器建立一个长连接 推送就是通过这个长连接发送到客户端上
 devicetoken 是一个设备的标志符 每一个app在不同的设备上 devicetoken是不同的 通过注册远程推送服务 可以从apns获取你的devicetoken
 devicetoken不是唯一不变的 当你的手机更新系统后 就会发生变化
 为保证安全性 apns用连接信任和token信任 来控制通信入口
 
 换个角度介绍这个流程
 1.推送服务器 把devicetoken，要发送的消息发送给apns服务器
 2.apns服务器 在已注册的iphone列表中 依据deveictoken 查找到相应的设备 把消息发送到设备
 3.iphone把相应的消息发送给应用程序 弹出通知。
 
 
 */
@end
