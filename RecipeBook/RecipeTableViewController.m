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
    
    recipeNames = [recipeBook recipes];
    
    [self setDetailInfo:recipeNames[0]];
    
    [deleteButton setEnabled:NO];
}

/*!
 * Updates the table of recipes to match the current list of sorted recipes stored in the program.
 * Called after deleting or adding a recipe.
 */
- (void)refreshData {
    recipeNames = [recipeBook recipes];
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

/*!
 * Given a recipe, updates the labels in the program to display the information of the recipe.
 * @param recipe The recipe to show the information of.
 */
-(void)setDetailInfo:(Recipe *)recipe {
    [recipeName setStringValue:[recipe name]];
    [recipeType setStringValue:[recipe type]];
    [recipeCuisine setStringValue:[recipe cuisine]];
    [ingredients setString:[recipe ingredients]];
    [prepTime setIntegerValue:[recipe prepTime]];
    [cookTime setIntegerValue:[recipe cookTime]];
}

/*!
 * Called when the table selection is changed. Used to enable the delete button and update
 * the information displayed to reflect the current recipe.
 */
- (void)tableViewSelectionDidChange:(NSNotification *)aNotification {
    //Make sure the cell is selected and not the table header
    if ([self selectedRecipe]) {
        Recipe *recipeInfo = [self selectedRecipe];
    
        // Update info
        [self setDetailInfo:recipeInfo];
    
        [deleteButton setEnabled:YES];
    }
}

/*!
 * Action called when the add button is pressed to add a recipe. Presents as a modal window.
 */
- (IBAction)addButtonPressed:(id)sender {
    NSViewController *addViewController = [[self.storyboard instantiateControllerWithIdentifier:@"AddViewController"] initWithRecipeBook:recipeBook recipeTableViewController:self];
    [self presentViewControllerAsModalWindow:addViewController];
}

/*!
 * Deletes the selected recipe from the recipe book. The recipe is removed from both the stored
 * array of recipes and the in-app table. The first recipe in the list is then treated as the
 * selected recipe and information is displayed, though it is not selected and can not be interacted
 * with as a result.
 */
- (IBAction)deleteSelectedRecipe:(id)sender {
    //Alert to confirm deletion
    NSAlert *deletionConfirmationAlert = [[NSAlert alloc] init];
    deletionConfirmationAlert.messageText = @"Confirm Deletion";
    deletionConfirmationAlert.informativeText = @"Are you sure you want to delete this recipe? This action cannot be undone.";
    deletionConfirmationAlert.icon = nil;
    //Cancel button == 1000, OK button == 1001
    [deletionConfirmationAlert addButtonWithTitle:@"Cancel"];
    [deletionConfirmationAlert addButtonWithTitle:@"OK"];
    //Run alert, setting button equal to the button pressed 
    NSInteger button = [deletionConfirmationAlert runModal];
    
    //OK button is pressed
    if (button == 1001) {
        Recipe *deleteRecipe = [self selectedRecipe];
        
        [recipeBook removeRecipe:deleteRecipe];
    
        [self refreshData];
    
        if ([[recipeBook recipes] count]) {
            [self setDetailInfo:recipeNames[0]];
        }
    
        [deleteButton setEnabled:NO];
    }
}

@end
