# RecipeBook
An Objective-C implementation of a project I wrote for my Data Structures and Algorithms class. The orignal project can be found at https://github.com/beckmc/RecipeBook-CS150.

## The Project:
The task was to design and implement an electronic cookbook, used to organize recipes and prepare meals. This program supports operations, such as:
  - Adding Recipes
  - Deleting Recipes
  
While the goal is for this program to be as similar to the orignal as possible, certain changes were necessary to be able to rewrite the project in Objective-C. As a result, this implementation of the project differs from what was done in class in a few ways:
  - Language: The class focused on using Java while working with various data structures and algorithms. Obviously, this is written in Objective-C and differes in this sense.
  - Functionality: The original project had additional functionality, such as searching for recipes given specific criteria, and forming meal plans based on various restrictions. Neither of these have been implemented yet.
  - Design: Use of specific data structures, such as multiple lists, a hash map, and a tree map were required. This program has much of the same functionality while using data structures available to Objective-C. Furthermore, the original project had no gui and instead was controlled through the console, where with this program the goal is to create similar functionality while adding a gui and tweaking things to make the project more user-friendly.

It is worth noting that some aspects, such as cuisine types and ingredients, were randomly generated by my professor and as such this project is focused around those. Similarly, the lists of recipes were randomly generated by him and are included with the code.

### Inputs:
- A Text File, recipes_x.txt, where the x is a number indicating the number of recipes in the file. There are two different files included, recipes_10.txt and recipes_60000a.txt. Each recipe is separated from the next by a blank line. A recipe is described by a series of lines, each of which consists of a keyword value pair. The value may consist of multiple words separated by a space. The keywords and legal values are:
  * cuisine: Italian, Chinese, Greek, Turkish, Indian, Pakistan, French, Korean 
  * name: <made up>
  * prepTime: <integer>
  * cookTime: <integer>
  * type: salad, entree, appetizer
     
  All recipes in the file were randomly generated, and have a random type, cuisine, prep and cook times, and ingredients. The ingredients are broken down into three categories: main, addons, and sides. Each type of dish has certain ingredients that fall into those categories:
  * entree:
    * main: beef,chicken,lamb,goat,salmon,tofu,tempeh,shrimp,scallops
    * addons: broccoli,cauliflower,spinach,mushrooms,beans,potatoes,beets,peas,rice
    * sides: eggs,cheese,milk,peas,beans
  * salad
    * main: kale,spinach,lettuce,chard,mesclun,arugula
    * addons: radishes,scallions,eggs,cheese
    * sides: cucumbers,carrots,mushrooms,potatoes
  * appetizer
    * main: beef,chicken,tofu,shrimp,scallops
    * addons: peas,rice,cheese,eggs
    * sides: spinach,mushrooms,cheese,beans

- Commands via button interaction. In the original project they were entered through the terminal. These commands include:
  * Add - Add a recipe. Prompt the user for the required information. A recipe cannot be added until all information is filled in to prevent blank recipes from being added
  * Delete - Prompts the user on if they want to delete the selected recipe, and if yes, deletes it from the program.
    
### Outputs:
All recipes are output via a table. Recipe information is found beside the table populating labels and text fields.

## So What Does This Look Like?
![alt tag](https://raw.githubusercontent.com/beckmc/RecipeBook/master/RecipeBook/AppScreenshot.png)

## What's Next?
- Touching up the add/delete functions - For adding recipes, which fields need populated vs which can be left empty needs to be determined. When deleting recipes, there currently is no confirmation when attempting to delete a recipe.
- More documentation of code
- Adding search functionality - Recipe name is a good place to start. However, searching for recipe based on specific criteria could also be added.
- Potentially adding meal plan functionality - This would bring the program closer to the original. The user specifies specific inclusions/exclusions that are desired, and a meal plan consisting of an entree, a salad, and two appetizers that fulfill all of the requirements and can be prepared in the fastest amount of time.
- Optimization of data structure usage for recipes - While it could be slower, my baseline of 60,000 recipes isn't as fast initially as I think it could be. The original java implementation didn't have a gui and as such I don't have anything to compare it to, but I feel like optimizations could be made to make the program faster and more efficient. 
- Save/Load functionality - Fairly straightforward, the program needs to be able to save changes made, and changing the initial load file or loading a different recipe book goes along with this.
- SQL integration - While the recipes were stored in a plain text file when I started working on this, I feel like using some sort of database would make it more efficient to implement save/load functionality and help to clean up some of the code.
