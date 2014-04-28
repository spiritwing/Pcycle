//
//  PcycleQueue.m
//  Queue
//
//  Created by 郝 源顺 on 14-4-10.
//  Copyright (c) 2014年 Shun. All rights reserved.
//

#import "PcycleQueue.h"

@implementation PcycleQueue

-(id) init
{
    if(self = [super init])
    {
        _QueueArray = [[NSMutableArray alloc] init];
        
        _queueCount = 0;
    }
    return (self);
}

-(NSNumber *) GetQueueHead
{
    NSNumber * temp  = [_QueueArray objectAtIndex:0];
    
    [_QueueArray removeObjectAtIndex:0];
    
    --_queueCount;
    
    return temp;
}

-(BOOL) EntryQueueRear:(NSNumber *)newElement
{
    [_QueueArray addObject:newElement];
    
    ++_queueCount;
    
    return TRUE;
}

-(int) GetQueueLength
{
    return _queueCount;
}

-(BOOL) ClearQueue
{
    [_QueueArray removeAllObjects];
    
    if([self isEmpty])
    {
        return TRUE;
    }
    return FALSE;
}

-(BOOL) isEmpty
{
    if(_QueueArray.count == 0)
    {
        return TRUE;
    }
    return FALSE;
}

-(void) ShowAll
{
    for (id obj in _QueueArray) {
        NSLog(@"%f" , [obj floatValue]);
    }
}




@end

