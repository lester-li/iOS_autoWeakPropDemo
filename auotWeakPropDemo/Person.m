//
//  Person.m
//  auotWeakPropDemo
//
//  Created by 李小帅 on 2019/11/4.
//  Copyright © 2019年 美好午后. All rights reserved.
//

#import "Person.h"
#import "NSObject+ls_objcetDealloced.h"
#import <objc/runtime.h>

@implementation Person

const void *objectKey = &objectKey;

-(void)setObject:(NSObject *)object{
    objc_setAssociatedObject(self, objectKey, object, OBJC_ASSOCIATION_ASSIGN);
//    tips：在llvm中调试寻找objc_getAssociatedObject(self,"_object")仍然是nil。通过代码手动获取能够拿到 object 。不清楚原因
//    此处是将 Person 实例和 object 建立关联关系，p->object 仍然是nil
//    猜测 关联对象 和 属性实现是在实例内存中是两种机制，互不影响
    id result = objc_getAssociatedObject(self, objectKey);
    NSLog(@"object is %p \n result is %p \n _object is %p",object,result,_object);
//    object 注册一个回调，当object 被销毁之前，调用这个回调。此时，将Person 的实例制空
    [object ls_registDeallocedCallBack:^{
        self->_object = nil;
        objc_setAssociatedObject(self, objectKey, nil, OBJC_ASSOCIATION_ASSIGN);
    }];
}

@end
