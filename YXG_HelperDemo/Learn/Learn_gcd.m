//
//  Learn_gcd.m
//  YXG_KitDemo
//
//  Created by  on 2019/2/19.
//  Copyright © 2019 yxg. All rights reserved.
//

#import "Learn_gcd.h"

@implementation Learn_gcd

// 信号量
/**
 理解
 dispatch_semaphore_t(count) 创建一个，参数count必须大于或者等于0 否则会返回NULL; count代表信号量资源池的初始数量 而非一个范围
 count < 0 返回NULL;
 count = 0 多线程在等待某个特定线程的结束；阻塞当前线程 等待信号资源到来
 count > 0 资源数量，可以由多个线程使用
 
 long dispatch_semaphore_signal 发送一个信号 会使得count加1； 可以理解为释放一个资源；返回值为0表示没有线程等待这个信号量；非0表示唤醒一个等待这个信号量的线程
 long dispatch_semaphore_wait 等待信号 执行则会使count减1；如果count的值等于0 则会阻碍当前线程等待timeout；如果等待期间count被dispatch_semaphore_signal加1了并且dispatch_semaphore_wait所处的县城获取了信号量，那么则继续向下执行，且使count减1；如果等待timeout后仍然没等到信号量过来则自动执行后面的语句。
 */

/**
 那么 使用dispatch_semaphore_t加锁 为何是count=0 应该怎么理解
 dispatch_semaphore_create(0) 表示创建信号量且初始信号量资源池数量为count=0，则直接阻塞当前线程，然后等待某个业务逻辑完成调用dispatch_semaphore_signal释放信号，count=1使得线程被唤醒 继续做事；
 */

/**
 当然 使用信号量 很可能会造成死锁 这个要注意 可以看自己写的文章
 */

/**
 一定要把这个理解正确 这是在执行一个函数long dispatch_semaphore_wait，传入一个semaphore和一个时间；而不是摆在这里的一句话；若semaphore的信号量为0 则会阻塞当前线程；>0则往下走 并且把semphore的信号量减1；
 同理dispatch_semaphore_signal也是在执行，接收一个信号semaphore，使semaphore的信号量加1；
 */

/**
 常用的情景 1.加锁 count初始为0 2.控制最大并发数量 初始值为n
 
 下面比喻 解释的很好
 
 停车场剩余4个车位，那么即使同时来了四辆车也能停的下。如果此时来了五辆车，那么就有一辆需要等待。
 
 信号量的值就相当于剩余车位的数目，dispatch_semaphore_wait函数就相当于来了一辆车，dispatch_semaphore_signal
 
 就相当于走了一辆车。停车位的剩余数目在初始化的时候就已经指明了（dispatch_semaphore_create（long value）），
 
 调用一次dispatch_semaphore_signal，剩余的车位就增加一个；调用一次dispatch_semaphore_wait剩余车位就减少一个；
 
 当剩余车位为0时，再来车（即调用dispatch_semaphore_wait）就只能等待。有可能同时有几辆车等待一个停车位。有些车主
 
 没有耐心，给自己设定了一段等待时间，这段时间内等不到停车位就走了，如果等到了就开进去停车。而有些车主就像把车停在这，
 
 所以就一直等下去。
 */

- (instancetype)init {
    self = [super init];
    if (self) {
    }
    return self;
}

@end
