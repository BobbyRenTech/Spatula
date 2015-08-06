//
//  MealPlanViewController.swift
//  Spatula
//
//  Created by Hana Kim on 8/6/15.
//  Copyright (c) 2015 Bobby Ren. All rights reserved.
//

import UIKit

class MealPlanViewController: UIViewController {

    @IBOutlet weak var scrollMeals: UIScrollView!
    @IBOutlet weak var mealDetailsScrollView: UIScrollView!
    
    
    @IBOutlet weak var meal1Image: UIImageView!
    @IBOutlet weak var meal2Image: UIImageView!
    @IBOutlet weak var meal3Image: UIImageView!
    @IBOutlet weak var mealTitle: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        scrollMeals.contentSize.width = 1000
        mealDetailsScrollView.contentSize.height = 600
        meal2Image.alpha = 0.7
        meal3Image.alpha = 0.7
        
    }

    
    @IBAction func tapMeal2(sender: AnyObject) {
        
        
        println("update meal details for meal 2")
        meal1Image.alpha = 0.7
        meal2Image.alpha = 1
        meal3Image.alpha = 0.7
        mealTitle.text = "Meal 2 Title"
        
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
