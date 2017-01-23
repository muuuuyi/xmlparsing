//
//  ViewController.m
//  xmlparsing

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize parser;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURL *url=[[NSURL alloc] initFileURLWithPath:[[NSBundle mainBundle] pathForResource:@"bookstore" ofType:@"xml"] isDirectory:NO];
    NSXMLParser *xmlparser=[[NSXMLParser alloc] initWithContentsOfURL:url];
    self.parser=[[XMLParser alloc] init];
    [xmlparser setDelegate:self.parser];
    BOOL sucess=[xmlparser parse];
    if(sucess)
        NSLog(@"parse successfully");
    else
        NSLog(@"parse Error");
    
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
