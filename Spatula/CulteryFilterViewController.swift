//
//  CulteryFilterViewController.swift
//  Spatula
//
//  Created by Hana Kim on 02/09/2015.
//  Copyright (c) 2015 Bobby Ren. All rights reserved.
//

import UIKit

class CulteryFilterViewController: UIViewController {

    @IBOutlet weak var caloriesUISlider: UISlider!
    @IBOutlet weak var priceUISlider: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        // TODO: Setup sliders to be discrete

        caloriesUISlider.continuous = true
        caloriesUISlider.addTarget(self, action: "makeCaloriesDiscrete:", forControlEvents: .ValueChanged)

        priceUISlider.continuous = true
        priceUISlider.addTarget(self, action: "makePriceDiscrete:", forControlEvents: .ValueChanged)
    }


    func makeCaloriesDiscrete (sender:UISlider!) {
        if (sender.value < 1625) {
            sender.setValue(1500, animated: false)

        } else if (sender.value < 1875) {
            sender.setValue(1750, animated: false)

        } else if (sender.value < 2125) {
            sender.setValue(2000, animated: false)

        } else if (sender.value < 2375) {
            sender.setValue(2250, animated: false)

        } else if (sender.value >= 2375) {
            sender.setValue(2500, animated: false)
        }
    }

    func makePriceDiscrete (sender:UISlider!) {
        if (sender.value < 7.5) {
            sender.setValue(5, animated: false)
        } else if (sender.value < 12.5) {
            sender.setValue(10, animated: false)
        } else if (sender.value >= 12.5) {
            sender.setValue(15, animated: false)
        }
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
