//
//  ThirdViewController.h
//  PMPLab4
//
//  Created by Diana Volodchenko on 12/27/15.
//  Copyright © 2015 Diana Volodchenko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FMDB/FMDatabase.h"

@interface ThirdViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *firstNameField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameField;
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end
