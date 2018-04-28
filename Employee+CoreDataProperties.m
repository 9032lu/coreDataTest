//
//  Employee+CoreDataProperties.m
//  coreDataTest
//
//  Created by ZhangTu on 2018/4/28.
//  Copyright © 2018年 Test. All rights reserved.
//
//

#import "Employee+CoreDataProperties.h"

@implementation Employee (CoreDataProperties)

+ (NSFetchRequest<Employee *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"Employee"];
}

@dynamic name;
@dynamic birthday;
@dynamic height;
@dynamic depart;

@end
