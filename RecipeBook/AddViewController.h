//
//  AddViewController.h
//  RecipeBook
//
//  Created by beckmc on 8/6/15.
//  Copyright (c) 2015 Matthew Beck. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "RecipeBook.h"
#import "RecipeTableViewController.h"

@interface AddViewController : NSViewController

@property (nonatomic) IBOutlet NSTextField *nameField;
@property (nonatomic) IBOutlet NSComboBox *typeField;
@property (nonatomic) IBOutlet NSComboBox *cuisineField;
@property (nonatomic) IBOutlet NSTextField *mainIngredientsField;
@property (nonatomic) IBOutlet NSTextField *sideIngredientsField;
@property (nonatomic) IBOutlet NSTextField *addonIngredientsField;
@property (nonatomic) IBOutlet NSTextField *prepField;
@property (nonatomic) IBOutlet NSTextField *cookField;

@property (nonatomic) IBOutlet NSButton *addButton;

@property (nonatomic) RecipeBook *rBook;
@property (nonatomic) RecipeTableViewController *parentController;

- (IBAction)addRecipe:(id)sender;
- (IBAction)cancel:(id)sender;
- (IBAction)editingChanged:(id)sender;

- (id)initWithRecipeBook:(RecipeBook *)recipeBook recipeTableViewController:(RecipeTableViewController *)rtvc;

@end
