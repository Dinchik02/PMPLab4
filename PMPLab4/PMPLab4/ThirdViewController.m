//
//  ThirdViewController.m
//  PMPLab4
//
//  Created by Diana Volodchenko on 12/27/15.
//  Copyright © 2015 Diana Volodchenko. All rights reserved.
//

#import "ThirdViewController.h"
#import "Student.h"
#import "FMDB/FMDatabase.h"

@interface ThirdViewController ()
{
    NSMutableArray *_students;
}

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _db = [FMDatabase databaseWithPath:[[self dbPath] absoluteString]];
    [_db open];
    [_db executeUpdate:@"CREATE	TABLE	IF	NOT	EXISTS	students	(name	TEXT,	surname TEXT)"];
     
    NSData *plistData = [NSData dataWithContentsOfURL:[self plistURL]];
    _students =	[[NSKeyedUnarchiver unarchiveObjectWithData:plistData] mutableCopy];
    if (!_students){
        _students =	[NSMutableArray array];
    }
    
    NSMutableString *str = [NSMutableString string];
    
    for (Student *stud	in _students) {
        [str appendFormat:@"Name:	%@,	surname:	%@.\n",	stud.firstName,	stud.lastName];
    }
    self.textView.text = str;
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

-(NSURL *)dbPath {
    return [[[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject] URLByAppendingPathComponent:@"dataxml.sqlite"];
}


- (IBAction)saveButtonTapped:(id)sender {
    Student *student = [[Student alloc] init];
    student.firstName = self.firstNameField.text;
    student.lastName = self.lastNameField.text;
    [_students addObject:student];
    
    NSMutableData *data = [NSMutableData data];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    archiver.outputFormat = NSPropertyListXMLFormat_v1_0;
    
    [archiver encodeObject:_students forKey:@"root"];
    [archiver finishEncoding];
    
    [data writeToURL:[self plistURL] atomically:YES];
    
    NSString *SQL = [NSString stringWithFormat:@"INSERT	INTO	students	(name, surname)	VALUES	('%@',	'%@')",
                     self.firstNameField.text,	self.lastNameField.text];
    
    [_db executeUpdate:SQL];
    
    NSMutableString *str = [NSMutableString string];
    
    for (Student *stud	in _students) {
        [str appendFormat:@"Name:	%@,	surname:	%@.\n",	stud.firstName,	stud.lastName];
    }
    self.textView.text = str;

}
- (IBAction)searchButtonTapped:(id)sender {
    NSString *SQL = [NSString stringWithFormat:@"SELECT * FROM students WHERE name LIKE '%@'", self.firstNameField.text];
    FMResultSet *result = [_db executeQuery:SQL];
    NSMutableString *str = [NSMutableString string];
    while ([result next])
    {
        [str appendFormat:@"%@ %@\n", [result stringForColumnIndex:0], [result stringForColumnIndex:1]];
    }
    
    self.textView.text = str;
}

@end
