//
//  ViewController.swift
//  diceapp
//
//  Created by Amir Maula on 11/02/2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        stepper?.minimumValue = 1
        stepper?.value = 6
        outputNumberLabel?.text = String(outputNumberInt)
    }
    
// Outlets
    @IBOutlet weak var outputNumberLabel:UILabel?
    @IBOutlet weak var maxNumberLabel:UILabel?
    @IBOutlet weak var stepper:UIStepper?
    
// Internal Variables
    var outputNumberInt = 0
    var maxNumberInt = 6
    
    @IBAction func onReroll(){
        outputNumberInt = Int.random(in: 1..<maxNumberInt+1)
        print(String(outputNumberInt))
        outputNumberLabel?.text = String(outputNumberInt)
    }
    
    @IBAction func stepperValueChanges(_ sender:UIStepper){
        print("Stepper Value: \(sender.value)")
        maxNumberInt = Int(sender.value)
        print(String(maxNumberInt))
        maxNumberLabel?.text = String(maxNumberInt)
    }
}

