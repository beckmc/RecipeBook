//
//  Recipe.h
//  RecipeBook
//
//  Created by beckmc on 8/6/15.
//  Copyright (c) 2015 Matthew Beck. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dictionary.h"

@interface Recipe : NSObject

@property (nonatomic) NSString *cuisine;
@property (nonatomic) NSString *region;
@property (nonatomic) NSString *name;
@property (nonatomic) NSString *type;
@property (nonatomic) NSString *ingredients;
@property (nonatomic) NSString *mainIngredients;
@property (nonatomic) NSString *addonIngredients;
@property (nonatomic) NSString *sideIngredients;

@property (nonatomic) NSInteger prepTime;
@property (nonatomic) NSInteger cookTime;
@property (nonatomic) NSInteger totalTime;

@property (nonatomic) BOOL hasSeafood;
@property (nonatomic) BOOL hasMeat;
@property (nonatomic) BOOL hasDairy;
@property (nonatomic) BOOL isVegan;
@property (nonatomic) BOOL isVegetarian;
@property (nonatomic) BOOL hasShellfish;

@property (nonatomic) Dictionary *dictionary;

- (void)generateRegion;
- (void)checkSeafood;
- (void)checkShellfish;
- (void)checkMeat;
- (void)checkDairy;
- (void)checkVegetarian;
- (void)checkVegan;

- (id)initWithName:(NSString *)rname type:(NSString *)rtype cuisine:(NSString *)rcuisine main:(NSString *)rmain addons:(NSString *)raddons sides:(NSString *)rsides ingredients:(NSString *)ringredients prep:(NSInteger) rprep cook:(NSInteger) rcook total:(NSInteger) rtotal;

@end
