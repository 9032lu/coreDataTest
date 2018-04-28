//
//  Deparment+CoreDataProperties.m
//  coreDataTest
//
//  Created by ZhangTu on 2018/4/28.
//  Copyright © 2018年 Test. All rights reserved.
//
//

#import "Deparment+CoreDataProperties.h"

@implementation Deparment (CoreDataProperties)

+ (NSFetchRequest<Deparment *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"Deparment"];
}

@dynamic name;
@dynamic number;
@dynamic creatDate;

@end
