//
//  ViewController.h
//  CarouselInfo
//
//  Created by Vijay Chavan on 09/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iCarousel.h"
@class Building;
@class Node;
@interface ViewController : UIViewController<NSXMLParserDelegate,iCarouselDelegate,iCarouselDataSource>
{
@private
    
    NSXMLParser *parser;
    NSString *strVal;
    int i;
    int depth;
    int buttonCount;
    int itemIndex;
    Node *rootNode;
    Node *temporaryNode;
    NSString *parentNode;
    int parentDepth;
    NSMutableArray *tempArray;
    NSMutableArray *nodeArray;
    NSMutableArray *setUpArray;
    NSString *temp;
    
}
@property (strong, nonatomic) IBOutlet iCarousel *carousel;
- (IBAction)goButton:(id)sender;
- (IBAction)backButton:(id)sender;
-(NSMutableArray *)getNodeArray;
@end
