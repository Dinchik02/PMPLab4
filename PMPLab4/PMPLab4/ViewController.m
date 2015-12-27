//
//  ViewController.m
//  PMPLab4
//
//  Created by Diana Volodchenko on 12/27/15.
//  Copyright © 2015 Diana Volodchenko. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.firstTextField.text = [[NSUserDefaults standardUserDefaults]	objectForKey:@"text"];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)firstSaveButtonTapped:(id)sender {
    NSLog(@"First text field log: %@", self.firstTextField.text);
    [[NSUserDefaults standardUserDefaults] setObject: self.firstTextField.text forKey:@"text"];
    [[NSUserDefaults standardUserDefaults]	synchronize];
}

@end
