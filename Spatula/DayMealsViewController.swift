//
//  DayMealsViewController.swift
//  Spatula
//
//  Created by Hana Kim on 9/13/15.
//  Copyright (c) 2015 Bobby Ren. All rights reserved.
//

import UIKit

class DayMealsViewController: UITableViewController {

    var generatedRowIndices: [Int] = [Int]()
    let totalMeals: Int = 4
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.randomizeRowIndices()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


//    Have ot figure out how to hook this part up
//
//    @IBAction func buttonTap(sender: AnyObject) {
//        performSegueWithIdentifier("details", sender: sender)
//    }
    
    // MARK: Datasource
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    // one for breakfast, lunch, dinner, snack
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return totalMeals
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MealPlanCell", forIndexPath: indexPath) as! UITableViewCell
        
        let imageView: UIImageView = cell.contentView.viewWithTag(1) as! UIImageView
        let labelName: UILabel = cell.viewWithTag(2) as! UILabel
        let labelCount: UILabel = cell.viewWithTag(3) as! UILabel
        
        let row = indexPath.row
        let index = self.generatedRowIndices[row] as Int
        let recipe: Recipe = RecipeDataSource.recipeWithId(index)!
        imageView.image = recipe.image
        labelName.text = recipe.name
        labelCount.text = "\(recipe.calories) kCal"
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 140
    }
    
    // MARK: Delegate
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let mealPlan: MealPlan = MealPlanDataSource.mealPlanWithId(indexPath.row)!
        self.goToMeal()
    }
    
    func goToMeal() {
        let controller: UIViewController = UIStoryboard(name: "cutlery", bundle: nil).instantiateViewControllerWithIdentifier("MealViewController") as! UIViewController
        let nav = UINavigationController(rootViewController: controller)
        self.navigationController?.presentViewController(nav, animated: true, completion: nil)
    }
    
    func randomizeRowIndices() {
        self.generatedRowIndices.removeAll(keepCapacity: true)
        while self.generatedRowIndices.count < self.totalMeals {
            let index = Int(arc4random_uniform(UInt32(RecipeDataSource.recipeCount())))
            if find(self.generatedRowIndices, index) == nil {
                self.generatedRowIndices.append(index)
            }
        }
        
        println("indices: ")
        for index: Int in self.generatedRowIndices {
            println("\(index)")
        }
        println("\n")
    }
}

