//
//  Deparment+CoreDataProperties.h
//  coreDataTest
//
//  Created by ZhangTu on 2018/4/28.
//  Copyright © 2018年 Test. All rights reserved.
//
//

#import "Deparment+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Deparment (CoreDataProperties)

+ (NSFetchRequest<Deparment *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSString *number;
@property (nullable, nonatomic, copy) NSDate *creatDate;

@end

NS_ASSUME_NONNULL_END
