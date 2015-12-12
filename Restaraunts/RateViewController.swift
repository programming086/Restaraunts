//
//  RateViewController.swift
//  Restaraunts
//
//  Created by Игорь on 06.12.15.
//  Copyright © 2015 Ihor Malovanyi. All rights reserved.
//

import UIKit

class RateViewController: UIViewController {

    @IBOutlet weak var backgroundImageView: UIImageView!
    var rating: String?
    @IBOutlet weak var stack: UIStackView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        let scale = CGAffineTransformMakeScale(0.0, 0.0)
        let translation = CGAffineTransformMakeTranslation(0, 500)
        
        stack.transform = CGAffineTransformConcat(scale, translation)
        
        let blurEffect = UIBlurEffect(style: .Dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        
        backgroundImageView.addSubview(blurEffectView)
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
    
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(1.0, delay: 0, options: [], animations: {
            self.stack.transform = CGAffineTransformIdentity
            }, completion: nil)
    }
    
    @IBAction func rateSelect(sender: UIButton) {
        switch sender.tag {
        case 1: rating = "dislike"
        case 2: rating = "good"
        case 3: rating = "great"
        default: break
        }
        performSegueWithIdentifier("unwindToDetail", sender: sender)
    }

}
