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
    @IBOutlet weak var detailsContentLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var ingredientsTrailingConstraint: NSLayoutConstraint!
    
    
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
        
        if sender.tag == 0 && selectedTab != 0 {
            showDetails()
        } else if sender.tag == 1 && selectedTab != 1 {
            showIngredients()
        }
    }

    func showDetails() {
        self.view.layoutIfNeeded()
        UIView.animateWithDuration(0.3) { () -> Void in
            
            
            self.view.removeConstraint(self.ingredientsTrailingConstraint)
            
            self.view.addConstraint(self.detailsContentLeadingConstraint)
            self.detailsContentLeadingConstraint.constant = -20.0

            self.view.layoutIfNeeded()
        }
        
        selectedTab = 0
    }
    
    func showIngredients() {
        self.view.layoutIfNeeded()
        UIView.animateWithDuration(0.3) { () -> Void in
            
            self.view.removeConstraint(self.detailsContentLeadingConstraint)

            self.ingredientsTrailingConstraint.constant = -20.0
            self.view.addConstraint(self.ingredientsTrailingConstraint)

            
            self.view.layoutIfNeeded()
        }
        
        selectedTab = 1
        
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
