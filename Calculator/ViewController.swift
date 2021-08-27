//
//  ViewController.swift
//  Calculator
//
//  Created by Pavel Arias on 22/8/21.
//

import UIKit

class ViewController: UIViewController {
    
    var numberOnScreen: String = ""
    var previousNumber: Double = 0
    var performingMath = false
    var operation = 0
    var formatedNumber = ""

    
    @IBOutlet weak var resultNumber: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        
        switch sender.tag {
        case 0...14:
            numberOnScreen.append(sender.currentTitle!)
            
        case 15:
            if numberOnScreen.contains("÷") {
                formatedNumber = numberOnScreen.replacingOccurrences(of: "÷", with: "/")
            } else if numberOnScreen.contains("x") {
                formatedNumber = numberOnScreen.replacingOccurrences(of: "x", with: "*")
            } else {
                formatedNumber = numberOnScreen
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
        
        func updateScreen() {
            resultNumber.text = numberOnScreen
        }
        updateScreen()
    }
}
