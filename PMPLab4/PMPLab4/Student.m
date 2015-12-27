//
//  Student.m
//  PMPLab4
//
//  Created by Diana Volodchenko on 12/27/15.
//  Copyright © 2015 Diana Volodchenko. All rights reserved.
//

#import "Student.h"

@implementation Student

-(id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self)
    {
        self.firstName = [aDecoder decodeObjectForKey:@"name"];
        self.lastName = [aDecoder decodeObjectForKey:@"surname"];
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:self.firstName forKey:@"name"];
    [encoder encodeObject:self.lastName forKey:@"surname"];
}

@end