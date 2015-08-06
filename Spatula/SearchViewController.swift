//
//  SearchViewController.swift
//  Spatula
//
//  Created by Hana Kim on 8/6/15.
//  Copyright (c) 2015 Bobby Ren. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var resultsScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        resultsScrollView.contentSize.height = 1000
        resultsScrollView.scrollEnabled = true
    }

    @IBAction func buttonTap(sender: AnyObject) {
        performSegueWithIdentifier("details", sender: sender)
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
