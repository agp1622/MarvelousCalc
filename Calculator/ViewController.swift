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
            updateScreen()
        case 15:
            for (key, value) in mathOperators{
                numberOnScreen = numberOnScreen.replacingOccurrences(of: key, with: value)
            }
            
            let expresion = NSExpression(format: (numberOnScreen))
            let result = expresion.expressionValue(with: nil, context: nil) ?? 0 as Double
            numberOnScreen = "\(result)"
            updateScreen()
        case 16:
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
}
