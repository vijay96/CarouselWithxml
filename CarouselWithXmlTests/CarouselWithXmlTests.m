//
//  CarouselWithXmlTests.m
//  CarouselWithXmlTests
//
//  Created by Vijay Chavan on 17/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CarouselWithXmlTests.h"
#import "Node.h"
#import "ViewController.h"
@implementation CarouselWithXmlTests

- (void)setUp
{
    [super setUp];
    node=[[Node alloc]init];
    viewController=[[ViewController alloc]init];

}

- (void)tearDown
{
    // Tear-down code here.
    [super tearDown];
}

-(void)testcheckTheArrayForNull
{
    STAssertNotNil([viewController getNodeArray],@"set up Array is nil");
}

-(void)testCheckForChildrens
{
    NSString *strName=@"A Building";
    NSMutableArray *arr=[[NSMutableArray alloc]init];
    arr=[node getChildren:strName];
    NSMutableArray *arr1=[[NSMutableArray alloc]initWithObjects:@"HFS1	",@"ABC1",@"DEF1", nil];
    for(int i=0;i<[arr count];i++)
    {
        STAssertEqualObjects([arr objectAtIndex:i], [arr1 objectAtIndex:i],@"objects are not equal");
    }
    
    
}


-(void)testForParent
{
    NSString *str=@"HFS1.HFS1";
    NSString *parentString;
    parentString=[node getParentElement:str];
    STAssertEqualObjects(parentString,@"HFS1",@"Objects are not equal");
   

}


@end
