//
//  MealViewController.swift
//  Spatula
//
//  Created by Hana Kim on 9/13/15.
//  Copyright (c) 2015 Bobby Ren. All rights reserved.
//

import UIKit

class MealViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var recipe: Recipe!
    var recipeType: Int!
    var selectedTab: Int = 0
    var viewWidth: CGFloat!
    
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var mealCalories: UILabel!
    @IBOutlet weak var mealPrice: UILabel!
    @IBOutlet weak var mealDifficulty: UILabel!
    
    @IBOutlet weak var detailsImage: UIImageView!
    @IBOutlet weak var detailsTab: UIButton!
    @IBOutlet weak var ingredientsTab: UIButton!
    @IBOutlet weak var detailsContent: UIView!
    @IBOutlet weak var mealDescriptionLabel: UILabel!
    @IBOutlet weak var ingredientsContent: UIView!
    
    @IBOutlet weak var ingredientsTableView: UITableView!
    
    
    @IBOutlet var ingredientsTrailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var selectedTabBorderLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var selectedTabBorder: UIView!
    
    var ingredients: [String] = ["5 tablespoons","2 ounces","a pinch","4","40 mL", "5 tablespoons","2 ounces","a pinch","4","40 mL"]
    var ingredientAmounts: [String] = ["Sugar","Oil","Cinimon","Eggs","Water","Something Else","Sea Salt","Juice","Oranges","Apple Juice"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewWidth = self.view.frame.width

        // setup navigator
        self.navigationController!.navigationBar.translucent = false
        self.navigationController!.hidesBarsOnSwipe = true
        
        switch recipeType {
        case 0:
            self.navigationItem.title = "Breakfast"
        case 1:
            self.navigationItem.title = "Lunch"
        case 2:
            self.navigationItem.title = "Dinner"
        default:
            self.navigationItem.title = "Snack"
        }
        
        // load info for recipe
        detailsImage.image = recipe.image
        detailsImage.clipsToBounds = true
        
        mealNameLabel.text = recipe.name
        mealCalories.text = String(recipe.calories) + " kCal"
        mealDescriptionLabel.text = recipe.longDescription
        
        detailsTab.tag = 0
        ingredientsTab.tag = 1
        
        self.ingredientsTrailingConstraint.constant = -20 - viewWidth
        self.view.layoutIfNeeded()
    }
    
    

    @IBAction func selectTab(sender: AnyObject) {
        
        if sender.tag == 0 && selectedTab != 0 {
            showDetails()
        } else if sender.tag == 1 && selectedTab != 1 {
            showIngredients()
        }
    }

    func showDetails() {
        self.view.layoutIfNeeded()
        UIView.animateWithDuration(0.3) { () -> Void in
            self.ingredientsTrailingConstraint.constant = -20 - self.viewWidth
            self.selectedTabBorderLeadingConstraint.constant = 0
            self.view.layoutIfNeeded()
        }
        
        selectedTab = 0
    }
    
    func showIngredients() {
        self.view.layoutIfNeeded()
        UIView.animateWithDuration(0.3) { () -> Void in
            self.ingredientsTrailingConstraint.constant = -20.0
            self.selectedTabBorderLeadingConstraint.constant = (self.viewWidth / 2)
            self.view.layoutIfNeeded()
        }
        selectedTab = 1
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingredients.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("IngredientCell")
        let row = indexPath.row

        let ingredientNameLabel: UILabel = cell!.viewWithTag(1) as! UILabel
        let ingredientAmountLabel: UILabel = cell!.viewWithTag(2) as! UILabel
        
        cell!.separatorInset = UIEdgeInsetsZero
        
        ingredientNameLabel.text = ingredients[row]
        ingredientAmountLabel.text = ingredientAmounts[row]
        print(ingredients[row])
        
        return cell!
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
