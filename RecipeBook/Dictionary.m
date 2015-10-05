//
//  Dictionary.m
//  RecipeBook
//
//  Created by beckmc on 8/6/15.
//  Copyright (c) 2015 Matthew Beck. All rights reserved.
//

#import "Dictionary.h"

@implementation Dictionary

@synthesize meat, seafood, dairy, shellfish, dictionary;

/*!
 * Creates a dictionary defining what categories certain types of food are.
 */
- (id) init {
    
    meat = @[
        @"beef",
        @"chicken",
        @"lamb",
        @"goat",
    ];
 
    seafood = @[
        @"salmon",
        @"shrimp",
        @"scallops",
    ];
 
    dairy = @[
        @"cheese",
        @"milk",
    ];
 
    shellfish = @[
        @"shrimp",
        @"scallops",
    ];
 
 
    dictionary = @{
        @"meat" : meat,
        @"seafood" : seafood,
        @"dairy" : dairy,
        @"shellfish" : shellfish,
    };
    
    return self;
 
}

/*!
 * Used to retrieve the elements stored at a specific key in the dictionary.
 * @param key The dictionary key.
 * @return The array of elements stored at that position in the dictionary.
 */
- (NSArray *)entry:(NSString *)key {
    return dictionary[key];
}

@end
