//
//  Node.m
//  CarouselInfo
//
//  Created by Vijay Chavan on 10/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Node.h"
#import "ViewController.h"

@implementation Node
@synthesize strName;
@synthesize referenceNode;
@synthesize parentElement;
@synthesize storageArray;

-(NSString *)getStringName
{
    return strName;
}
-(NSString *)getParentElement
{
    return parentElement;
}

-(Node *)getReferenceNode
{
    return referenceNode;
}

-(NSMutableArray *)getChildren:(NSString *)_string
{
    ViewController *controller=[[ViewController alloc]init];
    NSMutableArray *arr=[[NSMutableArray alloc]init];
    for(Node *n in [controller getNodeArray])
    {
        if([n.referenceNode.parentElement isEqualToString:_string])
        {
            [arr addObject:n.referenceNode.strName];
        }
    }
    
    return arr;
}

-(NSString *)getParentElement:(NSString *)_string
{
    ViewController *controller=[[ViewController alloc]init];
    NSString *parentString;
    for(Node *n in [controller getNodeArray])
    {
        if([n.referenceNode.strName isEqualToString:_string])
        {
            parentString=n.referenceNode.parentElement;
        }
    }
    return parentString;
}


@end
