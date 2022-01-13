//
//  ViewController.swift
//  Prework
//
//  Created by Shivom Patel on 1/10/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var peopleInput: UITextField!
    @IBOutlet weak var eachPersonTotal: UILabel!
    @IBOutlet weak var eachPersonTip: UILabel!
    @IBOutlet weak var tipPercentageSlider: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        billAmountTextField.keyboardType = .asciiCapableNumberPad
        peopleInput.keyboardType = .asciiCapableNumberPad
        peopleInput.text = "1"
    }


    @IBAction func calculateTip(_ sender: Any) {
        let bill = Double(billAmountTextField.text!) ?? 0
        let numPeople = Int(peopleInput.text!) ?? 1
        let tipPercentages = [0.15, 0.18, 0.20]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipAmountLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        eachPersonTotal.text = String(format: "$%.2f", total / Double(numPeople))
        eachPersonTip.text = String(format: "$%.2f", tip / Double(numPeople))
    }
    
    @IBAction func calculateTipSlider(_ sender: UISlider) {
        let sliderValue = Int(sender.value)
        tipPercentageSlider.text = String(format: "%d%%", sliderValue)
        
        let bill = Double(billAmountTextField.text!) ?? 0
        let numPeople = Int(peopleInput.text!) ?? 1
        let tip = bill * Double(Double(sliderValue) / 100)
        let total = bill + tip
        
        tipAmountLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        eachPersonTotal.text = String(format: "$%.2f", total / Double(numPeople))
        eachPersonTip.text = String(format: "$%.2f", tip / Double(numPeople))
    }
    
}

