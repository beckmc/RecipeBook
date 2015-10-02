//
//  AddViewController.m
//  RecipeBook
//
//  Created by beckmc on 8/6/15.
//  Copyright (c) 2015 Matthew Beck. All rights reserved.
//

#import "AddViewController.h"
#import "Recipe.h"

@implementation AddViewController

@synthesize nameField, typeField, cuisineField, mainIngredientsField, sideIngredientsField, addonIngredientsField, prepField, cookField, rBook, addButton, parentController;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do view setup here.
    [addButton setEnabled:NO];
}

/*!
 * @param recipeBook The recipe book that is referenced to add recipes to.
 */
- (id)initWithRecipeBook:(RecipeBook *)recipeBook recipeTableViewController:(RecipeTableViewController *)rtvc {
    rBook = recipeBook;
    parentController = rtvc;
    
    return self;
}

/*!
 * Action called when the add button is clicked. Adds the recipe to the recipe book,
 * then dismisses the window.
 */
- (IBAction)addRecipe:(id)sender {
    NSString *name = [nameField stringValue];
    NSString *type = [typeField stringValue];
    NSString *cuisine = [cuisineField stringValue];
    NSString *mainIngredients = [mainIngredientsField stringValue];
    NSString *sideIngredients = [sideIngredientsField stringValue];
    NSString *addonIngredients = [addonIngredientsField stringValue];
    NSString *ingredients = [NSString stringWithFormat:@"%@ %@ %@", mainIngredients, sideIngredients, addonIngredients];
    NSInteger prep = [prepField integerValue];
    NSInteger cook = [cookField integerValue];
    NSInteger total = prep + cook;
    
    Recipe *recipe = [[Recipe alloc] initWithName:name type:type cuisine:cuisine main:mainIngredients addons:addonIngredients sides:sideIngredients ingredients:ingredients prep:prep cook:cook total:total];
    
    [rBook addRecipe:recipe];
    
    [parentController refreshData];
    
    [self.view.window close];
}

/*!
 * Dismisses the window without any other actions taking place.
 */
- (IBAction)cancel:(id)sender {
    [self.view.window close];
}

/*!
 * Checks that the name field, ingredients field, and time fields are filled out.
 * Also makes sure both time fields have integer values and aren't zero.
 */
- (IBAction)editingChanged:(id)sender {
    if ([[nameField stringValue] length] != 0 && [[mainIngredientsField stringValue] length] != 0 && [[prepField stringValue] length] != 0 && [[cookField stringValue] length] != 0) {
        [addButton setEnabled:YES];
    } else {
        [addButton setEnabled:NO];
    }
    
    //Prevents the fields from being empty, non-numbers, or zero
    if (![prepField integerValue] || ![cookField integerValue]) {
        [addButton setEnabled:NO];
    }
}

@end
