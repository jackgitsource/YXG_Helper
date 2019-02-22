//
//  Learn_lock.m
//  YXG_KitDemo
//
//  Created by  on 2019/2/19.
//  Copyright © 2019 yxg. All rights reserved.
//

#import "Learn_lock.h"

@implementation Learn_lock

// 锁 推荐文章http://www.cocoachina.com/ios/20180301/22402.html
/**
 YYKit组件 大量使用semaphore 和 pthread_mutex
 1. OSSPinLock 自旋锁 被证明不安全 性能最高；原因是do while盲等 会消耗大量CPU资源；不适合长期任务
 2. semaphore 信号量，没有等待情况下 效率很高；一旦有等待情况则 效率大大下降；相对于OSSPinLock 其优点在于 在等待时不消耗cpu资源，也是一种互斥锁。
 3. pthread_mutex c语言的互斥锁 等待任务较长 建议使用 例如磁盘缓存
    YYKit库中大量使用 可参考YYMemoryCache
 */

/**
 锁的概念的引出
 进程：一个进程就是一个正在执行程序的实例 资源分配的最小单元，有运行 就绪 阻塞 三个状态
 线程：可以多个线程 共享同一个地址空间和其他资源 比如全局变量，进程中的不同线程 不像进程之间那样有很大的独立性；严格来说 同一时间只有一个线程占有cpu 只不过高速切换给人们带来并行的假象。
      有运行 就绪 阻塞 三个状态
      每个线程都有自己的堆栈
 */

/**
 自旋锁 互斥锁 概念 区别
 相同点：都以保证同一时间只有一个线程访问资源 都能保证线程安全
 自旋锁：如果共享资源已经有其他线程加锁了 则线程会以死循环的方式等待解锁 一旦被访问的资源被解锁 则等待资源的线程立即执行；
       自旋锁不释放cpu 因此持有自旋锁的线程 应尽快释放自旋锁 否则等待该自旋锁的线程会一直在那里死循环 浪费cpu时间
       线程会反复检查锁边量是否可用，线程在这一过程中保持执行，因此是一种盲等状态。一旦获取了自旋锁，线程会一直持有该锁，直至显式释放该锁。对于线程只会阻塞很短时间的任务是有效的。
 
 互斥锁：如果共享资源已经有其他线程加锁了 则线程进入休眠状态等待解锁 一旦被访问的资源被解锁 则等待资源的线程会被唤醒
        防止多个线程对同一公共资源（譬如全局变量）进行读写。
 自旋锁效率 > 互斥锁效率
 
 条件锁：就是条件变量，某些资源不满足条件则进入休眠，资源被分配到了，条件锁打开，唤醒继续运行。
 
 使用任何锁 都消耗系统资源 内存资源和cpu时间 一般是：建立锁所需要的资源 当线程被阻塞时需要的资源
 */

/**
 OSSPinLock不再安全的原因
 
 自旋锁的优先级反转问题 也是OSSPinLock 不再安全的原因
 放生在：低优先级线程拿到锁时 高优先级线程进入盲等状态 消耗大量的cpu时间 而导致了低优先级线程拿不到cpu时间 则无法完成任务 无法释放锁；这就称为优先级反转。
 那么就不得不说 操作系统如何管理线程调度的
 通常 普通线程 采用时间片轮转算法 每个线程会被分配一段时间片 10-100ms 当线程用完自己的时间以后 就会被操作系统挂起 等待下一次的被分配
 替代方案：苹果在ios推出了os_unfair_lock性能很高 但是需在ios10后使用
 */

/**
 NSLock，NSCondition，NSRecursiveLock 只是基于上面几个的封装
 NSLock，NSConditionLock，NSRecursiveLock，NSCondition Foundition框架中以对象的形式暴露给开发者的一种锁。
 NSLock 是互斥锁
 NSRecursiveLock 是递归锁
 YYKit中YYWebImageOpertion中使用到NSRecursiveLock
 _lock = [NSRecursiveLock new];
 - (void)dealloc {
 [_lock lock];
 ...
 ...
 [_lock unlock];
 }
 
 
 AFNetworking 中的使用
 - (instancetype)initWithSessionConfiguration:(NSURLSessionConfiguration *)configuration {
 ...
 self.lock = [[NSLock alloc] init];
 self.lock.name = AFURLSessionManagerLockName;
 ...
 }
 - (void)setDelegate:(AFURLSessionManagerTaskDelegate *)delegate
 forTask:(NSURLSessionTask *)task
 {
 ...
 [self.lock lock];
 self.mutableTaskDelegatesKeyedByTaskIdentifier[@(task.taskIdentifier)] = delegate;
 [delegate setupProgressForTask:task];
 [self addNotificationObserverForTask:task];
 [self.lock unlock];
 }
 
 
 NSCondition 是条件锁
 遵循NSLocking协议，使用的时候同样是lock,unlock加解锁，wait是傻等，waitUntilDate:方法是等一会，都会阻塞掉线程，signal是唤起一个在等待的线程，broadcast是广播全部唤起。
 */

/**
 @synchronize 是一个OC层面的锁 牺牲性能换来语法上的简洁和可读
 需要传入 一个对象 这个对象的内存地址作为key 通过hash map对应一个系统维护的递归锁
 AFNetworking 中也有使用
 - (BOOL)isNetworkActivityOccurring {
 @synchronized(self) {
 return self.activityCount > 0;
 }
 }
 */

/**
 效率 OSSPinLock 和 semaphore性能最高
 @synchronize 和 NSConditionLock性能最低
 基于性能 可以考虑使用semaphore 不考虑性能 图方便则使用@synchronize
 
 对于OSSPinLock 由于优先级反转问题 苹果在ios推出了os_unfair_lock性能很高 但是需在ios10后使用
 */

/**
 YY大神 针对自旋锁OSSPinLock的优先级反转问题分析
 
 新版 iOS 中，系统维护了 5 个不同的线程优先级/QoS: background，utility，default，user-initiated，user-interactive。
 高优先级线程始终会在低优先级线程前执行，一个线程不会受到比它更低优先级线程的干扰。这种线程调度算法会产生潜在的优先级反转问题，从而破坏了 spin lock。
 具体来说，如果一个低优先级的线程获得锁并访问共享资源，这时一个高优先级的线程也尝试获得这个锁，它会处于 spin lock 的忙等状态从而占用大量 CPU。
 此时低优先级线程无法与高优先级线程争夺 CPU 时间，从而导致任务迟迟完不成、无法释放 lock。
 这并不只是理论上的问题，libobjc 已经遇到了很多次这个问题了，于是苹果的工程师停用了 OSSpinLock。
 最终的结论就是，除非开发者能保证访问锁的线程全部都处于同一优先级，否则 iOS 系统中所有类型的自旋锁都不能再使用了。
 
 替代方案
 除了 OSSpinLock 外，dispatch_semaphore 和 pthread_mutex 性能是最高的
 */

/**
 自旋锁 互斥锁 引用百度百科
 
 何谓自旋锁？它是为实现保护共享资源而提出一种锁机制。其实，自旋锁与互斥锁比较类似，它们都是为了解决对某项资源的互斥使用。无论是互斥锁，还是自旋锁，在任何时刻，
 最多只能有一个保持者，也就说，在任何时刻最多只能有一个执行单元获得锁。但是两者在调度机制上略有不同。对于互斥锁，如果资源已经被占用，资源申请者只能进入睡眠状态。
 但是自旋锁不会引起调用者睡眠，如果自旋锁已经被别的执行单元保持，调用者就一直循环在那里看是否该自旋锁的保持者已经释放了锁，"自旋"一词就是因此而得名。
 
 自旋锁百度百科定义：
 跟互斥锁一样，一个执行单元要想访问被自旋锁保护的共享资源，必须先得到锁，在访问完共享资源后，必须释放锁。如果在获取自旋锁时，没有任何执行单元保持该锁，那么将立即得到锁；
 如果在获取自旋锁时锁已经有保持者，那么获取锁操作将自旋在那里，直到该自旋锁的保持者释放了锁。由此我们可以看出，自旋锁是一种比较低级的保护数据结构或代码片段的原始方式，
 会过多的占用cpu资源 比较适用于锁使用者保持锁时间比较短的情况。
 */
@end
