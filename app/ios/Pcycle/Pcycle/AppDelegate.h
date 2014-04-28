//
//  AppDelegate.h
//  Pcycle
//
//  Created by 郝 源顺 on 14-3-22.
//  Copyright (c) 2014年 Shun. All rights reserved.
//
#import "LoginFacade.h"
#import <UIKit/UIKit.h>

@class PcycleSlidingPanelController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

// 定义Core Data的3个核心API的属性
@property (readonly, strong, nonatomic) NSManagedObjectContext*
managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator*
persistentStoreCoordinator;
- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;
@end
