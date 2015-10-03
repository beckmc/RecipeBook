//
//  RecipeBook.h
//  RecipeBook
//
//  Created by beckmc on 8/6/15.
//  Copyright (c) 2015 Matthew Beck. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Recipe.h"

@interface RecipeBook : NSObject

@property (nonatomic) NSMutableArray *recipes;

- (void)addRecipe:(Recipe *)recipe;
- (void)generateRecipeBook;
- (void)removeRecipe:(Recipe *)recipe;

- (Recipe *)recipe:(NSInteger)number;

@end
