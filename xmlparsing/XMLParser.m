//
//  XMLParser.m
//  xmlparsing


#import "XMLParser.h"

@implementation XMLParser
@synthesize objapp;

-(XMLParser *)init
{
//    dataArr=[[NSMutableArray alloc] init];
//    dataDict=[[NSMutableDictionary alloc] init];
    objapp=(AppDelegate *)[[UIApplication sharedApplication] delegate];

    return self;
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(nullable NSString *)namespaceURI qualifiedName:(nullable NSString *)qName attributes:(NSDictionary<NSString *, NSString *> *)attributeDict
{
    
    if([elementName isEqualToString:@"bookstore"])
        objapp.parseArr=[[NSMutableArray alloc] init];
    else if ([elementName isEqualToString:@"book"])
    {
       
        NSString *category = [attributeDict objectForKey:@"category"];
        dataDict=[[NSMutableDictionary alloc] init];
        [dataDict setObject:category forKey:@"category"];
       
    }
    
    
    currentElement=nil;
}


- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    if (!currentElement)
    {
        
        string=[string stringByReplacingOccurrencesOfString:@"\n" withString:@""];
        string=[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        currentElement=[[NSMutableString alloc] initWithString:string];
    }
    else
    {
        string=[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        string=[string stringByReplacingOccurrencesOfString:@"\n" withString:@""];
        [currentElement appendString:string];
        NSLog(@"found character %@",string);
    }
}




- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(nullable NSString *)namespaceURI qualifiedName:(nullable NSString *)qName
{
    if([elementName isEqualToString:@"bookstore"])
        NSLog(@"array %@ author %@",[objapp.parseArr description],[dataArr description]);
    if([elementName isEqualToString:@"book"])
    {
        [objapp.parseArr addObject:dataDict];
    }
    
    else if([elementName isEqualToString:@"title"]||[elementName isEqualToString:@"author"]||[elementName isEqualToString:@"year"]||[elementName isEqualToString:@"price"])
    {
        [dataDict setObject:currentElement forKey:elementName];
    
    }
}



@end
