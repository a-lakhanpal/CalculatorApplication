//
//  ViewController.swift
//  CalculatorApp
//
//  Created by Swati Sharma on 10/09/19.
//  Copyright © 2019 Ankur Lakhanpal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        display.text = String(Int(numberOnScreen))
    }
    
    var numberOnScreen:Int = 0 // this golbal varible will store the number displayed on screen.
    var previousNumber:Int = 0 // this varible will store the number which is before a operation is selected.
    var inputNumber:[String] = [] // a string array for storing operand
    var operation = 0 // varible to store operation sign value
    
    
    
    @IBOutlet weak var display: UILabel! //display
    
    //numbers from 0 to 9
    @IBAction func numbers(_ sender: UIButton) {
        
        inputNumber.append(String(sender.tag - 1))
        
        display.text = inputNumber.joined(separator: "")
        
        numberOnScreen = Int(display.text!)!
        
        
        if inputNumber[0] == "0"
        {
            inputNumber.removeFirst()
        }
        
        
    }
    
    //calculation operators
    @IBAction func calculateOperation(_ sender: UIButton) {
        
        if display.text == "Error!"
        {
         ResetToDefault()
        }
        previousNumber = Int(display.text!)!
        operation = sender.tag
        inputNumber.removeAll() //clear the inputNumber string array for new inputs.
    }
    
    
    @IBAction func equals(_ sender: UIButton) {
        //four cases, using switch for user requests
        switch operation
        {
        
        case 17 :
            display.text = String(previousNumber + numberOnScreen) //addition
        case 16 :
            display.text = String(previousNumber - numberOnScreen) //subtraction
        case 15 :
            display.text = String(previousNumber * numberOnScreen) //multiply
            
        //to handle divide by zero error, Function is used for Division
        case 14:
            Divide()
        
        default:
            ResetToDefault()
        }
        
        inputNumber.removeAll()

    }
    
    
    @IBAction func reset(_ sender: UIButton) {
        ResetToDefault()
    }
    
    
    func Divide(){
        if numberOnScreen == 0
        {
            display.text = "Error!"
        }
        else
        {
            display.text = String(previousNumber / numberOnScreen)
        }
    }
    
    
    func ResetToDefault(){
        numberOnScreen = 0
        previousNumber = 0
        operation = 0
        display.text = String(Int(numberOnScreen))
        inputNumber.removeAll()
    }
    
  
}

