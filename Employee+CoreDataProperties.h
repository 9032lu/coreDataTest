//
//  Employee+CoreDataProperties.h
//  coreDataTest
//
//  Created by ZhangTu on 2018/4/28.
//  Copyright © 2018年 Test. All rights reserved.
//
//

#import "Employee+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Employee (CoreDataProperties)

+ (NSFetchRequest<Employee *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSDate *birthday;
@property (nonatomic) int16_t height;
@property (nullable, nonatomic, retain) Deparment *depart;

@end

NS_ASSUME_NONNULL_END
