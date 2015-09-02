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
    @IBOutlet weak var timeUISlider: UISlider!
    @IBOutlet weak var priceUISlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // TODO: Setup sliders to be discrete
        
        timeUISlider.continuous = true
        timeUISlider.addTarget(self, action: "makeDiscrete:", forControlEvents: .ValueChanged)
    }
    
    
    func makeDiscrete (sender:UISlider!) {
        if (sender.value < 1.5) {
            sender.setValue(1.0, animated: false)
            
        } else if (sender.value < 2.5) {
            sender.setValue(2.0, animated: false)
            
        } else if (sender.value < 3.5) {
            sender.setValue(3.0, animated: false)
            
        } else if (sender.value < 4.5) {
            sender.setValue(4.0, animated: false)
            
        } else if (sender.value >= 4.5) {
            sender.setValue(5.0, animated: false)
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
