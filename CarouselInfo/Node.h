//
//  Node.h
//  CarouselInfo
//
//  Created by Vijay Chavan on 10/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Node : NSObject
@property (nonatomic,retain)NSString * strName;
@property (nonatomic,retain)Node *referenceNode;
@property (nonatomic,retain)NSString *parentElement;

-(NSString *)getStringName;
-(NSString *)getParentElement;
@end
