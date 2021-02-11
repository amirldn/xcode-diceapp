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
        outputNumberLabel?.text = "Roll!"
        rerollButton.setTitle("Click to roll!", for: .normal)
//        floatingArrow.animaton(.spring())
        print(String(uuid!))
//        if uuid == "226B63ED-5727-43E2-B0FE-47CDA496FE1D" {
//            userTitle.text = "Amir's Dice App"
//        }
//        else {
//            userTitle.text = "\(users)+Dice App"
//        }
        
    }
    
// Outlets
    @IBOutlet weak var outputNumberLabel:UILabel?
    @IBOutlet weak var maxNumberLabel:UILabel?
    @IBOutlet weak var userTitle: UILabel!
    @IBOutlet weak var stepper:UIStepper?
//    @IBOutlet weak var floatingArrow: UIImageView!
    @IBOutlet weak var rerollButton: UIButton!
    //    @IBOutlet weak var historyView: UIScrollView!
    
// Internal Variables
    var outputNumberInt = 0
    var maxNumberInt = 6
    
    
// Constants
    let uuid = UIDevice.current.identifierForVendor?.uuidString
    let mediumHaptic = UIImpactFeedbackGenerator(style: .medium)
    let softHaptic = UIImpactFeedbackGenerator(style: .soft)
//    let hover = CABasicAnimation(keyPath: "position")
    
// Animation
//    hover.isAdditive = true
//    hover.fromValue = NSValue(cgPoint: CGPoint.zero)
//    hover.toValue = NSValue(cgPoint: CGPoint(x: 0.0, y: 100.0))
//    hover.autoreverses = true
//    hover.duration = 2
//    hover.repeatCount = Float.infinity
    
    
    
// Actions
    @IBAction func onReroll(){
        outputNumberInt = Int.random(in: 1..<maxNumberInt+1)
        print(String(outputNumberInt))
        outputNumberLabel?.text = String(outputNumberInt)
        rerollButton.setTitle("Reroll", for: .normal)
        mediumHaptic.impactOccurred()
//        addToHistory(currentVal: outputNumberInt)
    }
    
    @IBAction func stepperValueChanges(_ sender:UIStepper){
        print("Stepper Value: \(sender.value)")
        maxNumberInt = Int(sender.value)
        print(String(maxNumberInt))
        maxNumberLabel?.text = String(maxNumberInt)
        softHaptic.impactOccurred()
    }
    
//    @IBAction func addToHistory(currentVal: Int){
//        let label = UILabel(frame: .zero)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.textColor = UIColor.black
//        label.text = "Rolled: \(currentVal)"
//        historyView.addSubview(label)
//        print("\(currentVal) added to history")
//    }
}

