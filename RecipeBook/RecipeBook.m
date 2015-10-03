//
//  RecipeBook.m
//  RecipeBook
//
//  Created by beckmc on 8/6/15.
//  Copyright (c) 2015 Matthew Beck. All rights reserved.
//

#import "RecipeBook.h"

@implementation RecipeBook

@synthesize recipes;

- (id)init {
    recipes = [[NSMutableArray alloc] init];
    
    return self;
}

/*!
 * Given the file containing recipes, generates the recipe book. To switch the active file,
 * change the pathForResource to the desired file.
 */
- (void)generateRecipeBook {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"recipe_10" ofType:@"txt"];
    NSString *contents = [NSString stringWithContentsOfFile:path encoding:NSASCIIStringEncoding error:nil];
    NSArray *lines = [contents componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"\r\n"]];
    
    for (int i = 0; i < [lines count] - 9; i += 9) {
        
        NSString *name = lines[i];
        name = [name stringByReplacingOccurrencesOfString:(NSString *)@"name: " withString:(NSString *)@""];
        
        NSString *type = lines[i + 1];
        type = [type stringByReplacingOccurrencesOfString:(NSString *)@"type: " withString:(NSString *)@""];
        
        NSString *cuisine = lines[i + 2];
        cuisine = [cuisine stringByReplacingOccurrencesOfString:(NSString *)@"cuisine: " withString:(NSString *)@""];
        
        NSString *main = lines[i + 3];
        main = [main stringByReplacingOccurrencesOfString:(NSString *)@"main: " withString:(NSString *)@""];
        
        NSString *addons = lines[i + 4];
        addons = [addons stringByReplacingOccurrencesOfString:(NSString *)@"addons: " withString:(NSString *)@""];
        
        NSString *sides = lines[i + 5];
        sides = [sides stringByReplacingOccurrencesOfString:(NSString *)@"sides: " withString:(NSString *)@""];
        
        NSString *ingredients = [NSString stringWithFormat:@"%@ %@ %@", main, sides, addons];
        
        NSString *prep = lines[i + 6];
        prep = [prep stringByReplacingOccurrencesOfString:(NSString *)@"prep: " withString:(NSString *)@""];
        NSInteger prepTime = [prep intValue];
        
        NSString *cook = lines[i + 7];
        cook = [cook stringByReplacingOccurrencesOfString:(NSString *)@"cook: " withString:(NSString *)@""];
        NSInteger cookTime = [cook intValue];
        
        NSInteger totalTime = prepTime + cookTime;
        
        Recipe *recipe = [[Recipe alloc] initWithName:name type:type cuisine:cuisine main:main addons:addons sides:sides ingredients:ingredients prep:prepTime cook:cookTime total:totalTime];
        
        [self addRecipe:recipe];
    }
}

/*!
 * Inserts a recipe into the sorted array of recipes.
 * @param recipe The recipe to add.
 */
- (void)addRecipe:(Recipe *)recipe {
    NSComparator comparator = ^NSComparisonResult(id obj1, id obj2) {
        return [[obj1 name] compare:[obj2 name] options:NSCaseInsensitiveSearch];
    };
    
    NSUInteger newIndex = [recipes indexOfObject:recipe inSortedRange:(NSRange) {0, [recipes count]} options:NSBinarySearchingInsertionIndex usingComparator:comparator];
    
    [recipes insertObject:recipe atIndex:newIndex];
}

/*!
 * Getter to retrieve a specific recipe.
 * @param number The index number of the recipe to retrieve.
 * @return The recipe at the index of the recipes array.
 */
- (Recipe *)recipe:(NSInteger)number {
    return recipes[number];
}

/*!
 * Removes a recipe from the array of recipes. Used for deletion of recipes.
 * @param recipe The recipe to remove.
 */
- (void)removeRecipe:(Recipe *)recipe {
    [recipes removeObject:recipe];
}

@end
