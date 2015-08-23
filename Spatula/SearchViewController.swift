//
//  SearchViewController.swift
//  Spatula
//
//  Created by Hana Kim on 8/6/15.
//  Copyright (c) 2015 Bobby Ren. All rights reserved.
//

import UIKit

class SearchViewController: UITableViewController {
    
    var source: RecipeDataSource = RecipeDataSource.instance()

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
        return self.source.recipeCount()
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        
        let imageView: UIImageView = cell.contentView.viewWithTag(1) as! UIImageView
        let label: UILabel = cell.viewWithTag(2) as! UILabel
        
        let row = indexPath.row
        imageView.image = self.source.image(row)
        label.text = self.source.name(row)
        
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 120
    }

    // MARK: Delegate
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("Row \(indexPath.row)")
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
