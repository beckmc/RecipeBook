//
//  RecipeTableViewController.h
//  RecipeBook
//
//  Created by beckmc on 8/6/15.
//  Copyright (c) 2015 Matthew Beck. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "RecipeBook.h"

@interface RecipeTableViewController : NSViewController

@property (nonatomic) RecipeBook *recipeBook;

@property (nonatomic) IBOutlet NSTableView *recipeTable;

@property (nonatomic) IBOutlet NSTextField *recipeName;
@property (nonatomic) IBOutlet NSTextField *recipeType;
@property (nonatomic) IBOutlet NSTextField *recipeCuisine;
@property (nonatomic) IBOutlet NSTextField *prepTime;
@property (nonatomic) IBOutlet NSTextField *cookTime;
@property (nonatomic) IBOutlet NSTextView *ingredients;

@property (nonatomic) IBOutlet NSButton *deleteButton;

@property (nonatomic) NSMutableArray *recipeNames;

- (void)refreshData;

- (IBAction)addButtonPressed:(id)sender;
- (IBAction)deleteSelectedRecipe:(id)sender;

@end
