//
//  DailyMealsViewController.swift
//  Spatula
//
//  Created by Hana Kim on 03/10/2015.
//  Copyright © 2015 Bobby Ren. All rights reserved.
//

import UIKit

class DailyMealsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var generatedRowIndices: [Int] = [Int]()
    let totalMeals: Int = 4
    var selectedMeal: Int!
    
    @IBOutlet weak var filterView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // setup navigator
        self.navigationController!.navigationBar.translucent = false

        self.randomizeRowIndices()
        filterView.alpha = 0.0
    }

    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    // one for breakfast, lunch, dinner, snack
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return totalMeals
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MealCell", forIndexPath: indexPath)
        
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
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 140
    }
    
    // MARK: Delegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selectedMeal = indexPath.row
        performSegueWithIdentifier("goToMealDetails", sender: self)
    }
    
    func close() {
        self.navigationController!.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let controller = segue.destinationViewController as! MealViewController
        controller.recipe = RecipeDataSource.recipeWithId(generatedRowIndices[selectedMeal])!
        controller.recipeType = selectedMeal
    }
    
    func randomizeRowIndices() {
        self.generatedRowIndices.removeAll(keepCapacity: true)
        while self.generatedRowIndices.count < self.totalMeals {
            let index = Int(arc4random_uniform(UInt32(RecipeDataSource.recipeCount())))
            if self.generatedRowIndices.indexOf(index) == nil {
                self.generatedRowIndices.append(index)
            }
        }
        
        print("indices: ")
        for index: Int in self.generatedRowIndices {
            print("\(index)")
        }
        print("\n")
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
