//
//  YMCHViewController.m
//  YMDemo
//
//  Created by msy on 2017/4/19.
//  Copyright © 2017年 YM. All rights reserved.
//

#import "YMCHViewController.h"

typedef void(^RunloopBlock)(void);

@interface YMCHViewController ()
@property(nonatomic,strong)NSTimer *timer;
@property(nonatomic,strong)NSMutableArray *tasks;
@property(nonatomic,assign)NSInteger max;
@end

@implementation YMCHViewController
- (void)timerMethod{
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tasks = [NSMutableArray new];
    self.max = 10;
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.001 target:self selector:@selector(timerMethod) userInfo:nil repeats:YES];
}
- (void)addTask:(RunloopBlock)task{
    [self.tasks addObject:task];
    if (self.tasks.count > self.max) {
        [self.tasks removeObjectAtIndex:0];
    }
}
void CallBack(CFRunLoopObserverRef observer, CFRunLoopActivity activity, void *info){
    YMCHViewController *vc = (__bridge YMCHViewController*)info;
    if (vc.tasks.count == 0){
        return;
    }
    RunloopBlock task = vc.tasks.firstObject;
    task();
    [vc.tasks removeObjectAtIndex:0];
}

- (void)addRunloopObserver{
    // 当前线程
    CFRunLoopRef runloop = CFRunLoopGetCurrent();
    // 上下文
    CFRunLoopObserverContext context = {
        0,
        (__bridge void *)(self),
        &CFRetain,
        &CFRelease,
        NULL
    };
    static CFRunLoopObserverRef defultModeObserver;
    // 创建观察者
    defultModeObserver = CFRunLoopObserverCreate(NULL, kCFRunLoopAfterWaiting, YES, 0, &CallBack, &context);
    // 添加观察者
    CFRunLoopAddObserver(runloop, defultModeObserver, kCFRunLoopCommonModes);
    CFRelease(defultModeObserver);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
