//
//  ViewController.m
//  Test
//
//  Created by Aleksandr Sychev on 10/03/2019.
//  Copyright © 2019 Aleksandr Sychev. All rights reserved.
//

#import "ViewController.h"

#import "Test-Swift.h"

@interface ViewController ()

- (SwiftyForObjectiveC *)createMySwiftObject;
- (QueueForObjectiveC *)createQueueSwift;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	SwiftyForObjectiveC *variable = [self createMySwiftObject];
	NSInteger result = [variable sum];
	NSLog(@"%ld", result);
    
    QueueForObjectiveC *queue = [self createQueueSwift];
    [queue addElement:@"First Element"];
    NSLog(@"%@", queue[0]);
    [queue addElement:@"Second Element"];
    NSLog(@"%@", [queue front]);
    NSInteger count = [queue count];
    NSLog(@"Count before pop = %ld", count);
    NSString *popValue = [queue pop];
    NSLog(@"Pop value = %@", popValue);
    NSInteger count2 = [queue count];
    NSLog(@"Count after pop = %ld", count2);
}

- (SwiftyForObjectiveC *)createMySwiftObject {
	SwiftyForObjectiveC *variable = [SwiftyForObjectiveC new];
	return variable;
}
- (QueueForObjectiveC *)createQueueSwift {
    QueueForObjectiveC *variable = [QueueForObjectiveC new];
    return variable;
}


@end
