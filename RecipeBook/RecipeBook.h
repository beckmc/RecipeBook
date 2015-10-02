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
@property (nonatomic) NSMutableArray *sortedRecipesName;

- (void)addRecipe:(Recipe *)recipe;
- (void)createNameArray;
- (void)generateRecipeBook;
- (void)removeRecipe:(Recipe *)recipe;

- (Recipe *)recipe:(NSInteger)number;

@end
