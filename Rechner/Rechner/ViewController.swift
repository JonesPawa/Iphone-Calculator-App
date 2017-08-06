//
//  ViewController.swift
//  Rechner
//
//  Created by Jonas Wagner on 22.07.17.
//  Copyright © 2017 Jonas Wagner. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numberOnScreen:Double = 0
    var previousNumber:Double = 0
    var performingMath = false
    var equal = false
    var operation = 0

    @IBOutlet weak var label: UILabel!
    
    @IBAction func numbers(_ sender: UIButton) {
        if label.text == String(0){
            label.text = ""
        }
        
        equal = false
            
        if performingMath == true{
            
            if sender.tag == 17{ //Pi
                label.text = String(Double.pi)
            }
            else if sender.tag == 18{ //Euler Number
                label.text = String(2.718281828)
            }
            else
            {
                label.text = String(sender.tag - 1)
            }
            
            
            numberOnScreen = Double(label.text!)!
            performingMath = false
        }
        else{
            if sender.tag == 17{ //Pi
                label.text = String(Double.pi)
            }
            else if sender.tag == 18{ //Euler Number
                label.text = String(2.718281828)
            }
            else
            {
                label.text = label.text! + String(sender.tag - 1)
            }
            numberOnScreen = Double(label.text!)!
            
        }
        
    }
    
    
    @IBAction func buttons(_ sender: UIButton) {
        if label.text != "" && sender.tag != 11 && sender.tag != 16 && sender.tag != 19{
            
            
            previousNumber = Double(label.text!)!
            
            if sender.tag == 12{ //Divide
                label.text = "/"
            }
            else if sender.tag == 13{ //Multiply
                label.text = "x"
            }
            else if sender.tag == 14{ //Minus
                label.text = "-"
            }
            else if sender.tag == 15{ //Plus
                label.text = "+"
            }
            
            operation = sender.tag
            performingMath = true
        }
        else if sender.tag == 16
        {
            equal = true
            if operation == 12
            {
                label.text = String(previousNumber / numberOnScreen)
            }
            else if operation == 13
            {
                label.text = String(previousNumber * numberOnScreen)
            }
            else if operation == 14
            {
                label.text = String(previousNumber - numberOnScreen)
            }
            else if operation == 15
            {
                label.text = String(previousNumber + numberOnScreen)
            }
            
           
            /*
             let equal = Double(label.text!)!
            let isInteger = equal.truncatingRemainder(dividingBy: 1) == 0
            
            if isInteger{
                label.text = String(Int(label.text!)!)
            }

 */
            
            
        }
        else if sender.tag == 11
        {
            label.text = "0"
            previousNumber = 0
            numberOnScreen = 0
            operation = 0
        
        }else if sender.tag == 19
        {
            
            if(equal == false){
                label.text = String(label.text!.substring(to: label.text!.index(before: label.text!.endIndex)))
                
            
            if label.text == ""{
                label.text = "0"
            }
            
            
            numberOnScreen = Double(label.text!)!
            }else{
                label.text = "0"
                numberOnScreen = 0.00

            }
        }

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

