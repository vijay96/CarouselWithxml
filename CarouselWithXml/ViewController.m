//
//  ViewController.m
//  CarouselInfo
//
//  Created by Vijay Chavan on 09/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

#import "iCarousel.h"
#import "Node.h"
@interface ViewController ()

@end
@implementation ViewController

@synthesize carousel;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) 
    {
        setUpArray=[[NSMutableArray alloc]initWithObjects:@"Pune IT Park",nil];
    }
    NSString *xmlFilePath=[[NSBundle mainBundle]pathForResource:@"demo" ofType:@"xml"];
    NSData *data=[[NSData alloc]initWithContentsOfFile:xmlFilePath];
	parser=[[NSXMLParser alloc]initWithData:data];
    parser.delegate=self;
    [parser parse];
    return self;
}


- (void)viewDidLoad
{
    
    [super viewDidLoad];
       depth=0;
    buttonCount=0;
    parentDepth=0;
    [carousel setUp];
    
    
}

- (void)viewDidUnload
{
    [self setCarousel:nil];

    [super viewDidUnload];
    
}


- (void)parserDidStartDocument:(NSXMLParser *)parser;
{
    
    nodeArray=[[NSMutableArray alloc]init];
    tempArray=[[NSMutableArray alloc]init];
  
    
}


- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    
    
    i=0;
    
    if([elementName isEqualToString:@"node"])
    {
        
        
        if(depth==1)
        {
            [tempArray removeAllObjects];
            rootNode=[[Node alloc]init];
            parentNode=strVal;
            
        }
        depth++;
    }
    
    
    if ([elementName isEqualToString:@"childrens"]) 
    {
        rootNode.referenceNode=[[Node alloc]init];
        rootNode.parentElement=strVal;
        parentNode=strVal;
     
        [tempArray addObject:parentNode];
        parentDepth++;
    }
    
}
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    if(i==0)
    {
        strVal=string;
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    
    i=1;
    
    if([elementName isEqualToString:@"name"])
    {
        
        if(depth==2)
        {
            rootNode.strName=strVal;
               
        }
        else 
        {
            rootNode.referenceNode.strName=strVal;
            
        }
        
        
        
        Node *tempNode=[[Node alloc]init];
        tempNode.referenceNode=[[Node alloc]init];
        if([tempArray count]!=0)
        {
            parentNode=[tempArray objectAtIndex:parentDepth-2];
      
        
        }
        

        tempNode.strName=rootNode.getStringName;
        tempNode.parentElement=parentNode;
        tempNode.referenceNode.strName=rootNode.referenceNode.getStringName;
        tempNode.referenceNode.parentElement=parentNode;
        
        if(tempNode!=NULL)
        {
            [nodeArray addObject:tempNode];
        }
        
        
    }
    
    if([elementName isEqualToString:@"node"])
    {
        
        depth--;
        
    }
    
    
    
    if([elementName isEqualToString:@"childrens"])
    {
        rootNode.referenceNode.parentElement=parentNode;
        parentDepth--;
    }
    
    
}

  
- (void)parserDidEndDocument:(NSXMLParser *)parser
{
    [tempArray removeAllObjects];
    for(Node *n in nodeArray)
    {

    }
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}


- (NSUInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    
    return  [setUpArray count];
}
- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSUInteger)index 
{
    
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(40, 50, 300, 100)];
    UILabel *label=[[UILabel alloc]initWithFrame:view.bounds];
    label.text=[setUpArray objectAtIndex:index];
    label.font=[label.font fontWithSize:20];
    [view addSubview:label];
    return view;
    
    
    
}

- (NSUInteger)numberOfVisibleItemsInCarousel:(iCarousel *)icarousel
{
    
    return [setUpArray count];
}

- (CGFloat)carouselItemWidth:(iCarousel *)carousel
{
    return 400;
}


-(NSMutableArray *)getNodeArray
{
    return nodeArray;
}

- (IBAction)goButton:(id)sender 
{
    
    itemIndex=carousel.currentItemIndex;
    if(buttonCount==0)
    {
        
        
        [setUpArray removeAllObjects];
        for(Node *n in nodeArray)
        {
            
            if(![temp isEqualToString:n.getStringName])
            {
                if([n.getStringName length]>0)
                {
                    [setUpArray addObject:n.getStringName];
                    
                }
                
            }
            temp=n.getStringName;
            
        }
        if([setUpArray count]!=0)
        {
            [carousel setUp];    
        }
    }
    
    else
    {
        temp=[setUpArray objectAtIndex:carousel.currentItemIndex];
        [tempArray addObject:temp];
        [setUpArray removeAllObjects];
        setUpArray=[rootNode getChildren:temp];   
        [carousel setUp];    
        
    }
    
    buttonCount++;
    
}

- (IBAction)backButton:(id)sender 
{
    
    if(buttonCount==0)
    {
        
        [setUpArray removeAllObjects];
        [setUpArray addObject:@"Pune IT Park"];
        [carousel setUp]; 
        
    }
    
    if(buttonCount==2)
    {
        [setUpArray removeAllObjects];
        for(Node *n in nodeArray)
        {
            
            if(![temp isEqualToString:n.getStringName])
            {
                if([n.getStringName length]>0)
                {
                    [setUpArray addObject:n.getStringName];
                    
                }
                
            }
            temp=n.getStringName;
        }
        
        [setUpArray exchangeObjectAtIndex:itemIndex withObjectAtIndex:carousel.currentItemIndex];
        [carousel setUp];   
    }
    
    if(buttonCount>2)
    {
        
        temp=[tempArray objectAtIndex:[tempArray count]-2];
        NSLog(@"parent name=%@",temp);
        [setUpArray removeAllObjects];
        for(Node *n in nodeArray)
        {
            if([temp isEqualToString:n.getParentElement])
            {
                if([n.referenceNode.getStringName length]>0)
                {
                    [setUpArray addObject:n.referenceNode.getStringName];
                    
                }
                
            }
            
        }
        [setUpArray exchangeObjectAtIndex:itemIndex withObjectAtIndex:carousel.currentItemIndex];
        [carousel setUp];
        [tempArray removeLastObject];
        
        
    }

    buttonCount--;  
    
    
}


@end
