//
//  ViewController.swift
//  Calculator
//
//  Created by Pavel Arias on 22/8/21.

import UIKit
import MathParser

class ViewController: UIViewController {
    
    var numberOnScreen: String = ""
    var operators = ["÷": "/",
                     "x": "*",
                     "%": "/100.00"]
    
    let operatorsArray = ["÷", "x", "+", "-"]
    var addOperator: String = ""
    @IBOutlet weak var resultNumber: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        switch sender.tag {
        
        case 0...10:
            numberOnScreen.append(sender.currentTitle!)
            updateScreen()
            
        case 11...15:
            
            
            if operatorsArray.contains(sender.currentTitle!) {
                addOperator = sender.currentTitle!
                
            }
            
           
//            When hit one of the operators, check if there is another operator. If there is, replace it with the hit button. If there is not, add it.
            
            
            
        case 16:
            plusMinusHandler()
            updateScreen()
            
        case 17:
            for (key, value) in operators{
                numberOnScreen = numberOnScreen.replacingOccurrences(of: key, with: value)
            }
                        
            let mathExpresion =  try! Expression(string: numberOnScreen)
            let expresionEvaluated = try! Evaluator.default.evaluate(mathExpresion)
            numberOnScreen = String(format: "%g", expresionEvaluated)
            updateScreen()
            
        case 18:
            numberOnScreen = ""
            updateScreen(true)
            
        default:
            fatalError("Unknown button tag")
        }
    }
    
    func updateScreen(_ override: Bool = false) {
        resultNumber.text = numberOnScreen
        if(override){
            resultNumber.text = "0"
        }
    }
    
    func plusMinusHandler() {
        if numberOnScreen.starts(with: "-") {
            numberOnScreen = numberOnScreen.replacingOccurrences(of: "-", with: "")
        } else {
            numberOnScreen = "-" + numberOnScreen
        }
    }
}
