//
//  ViewController.m
//  auotWeakPropDemo
//
//  Created by 李小帅 on 2019/11/4.
//  Copyright © 2019年 美好午后. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import <objc/runtime.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    Person *p = [Person new];
    NSObject *obj = [NSObject new];
//指针p指向的对象，通过关联对象持有 obj 对象
    p.object = obj;
//指针p持有的对象obj被制空，此时，其会被销毁，obj的deallco方法会被调用
    obj = nil;
    NSLog(@"%p",p);
}


@end
