//
//  Dictionary.h
//  RecipeBook
//
//  Created by beckmc on 8/6/15.
//  Copyright (c) 2015 Matthew Beck. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dictionary : NSObject

@property (nonatomic) NSArray *meat;
@property (nonatomic) NSArray *seafood;
@property (nonatomic) NSArray *dairy;
@property (nonatomic) NSArray *shellfish;

@property (nonatomic) NSDictionary *dictionary;

- (NSArray *)entry: (NSString *)key;

@end
