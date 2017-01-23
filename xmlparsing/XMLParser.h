//
//  XMLParser.h
//  xmlparsing


#import <Foundation/Foundation.h>
#import "AppDelegate.h"

@interface XMLParser : NSObject<NSXMLParserDelegate>
{
    NSMutableArray *dataArr;
    NSMutableString *currentElement;
    NSMutableDictionary *dataDict,*authorDict;
}

@property (nonatomic,retain) AppDelegate *objapp;

@end
