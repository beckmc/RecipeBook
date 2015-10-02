//
//  Recipe.m
//  RecipeBook
//
//  Created by beckmc on 8/6/15.
//  Copyright (c) 2015 Matthew Beck. All rights reserved.
//

#import "Recipe.h"

@implementation Recipe

@synthesize cuisine, region, name, type, ingredients, mainIngredients, addonIngredients, sideIngredients, prepTime, cookTime, hasSeafood, hasMeat, hasDairy, isVegan, isVegetarian, hasShellfish, dictionary;

- (id)initWithName:(NSString *)rname type:(NSString *)rtype cuisine:(NSString *)rcuisine main:(NSString *)rmain addons:(NSString *)raddons sides:(NSString *)rsides ingredients:(NSString *)ringredients prep:(NSInteger) rprep cook:(NSInteger) rcook total:(NSInteger) rtotal {
    
    self.name = rname;
    self.type = rtype;
    self.cuisine = rcuisine;
    self.mainIngredients = rmain;
    self.addonIngredients = raddons;
    self.sideIngredients = rsides;
    self.ingredients = ringredients;
    self.prepTime = rprep;
    self.cookTime = rcook;
    self.totalTime = rtotal;
    
    dictionary = [[Dictionary alloc] init];
    
    return self;
}


- (void)generateRegion {
    if ([cuisine isEqualToString:@"Korean"] || [cuisine isEqualToString:@"Chinese"]) {
        region = @"Asian";
    } else if ([cuisine isEqualToString:@"Indian"] || [cuisine isEqualToString:@"Pakistan"]) {
        region = @"SouthEastern";
    } else if ([cuisine isEqualToString:@"Greek"] || [cuisine isEqualToString:@"Turkey"]) {
        region = @"MiddleEastern";
    } else {
        region = @"None";
    }
}

- (void)checkSeafood {
    NSArray *seafood = [dictionary entry:@"seafood"];
    
    hasSeafood = NO;
    
    for (NSString *seafoodItem in seafood) {
        if ([ingredients localizedCaseInsensitiveContainsString:seafoodItem]) {
            hasSeafood = YES;
        }
    }
}

- (void)checkMeat {
    NSArray *meat = [dictionary entry:@"meat"];
    
    hasMeat = NO;
    
    for (NSString *meatItem in meat) {
        if ([ingredients localizedCaseInsensitiveContainsString:meatItem]) {
            hasMeat = YES;
        }
    }
}

- (void)checkDairy {
    NSArray *dairy = [dictionary entry:@"dairy"];
    
    hasDairy = NO;
    
    for (NSString *dairyItem in dairy) {
        if ([ingredients localizedCaseInsensitiveContainsString:dairyItem]) {
            hasDairy = YES;
        }
    }
}

- (void)checkVegan {
    if (isVegetarian && !hasDairy && ![ingredients localizedCaseInsensitiveContainsString:@"eggs"]) {
        isVegan = YES;
    } else {
        isVegan = NO;
    }
}

- (void)checkVegetarian {
    if (!hasSeafood && !hasMeat && !hasShellfish) {
        isVegetarian = YES;
    } else {
        isVegetarian = NO;
    }
}

- (void)checkShellfish {
    NSArray *shellfish = [dictionary entry:@"shellfish"];
    
    hasShellfish = NO;
    
    for (NSString *shellfishItem in shellfish) {
        if ([ingredients localizedCaseInsensitiveContainsString:shellfishItem]) {
            hasShellfish = YES;
        }
    }
}

- (BOOL)containsIngredient:(NSString *)ingredient {
    if ([ingredients localizedCaseInsensitiveContainsString:ingredient]) {
        return YES;
    } else {
        return NO;
    }
}

- (NSInteger)totalTime {
    return prepTime + cookTime;
}


@end
