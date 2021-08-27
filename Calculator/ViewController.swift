//
//  ViewController.swift
//  Calculator
//
//  Created by Pavel Arias on 22/8/21.

import UIKit

class ViewController: UIViewController {
    
    var numberOnScreen: String = ""
    var previousNumber: Double = 0
    var performingMath = false
    var operation = 0
    var formatedNumber = ""
    var mathOperators = ["÷": "/",
                         "x": "*"]
    
    @IBOutlet weak var resultNumber: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        switch sender.tag {
        case 0...14:
            numberOnScreen.append(sender.currentTitle!)
        case 15:
            for (key, value) in mathOperators{
                formatedNumber = numberOnScreen.replacingOccurrences(of: key, with: value)
            }
            
            let expresion = NSExpression(format: (formatedNumber))
            let result = expresion.expressionValue(with: nil, context: nil) ?? 0
            numberOnScreen = "\(result)"
            updateScreen()
            
        case 16:
            numberOnScreen = ""
        default:
            fatalError("Unknown button tag")
        }
        
        updateScreen()
    }
    
    func updateScreen() {
        resultNumber.text = numberOnScreen
    }
}
