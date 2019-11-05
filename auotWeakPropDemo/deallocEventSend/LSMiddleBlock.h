//
//  LSMiddleBlock.h
//  auotWeakPropDemo
//
//  Created by 李小帅 on 2019/11/4.
//  Copyright © 2019年 美好午后. All rights reserved.
//
//  1. 封装负责回调的block
//  2. 将本类实例对象与属性值进行关联关系绑定。使得生命周期同步。本类实例dealloc 的调用时机可认为属性值的生命周期结束。调用 dealloc 的回调

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^PropValueDeallocB)(void);

@interface LSMiddleBlock : NSObject

-(instancetype)initWithPropValueDeallocB:(nullable PropValueDeallocB)propValueDeallocB NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END
