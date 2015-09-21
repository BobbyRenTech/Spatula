//
//  MealViewController.swift
//  Spatula
//
//  Created by Hana Kim on 9/13/15.
//  Copyright (c) 2015 Bobby Ren. All rights reserved.
//

import UIKit

class MealViewController: UIViewController {

    var recipe: Recipe!
    var recipeType: Int!
    var selectedTab: Int = 0
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var detailsImage: UIImageView!
    
    @IBOutlet weak var detailsTab: UIButton!
    @IBOutlet weak var ingredientsTab: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        nameLabel.text = recipe.name
        
        detailsTab.tag = 0
        ingredientsTab.tag = 1
    }
    
    

    @IBAction func selectTab(sender: AnyObject) {
        
        if sender.tag == 0 {
            showDetails()
        } else if sender.tag == 1 {
            showIngredients()
        }
    }

    func showDetails() {
        print("showdetails")
    }
    
    func showIngredients() {
        print("showIngredients")
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
