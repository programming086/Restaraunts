//
//  detailViewController.swift
//  Restaraunts
//
//  Created by Игорь on 27.11.15.
//  Copyright © 2015 Ihor Malovanyi. All rights reserved.
//

import UIKit

class detailViewController: UIViewController {

    @IBOutlet var restaurantImageView: UIImageView!
    var restaurantImage = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        restaurantImageView.image = UIImage(named: restaurantImage)
        
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
