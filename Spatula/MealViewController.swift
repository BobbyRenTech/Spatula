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
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var detailsImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        detailsImage.image = recipe.image
        nameLabel.text = recipe.name
        print(recipe.name)
        
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
