//
//  SearchViewController.swift
//  Spatula
//
//  Created by Hana Kim on 8/6/15.
//  Copyright (c) 2015 Bobby Ren. All rights reserved.
//

import UIKit

class SearchViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func buttonTap(sender: AnyObject) {
        performSegueWithIdentifier("details", sender: sender)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Datasource
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MealPlanDataSource.mealPlanCount()
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MealPlanCell", forIndexPath: indexPath) as! UITableViewCell
        
        let imageView: UIImageView = cell.contentView.viewWithTag(1) as! UIImageView
        let labelName: UILabel = cell.viewWithTag(2) as! UILabel
        let labelCount: UILabel = cell.viewWithTag(3) as! UILabel
        
        let row = indexPath.row
        let mealPlan: MealPlan = MealPlanDataSource.mealPlanWithId(row)!
        imageView.image = mealPlan.coverImage()
        labelName.text = mealPlan.name
        labelCount.text = "\(mealPlan.numberOfRecipes()) meals"
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 140
    }

    // MARK: Delegate
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("Row \(indexPath.row)")
        let mealPlan: MealPlan = MealPlanDataSource.mealPlanWithId(indexPath.row)!
        
        self.goToMealPlan(mealPlan)
    }
    
    func goToMealPlan(mealPlan: MealPlan) {
        let controller: MealPlanViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("MealPlanViewController") as! MealPlanViewController
        controller.mealPlan = mealPlan
        self.navigationController?.pushViewController(controller, animated: true)
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
