//
//  ResultViewController.swift
//  BMICalculator
//
//  Created by Dayton on 11/12/20.
//

import UIKit

class ResultViewController: UIViewController {

    
    // we are making this optional because if not we need to provide an initial value
    var bmiValue: String?
    var advice:String?
    var color:UIColor?
    
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bmiLabel.text = bmiValue
        adviceLabel.text = advice
        view.backgroundColor = color
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        //this will dismiss the current view controller (that are presented modally)
        self.dismiss(animated: true, completion: nil)
    }
    
   

}

