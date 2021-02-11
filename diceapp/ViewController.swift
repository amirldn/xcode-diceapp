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
//        if uuid == "226B63ED-5727-43E2-B0FE-47CDA496FE1D" {
//            userTitle.text = "Amir's Dice App"
//        }
//        else {
//            userTitle.text = "\(users)+Dice App"
//        }
        
//        Animation
        hover.isAdditive = true
        hover.fromValue = NSValue(cgPoint: CGPoint.zero)
        hover.toValue = NSValue(cgPoint: CGPoint(x: -5.0, y: 0.0))
        hover.autoreverses = true
        hover.duration = 0.5
        hover.repeatCount = Float.infinity
        
        floatingArrow.layer.add(hover, forKey: "myHoverAnimation")
        

        
        
        
    }
    
// Outlets
    @IBOutlet weak var outputNumberLabel:UILabel?
    @IBOutlet weak var maxNumberLabel:UILabel?
    @IBOutlet weak var userTitle: UILabel!
    @IBOutlet weak var stepper:UIStepper?
    @IBOutlet weak var floatingArrow: UIImageView!
    @IBOutlet weak var rerollButton: UIButton!
    @IBOutlet weak var RollOutputView: UIView!
    
// Internal Variables
    var outputNumberInt = 0
    var maxNumberInt = 6
    var firstRoll = true
    
    
// Constants
    let uuid = UIDevice.current.identifierForVendor?.uuidString
    let mediumHaptic = UIImpactFeedbackGenerator(style: .medium)
    let softHaptic = UIImpactFeedbackGenerator(style: .soft)
    
    
// Animation
    let hover = CABasicAnimation(keyPath: "position")
    let shake = CABasicAnimation(keyPath: "position")
    
    
    
// Actions
    @IBAction func onReroll(){
        if firstRoll == true{
            firstRollChange()
        }
        outputNumberInt = Int.random(in: 1..<maxNumberInt+1)
        CATransaction.begin()
        CATransaction.setCompletionBlock({
            self.outputNumberLabel?.text = String(self.outputNumberInt)
            self.mediumHaptic.impactOccurred()
        })
        shakeView(view: RollOutputView)
        CATransaction.commit()
        
        
//        outputNumberLabel?.text = String(outputNumberInt)
        
        
        
    }
    
    @IBAction func stepperValueChanges(_ sender:UIStepper){
        print("Stepper Value: \(sender.value)")
        maxNumberInt = Int(sender.value)
        maxNumberLabel?.text = String(maxNumberInt)
        softHaptic.impactOccurred()
    }
    
    func firstRollChange(){
        firstRoll = false
        rerollButton.setTitle("Reroll", for: .normal)
    }
    
    func shakeView(view:UIView){
        let x_shake = Int.random(in: Int.random(in: -3 ..< 0)..<Int.random(in: 0..<3))
        let y_shake = Int.random(in: 10..<15)
        shake.isAdditive = true
        shake.fromValue = NSValue(cgPoint: CGPoint.zero)
        shake.toValue = NSValue(cgPoint: CGPoint(x: x_shake, y: y_shake))
        shake.autoreverses = true
        shake.duration = 0.1
        shake.repeatCount = 2
        RollOutputView.layer.add(shake, forKey: "shakeAnimation")
        softHaptic.impactOccurred()
    }
}

