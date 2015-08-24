//
//  MealPlanViewController.swift
//  Spatula
//
//  Created by Hana Kim on 8/6/15.
//  Copyright (c) 2015 Bobby Ren. All rights reserved.
//

import UIKit

class MealPlanViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableViewInfo: UITableView!
    @IBOutlet weak var scrollMeals: UIScrollView!
    @IBOutlet weak var selectorDisplayOptions: UISegmentedControl!
    @IBOutlet weak var tableViewDetails: UITableView!
    
    var mealPlan: MealPlan?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.Done, target: self, action: "close")
        self.title = self.mealPlan?.name
        self.setupScroll()
    }
    
    func close() {
        self.navigationController?.dismissViewControllerAnimated(true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Setup/populate with mealplan
    func setupScroll() {
        // TODO: for each recipe in the meal plan, create a imageview and add the recipe's image to the scrollview
        // TODO: add a tap gesture on the scrollview to detect if the user taps a particular imageview
    }
    
    // MARK: - Table view data source
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        // TODO: Different number of rows depending on each table.
        // TODO: Different number of rows in the details table depending on the selected viewing option
        // TODO: top tableview should not be scrollable. So make sure the size is exactly the same as the number of info rows we want to display
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MealPlanCell", forIndexPath: indexPath) as! UITableViewCell
        
        // Configure the cell...
        let labelLeft: UILabel = cell.textLabel!
        let labelRight: UILabel = cell.detailTextLabel!

        let row: Int = indexPath.row
        if tableView == self.tableViewInfo {
            // TODO: populate the cell for each row of the meal plan info
            labelLeft.text = "Info row"
            labelRight.text = "Details about this meal plan"
        }
        else if tableView == self.tableViewDetails {
            // TODO: populate the cell for each row of the details table
            // TODO: the content of these cells differs depending on selected viewing option
            labelLeft.text = "Detail row"
            labelRight.text = "Detail details"
        }
        return cell
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
