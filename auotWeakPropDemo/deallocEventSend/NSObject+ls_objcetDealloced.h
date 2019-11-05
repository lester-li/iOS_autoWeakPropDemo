//
//  NSObject+ls_objcetDealloced.h
//  auotWeakPropDemo
//
//  Created by 李小帅 on 2019/11/4.
//  Copyright © 2019年 美好午后. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LSMiddleBlock.h"

// 对外暴露的接口，一个方法。
// OC对象销毁之前的回调

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (ls_objcetDealloced)

// 注册一个方法销毁之前的回调
-(void)ls_registDeallocedCallBack:(PropValueDeallocB)propValueDeallocB;

@end

NS_ASSUME_NONNULL_END
