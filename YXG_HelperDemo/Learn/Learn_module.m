//
//  Learn_module.m
//  YXG_KitDemo
//
//  Created by  on 2019/2/19.
//  Copyright © 2019 yxg. All rights reserved.
//

#import "Learn_module.h"

@implementation Learn_module
/**
 组件化
 组件化之路的由来 或者说是组件化要解决什么
 比如类似商城首页 主ViewController 其头部是Banner 中间是热门活动 底部是列表 假如这三个业务由三个类实现 则ViewController要import这三个类。耦合诞生
 然后 要进入详情页吧 假如能进入十个页面 是不是又要import十个ViewController 。耦合诞生
 长此以往 耦合相当严重 错综复杂
 为了解决类似的问题 组件化思想诞生
 
 下面说的 模块 和 组件 是一个意思
 */

/**
 什么是项目架构
 MVVM MVC MVP 等等等一系列是架构吗？NO 这些知识代码的一种组织形式，并不能算是项目架构。
 项目架构 需要你站在更高的角度去统筹 规划项目 该如何去分层，哪一层在上 哪一层在下呢？
 
 一般需要根据产品 来对项目划分不同的层次 譬如
 
 
 
 业务层A 业务层B 业务层C 业务层D
 中间层
 通用业务层
 可以脱离APP的底层
 
 
 
 
 可以脱离APP的底层 譬如YXG_helper 网络请求的封装等
 通用业务层 顾名思义就是可以提供给业务ABCD使用的业务类代码
 中间层 则起到协调以及解耦和的作用 协调组件之间的通讯 解除组件之间的耦合 中间层就是组件化方案的落脚点。
 
 
 要思考的问题有1.中间层怎么去转发组件之间的调用 2.一个模块和中间层进行通信 怎么知道另一个模块提供了什么接口 3.模块和中间层之间相互依赖 怎么破除这个依赖？
 思路：runtime的反射调用 这样可以做到中间层对模块的0依赖 看下面例子
 + (UIViewController *)BookDetailComponent_viewController:(NSString *)bookId {
 Class cls = NSClassFromString(@"BookDetailComponent");
 return [cls performSelector:NSSelectorFromString(@"detailViewController:") withObject:@{@"bookId":bookId}];
 }
 + (UIViewController *)ReviewComponent_viewController:(NSString *)bookId type:(NSInteger)type {
 Class cls = NSClassFromString(@"ReviewComponent");
 return [cls performSelector:NSSelectorFromString(@"reviewViewController:") withObject:@{@"bookId":bookId, @"type": @(type)}];
 }
 拓展一下：既然使用runtime可以摆脱依赖 直接在每个组件类里面使用runtime不就好了 还要个组件干什么？答案是由于各个方法的参数啊类型啊等等都不一样，要传dictionary，key value不明确 很不好管理。调用起来很费劲。使用中间层 加一个dictionary参数即可 便于管理。
 
 至此 +++++++++++++++实现了中间件对组件的0依赖，各组件之间0依赖 。而各组件只需要依赖中间件即可 只需要导入一次中间件。++++++++++++++++++++
 

 
 基本的框架搭建完成 但是这不是架构 只是架构的一小部分。MVVM等设计模式 也只是架构的一小部分而已。
 
 下面就是要仔细研究中间层的编写 寻求一种最好的方案。
 优化1. runtime方法可以抽取出来
 优化2. 每个组件都需要在中间件里面写一遍，这样中间件就变得很长；优化采用casa的方案：第一是Target-action target就是class action就是selector,第二是category,每个组件写一个中间件的category，这样就不至于很长。
 
 
 
 
 
 */

/**
 如何管理你的基础组件
 1. 类似AFNetworking YYKit 这种脱离app的第三方库 尽可能使用cocoapods管理
 2. 对第三方组件进行的二次封装 或者是属于你个人封装的一些工具 也是脱离app的 也尽可能使用cocopods管理
 3. 开发业务时 我们也可以抽出一些UI库 例如banner、快速创建控件的block 自定义弹窗 高效的头像 键盘封装 等等 也尽可能使用cocopods管理
 在整理这些基础组件时 势必会很恶心 因为改动很大 但是组件化需要这些工作来铺路 一旦做好 以后更加方便 还可以形成自己的库
 */

/**
 管理业务组件
 既然 我们的基础组件可以使用cocopods管理 业务组件也可以使用cocopods来管理
 回顾上面的基本架构层 最顶层是四条业务线ABCD 那么我们可以让每条业务线对应一个pods库
 打包私有库的时候 repo的检查相当的严格 不属于这个repo的类是无法打包成功的 所以必须把各业务线的代码进行归类 属于这条业务线的代码就划分进来 否则通不过。
 
 那么 业务A 调用业务B的代码 怎么办 ？答案是中间层 也就是组件之间的通信
 */

/**
 组件之间的通信
 1.URL Router
 2.Target-Action
 3.面向接口编程
 */
@end
