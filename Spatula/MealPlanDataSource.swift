//
//  MealPlanDataSource.swift
//  Spatula
//
//  Created by Bobby Ren on 8/23/15.
//  Copyright (c) 2015 Bobby Ren. All rights reserved.
//

import UIKit

var mealPlanSingleton: MealPlanDataSource?

class MealPlan: NSObject {
    // TODO: create as a core data object
    var name: String = ""
    var id: Int = -1
    var recipes: [Recipe] = [Recipe]()
    
    convenience init(id: Int) {
        self.init()
        
        self.id = id
        self.name = MealPlanDataSource.name(id)
        
        var names: [String] = MealPlanDataSource.recipeNameArray(id)
        for name: String in names {
            if let recipe: Recipe = RecipeDataSource.recipeByName(name) {
                self.recipes.append(recipe)
            }
        }
    }
    
    func coverImage() -> UIImage? {
        let recipe: Recipe = self.recipes[0]
        return recipe.image
    }
}

class MealPlanDataSource: NSObject {
 
    // names also serve as the unique id/key for each mealplan
    let names = ["Summer picnics",
        "High protein diet",
        "Asian inspired",
        "Low carb meals",
        "Sweet tooth",
        "Easy lunch on the go",
        "Romatic dinners",
        "Everything mealplan"
    ]
    
    let recipeNameArrays: [[String]] = [
        ["Mini fruit tarts", "Cornbread salad", "Roast beef sandwich on ciabatta", "Strawberry salad"],
        ["Roast beef sandwich on ciabatta", "Southwest grilled fajitas", "Grilled salmon", "Pita with deli meats", "Spicy korean stir fry"],
        ["Curry and rice", "Spicy korean stir fry", "Pita with deli meats"],
        ["Southwest grilled fajitas", "Strawberry salad", "Grilled salmon", "Duck breast with quail eggs and caviar"],
        ["Scone with rainbow frosting", "Mini fruit tarts"],
        ["Pita with deli meats", "Roast beef sandwich on ciabatta", "Southwest grilled fajitas"],
        ["Duck breast with quail eggs and caviar", "Grilled salmon"],
        ["Cornbread salad", // everything
            "Mini fruit tarts",
            "Roast beef sandwich on ciabatta",
            "Scone with rainbow frosting",
            "Southwest grilled fajitas",
            "Curry and rice",
            "Strawberry salad",
            "Grilled salmon",
            "Pita with deli meats",
            "Spicy korean stir fry",
            "Duck breast with quail eggs and caviar"
        ]
    ]

    // MARK: Singleton
    class func instance() -> MealPlanDataSource {
        // only returns one instance.
        if mealPlanSingleton == nil {
            mealPlanSingleton = MealPlanDataSource()
        }
        
        return mealPlanSingleton!
    }
    
    // MARK: Class functions used by generator
    class func mealPlanCount() -> Int {
        return MealPlanDataSource.instance().names.count
    }

    class func name(index: Int) -> String {
        return MealPlanDataSource.instance().names[index]
    }
    
    class func recipeNameArray(index: Int) -> [String] {
        return MealPlanDataSource.instance().recipeNameArrays[index]
    }
    
    // MARK: Generator
    class func mealPlanWithId(id: Int) -> MealPlan? {
        if id < self.mealPlanCount() {
            return MealPlan(id: id)
        }
        
        return nil
    }

    class func mealPlanByName(name: String) -> MealPlan? {
        for var index = 0; index < self.mealPlanCount(); index++ {
            if self.name(index) == name {
                return MealPlan(id: index)
            }
        }
        return nil
    }

}
