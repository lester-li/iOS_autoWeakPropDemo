//
//  LSMiddleBlock.m
//  auotWeakPropDemo
//
//  Created by 李小帅 on 2019/11/4.
//  Copyright © 2019年 美好午后. All rights reserved.
//

#import "LSMiddleBlock.h"

@implementation LSMiddleBlock{
    PropValueDeallocB _propValueDeallocB;
}

- (instancetype)init{
    return [self initWithPropValueDeallocB:nil];
}

-(instancetype)initWithPropValueDeallocB:(PropValueDeallocB)propValueDeallocB {
    self = [super init];
    if (self){
        _propValueDeallocB = propValueDeallocB;
    }
    return self;
}

// 当属性值dealloc时候，调用object_dispose() 方法，会处理属性值的关联关系对象。此时本类实例是属性值的关联关系对象。该对象的dealloc 方法被调用。在本类的dealloc 方法，调用回调的callback(block形式).
-(void)dealloc{
    if (_propValueDeallocB != nil) {
        _propValueDeallocB();
    }
}

@end
