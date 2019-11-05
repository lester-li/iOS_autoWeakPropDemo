//
//  Person.h
//  auotWeakPropDemo
//
//  Created by 李小帅 on 2019/11/4.
//  Copyright © 2019年 美好午后. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

@property (nonatomic,unsafe_unretained) NSObject *object;

@end

NS_ASSUME_NONNULL_END
