//
//  Node.m
//  CarouselInfo
//
//  Created by Vijay Chavan on 10/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Node.h"

@implementation Node
@synthesize strName;
@synthesize referenceNode;
@synthesize parentElement;

-(NSString *)getStringName
{
    return strName;
}
-(NSString *)getParentElement
{
    return parentElement;
}

@end
