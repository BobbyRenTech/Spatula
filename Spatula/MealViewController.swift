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
    var viewWidth: CGFloat!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var detailsImage: UIImageView!
    @IBOutlet weak var detailsTab: UIButton!
    @IBOutlet weak var ingredientsTab: UIButton!
    @IBOutlet weak var detailsContent: UIView!
    @IBOutlet weak var ingredientsContent: UIView!
    @IBOutlet weak var ingredientsContentLeadingConstraint: NSLayoutConstraint!
    
    
    
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
        // we probably need to get the width of the containing view
        // animate the constraint to have the x position to be zero for the ingredients container
        // animate the constraint to have the x position to be -width for the
        
        self.view.layoutIfNeeded()
        UIView.animateWithDuration(0.3) { () -> Void in
            
            self.ingredientsContentLeadingConstraint.constant = 0.0
            
            
            
            self.view.layoutIfNeeded()
        }
        
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
