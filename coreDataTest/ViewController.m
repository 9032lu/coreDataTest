//
//  ViewController.m
//  coreDataTest
//
//  Created by ZhangTu on 2018/4/28.
//  Copyright © 2018年 Test. All rights reserved.
//

#import "ViewController.h"
#import <CoreData/CoreData.h>
#import "Employee+CoreDataClass.h"
#import "Deparment+CoreDataClass.h"

@interface ViewController ()
{;
    Deparment *iosDepart;
    Deparment *androidDepart;
}
@property (nonatomic,strong) NSManagedObjectContext *context;//**
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //1穿件数据模型
    //获取模型路径
    NSURL  *model_Url = [[NSBundle mainBundle]URLForResource:@"Model" withExtension:@"momd"];
    //根据模型创建模型对象
    NSManagedObjectModel *objModel = [[NSManagedObjectModel alloc]initWithContentsOfURL:model_Url];
    
    //创建数据库助理对象
    NSPersistentStoreCoordinator *store = [[NSPersistentStoreCoordinator alloc]initWithManagedObjectModel:objModel];
    
    //获取数据库名称地址
    NSString *docStr = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    
    NSString *sqlPath = [docStr stringByAppendingPathComponent:@"Data.sqlite"];
    
    NSLog(@"path ==%@",sqlPath);
    
    NSURL *sqlUrl  = [NSURL fileURLWithPath:sqlPath];
    
    NSError *error= nil;
    [store addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:sqlUrl options:nil error:&error];
    
    if (error) {
        NSLog(@"添加数据库失败");
    }else{
        NSLog(@"添加数据库成败");
    }
    
   
    //创建上下文
    NSManagedObjectContext *context = [[NSManagedObjectContext alloc]initWithConcurrencyType:NSMainQueueConcurrencyType];
    
    //关联助理
    context.persistentStoreCoordinator = store;
    self.context = context;
    
    
    
    
    iosDepart = [NSEntityDescription insertNewObjectForEntityForName:@"Deparment" inManagedObjectContext:self.context];
    iosDepart.name = @"ios";
    iosDepart.number = @"001";
    iosDepart.creatDate = [NSDate date];
    
    androidDepart = [NSEntityDescription insertNewObjectForEntityForName:@"Deparment" inManagedObjectContext:self.context];
    androidDepart.name = @"android";
    androidDepart.number = @"002";
    androidDepart.creatDate = [NSDate date];
    
    [self.context save:nil];
    


}

- (IBAction)add:(id)sender {
    
    //创建两个部门 iOS android
 
    //创建两个员工 张三iOS， 李四 android
    
    Employee *zhangsan = [NSEntityDescription insertNewObjectForEntityForName:@"Employee" inManagedObjectContext:_context];
    
    zhangsan.name = @"张三";
    zhangsan.height = 176;
    zhangsan.birthday = [NSDate date];
    
    zhangsan.depart =  arc4random_uniform(2)? androidDepart:iosDepart;
    
    
    Employee *lisi = [NSEntityDescription insertNewObjectForEntityForName:@"Employee" inManagedObjectContext:self.context];
    lisi.name = @"李四";
    lisi.height = 188;
    lisi.birthday = [NSDate date];
    lisi.depart = androidDepart;
    
    
    
    [self.context save:nil];
}



- (IBAction)delet:(id)sender {
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Employee"];
    request.predicate = [NSPredicate predicateWithFormat:@"name = %@",@"张三"];
    
    NSArray *arr =  [self.context executeFetchRequest:request error:nil];
    
    
    NSLog(@"----%@",arr);
    for (Employee *emp in arr) {
        [self.context deleteObject:emp];
    }
    
    [self.context save:nil];
}
- (IBAction)change:(id)sender {
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Employee"];
    request.predicate = [NSPredicate predicateWithFormat:@"name = %@",@"张三"];
    
    NSArray *arr =  [self.context executeFetchRequest:request error:nil];
    NSLog(@"----%@",arr);

    for (Employee *emp in arr) {
        emp.height = 10;
    }
    
    [self.context save:nil];
    
    
    
    
}
- (IBAction)search:(id)sender {
    
    //1:FectchRequest 抓取请求对象
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Employee"];
    //2:设置过滤条件
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"depart.name = %@",@"ios"];
    request.predicate = pre;
    //3:设置排序
    //    NSSortDescriptor *height = [NSSortDescriptor sortDescriptorWithKey:@"height" ascending:YES];
    //    request.sortDescriptors = @[height];
    
    //4:执行请求
    NSArray *emps = [self.context executeFetchRequest:request error:nil];
    //遍历查询结果
    for (Employee  *emp in emps) {
        NSLog(@"名字：%@,身高：%d,生日：%@",emp.name,emp.height,emp.birthday);
    }
    
}



@end
