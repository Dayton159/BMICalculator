//
//  CalculatorBrain.swift
//  BMICalculator
//
//  Created by Dayton on 11/12/20.
//

import UIKit


struct CalculatorBrain {
    
    // we are making this optional because we need to give an input value to bmi when we initialize it at calculateVC
    // in addition to we did not provide initial value because we dont know what value should be inserted to struct
    var bmi: BMI?
    
    
    // inserting some raw value of screen input to be processed in the struct
    mutating func calculateBMI(height:Float, weight:Float)  {
        // body mass index equation is = weight(kg) / height(m^2)
        let bmiValue = weight / (height * height)
        
        
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "Eat more pies!", color: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))
        }else if bmiValue < 24.9 {
            bmi = BMI(value: bmiValue, advice: "Fit as a fiddle!", color: #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1))
        }else  {
            bmi = BMI(value: bmiValue, advice: "Eat less pies!", color: #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1))
        }
    }
    
    
    // accessing / getting the processed value out of the struct
    func getBMIValue() -> String {
        let formattedBMI = String(format: "%.1f", bmi?.value ?? 0.0)
        return formattedBMI
    }
    
    func getAdvice() ->String {
        return bmi?.advice ?? "Please Insert your weight and height"
    }
    
    func getColor() ->UIColor {
        return bmi?.color ?? UIColor.black
    }
}

