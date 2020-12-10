//
//  CalculateViewController.swift
//  BMICalculator
//
//  Created by Dayton on 11/12/20.
//

import UIKit

class CalculateViewController: UIViewController {
    
    
    //need to provide value here if bmi was not optional
    var calculatorBrain = CalculatorBrain()

    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var heightSlider: UISlider!
    
    @IBOutlet weak var WeightSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func slider1Changed(_ sender: UISlider) {
        let height = String(format: "%.2f", sender.value )
        heightLabel.text = ("\(height)m")
    }
    
    @IBAction func slider2Changed(_ sender: UISlider) {
        let weight = String(format: "%.0f", sender.value )
        weightLabel.text = ("\(weight)Kg")
        
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = WeightSlider.value
        
        
        calculatorBrain.calculateBMI(height: height, weight: weight)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
        // it automatically perform prepare method
    }
    
    //the func is to notifies the view controller that a segue is about to be performed
    // prepare the segue by setting some property in the destination of the segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // to differentiate the segue (in the future) to prevent a clash if there is multiple segue
        if segue.identifier == "goToResult" {
            
    //destination property contains the view controller whose contents should be displayed at the end of the segue.
            let destinationVC = segue.destination as! ResultViewController
    // destination intinya isinya sebuah ViewController, dan tgs kita specify ViewControllernya
            
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
        }
    }
}


