//
//  AppDelegate.h
//  Test
//
//  Created by Aleksandr Sychev on 10/03/2019.
//  Copyright © 2019 Aleksandr Sychev. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SwiftyForObjectiveC;
@class QueueForObjectiveC;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) SwiftyForObjectiveC *obj;
@property (strong, nonatomic, nullable) QueueForObjectiveC *queue;

@end

