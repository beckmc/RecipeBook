//
//  RecipeTableViewController.m
//  RecipeBook
//
//  Created by beckmc on 8/6/15.
//  Copyright (c) 2015 Matthew Beck. All rights reserved.
//

#import "RecipeTableViewController.h"
#import "Recipe.h"
#import "AddViewController.h"
#import "AppDelegate.h"

@implementation RecipeTableViewController

@synthesize recipeTable, recipeNames, recipeType, recipeCuisine, prepTime, cookTime, ingredients, recipeName, recipeBook, deleteButton;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    
    recipeBook = [[RecipeBook alloc] init];
    [recipeBook generateRecipeBook];
    
    [recipeBook createNameArray];
    
    recipeNames = [recipeBook sortedRecipesName];
    
    [self setDetailInfo:recipeNames[0]];
    
    [deleteButton setEnabled:NO];
}

- (void)refreshData {
    recipeNames = [recipeBook sortedRecipesName];
    [recipeTable reloadData];
}


- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    NSTableCellView *cellView = [tableView makeViewWithIdentifier:tableColumn.identifier owner:self];
    
    if([tableColumn.identifier isEqualToString:@"RecipeName"]) {
        Recipe *recipe = [recipeNames objectAtIndex:row];
        cellView.textField.stringValue = [recipe name];
        return cellView;
    }
    
    return cellView;
}


- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return [recipeNames count];
}

-(Recipe *)selectedRecipe {
    NSInteger selectedRow = [self.recipeTable selectedRow];
    
    if(selectedRow >=0 && self.recipeNames.count > selectedRow ) {
        Recipe *selectedRecipe = [self.recipeNames objectAtIndex:selectedRow];
        return selectedRecipe;
    } else {
        return nil;
    }
}

-(void)setDetailInfo:(Recipe *)recipe {
    NSString *name;
    NSString *type;
    NSString *cuisine;
    NSString *ing;
    NSInteger prep;
    NSInteger cook;
    
    name = [recipe name];
    type = [recipe type];
    cuisine = [recipe cuisine];
    ing = [recipe ingredients];
    prep = [recipe prepTime];
    cook = [recipe cookTime];
    
    ing = [ing stringByReplacingOccurrencesOfString:(NSString *)@" " withString:(NSString *)@", "];
    
    [recipeName setStringValue:name];
    [recipeType setStringValue:type];
    [recipeCuisine setStringValue:cuisine];
    [ingredients setString:ing];
    [prepTime setIntegerValue:prep];
    [cookTime setIntegerValue:cook];
    
}

- (void)tableViewSelectionDidChange:(NSNotification *)aNotification {
    Recipe *recipeInfo = [self selectedRecipe];
    
    // Update info
    [self setDetailInfo:recipeInfo];
    
    [deleteButton setEnabled:YES];
}

- (IBAction)addButtonPressed:(id)sender {
    NSViewController *addViewController = [[self.storyboard instantiateControllerWithIdentifier:@"AddViewController"] initWithRecipeBook:recipeBook recipeTableViewController:self];
    [self presentViewControllerAsModalWindow:addViewController];
}

- (IBAction)deleteSelectedRecipe:(id)sender {
    Recipe *deleteRecipe = [self selectedRecipe];
    
    [recipeBook removeRecipe:deleteRecipe];
    
    [self refreshData];
    
    [self setDetailInfo:recipeNames[0]];
    
    [deleteButton setEnabled:NO];
}

@end
