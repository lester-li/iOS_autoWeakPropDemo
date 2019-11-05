//
//  NSObject+ls_objcetDealloced.m
//  auotWeakPropDemo
//
//  Created by 李小帅 on 2019/11/4.
//  Copyright © 2019年 美好午后. All rights reserved.
//

#import "NSObject+ls_objcetDealloced.h"
#import <objc/runtime.h>

@implementation NSObject (ls_objcetDealloced)

const void * ls_objectDeallocedKey = &ls_objectDeallocedKey;

// 简单实现，咱无法处理注册多个回调
// 如果回调有值，则创建LSMiddleBlock对象，并与属性值绑定关联关系，同步生命周期。（保证两者的dealloc方法同步）
-(void)ls_registDeallocedCallBack:(PropValueDeallocB)propValueDeallocB{
    if (propValueDeallocB) {
        LSMiddleBlock *middle = [[LSMiddleBlock alloc] initWithPropValueDeallocB:propValueDeallocB];
        objc_setAssociatedObject(self, ls_objectDeallocedKey, middle, OBJC_ASSOCIATION_RETAIN);
    }
}

@end
