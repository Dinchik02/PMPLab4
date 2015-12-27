//
//  SecondViewController.m
//  PMPLab4
//
//  Created by Diana Volodchenko on 12/27/15.
//  Copyright © 2015 Diana Volodchenko. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController () {
    NSMutableArray *_strings;
}

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _strings = [NSMutableArray arrayWithContentsOfURL:[self plistURL]];
    if (!_strings)
        _strings = [NSMutableArray array];
    
    self.textView.text = [_strings componentsJoinedByString:@"\n"];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSURL *)plistURL

{
    return [[[[NSFileManager defaultManager]
              URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject] URLByAppendingPathComponent:@"data.plist"];
    
}


- (IBAction)saveButtonTapped:(id)sender {
    NSLog(@"First text field log: %@", self.secondTextField.text);
    [_strings addObject:self.secondTextField.text];
    self.textView.text = [_strings componentsJoinedByString:@"\n"];
    [_strings writeToURL:[self plistURL] atomically:YES];
}


@end
