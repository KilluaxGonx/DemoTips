//
//  ViewController.swift
//  Prework
//
//  Created by Recleph Mere on 9/18/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    
    @IBOutlet weak var tipPercentage: UILabel!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var percentageSlider: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

    }
    
    override func viewDidAppear(_ animated: Bool) {
        // Set keypad to use only numpad with decimals
        billAmountTextField.keyboardType = UIKeyboardType.decimalPad
        billAmountTextField.keyboardAppearance = UIKeyboardAppearance.default
        billAmountTextField.becomeFirstResponder()
        
        // Set default percentages to match active selection on view appear
        tipPercentage.text = "15%"
        percentageSlider.value = 15
    }

    @IBAction func modifyTip(_ sender: Any) {
        // Sync the segment controller to active with the slider values
        switch round(percentageSlider.value) {
            case 15:
                tipControl.selectedSegmentIndex = 0
            case 18:
                tipControl.selectedSegmentIndex = 1
            case 20:
                tipControl.selectedSegmentIndex = 2
            default:
                tipControl.selectedSegmentIndex = UISegmentedControl.noSegment
        }
        let bill = Double(billAmountTextField.text!) ?? 0
        // Get Total tip by multiplying tip * tipPercentage
        // Round values to get a more consolidated result for user
        let percentage = Double(round(percentageSlider.value) / 100)
        
        tipPercentage.text = String(format: "%.0f%%", percentageSlider.value)
        let tip = bill * percentage
        let total = bill + tip
        
        // Update Tip Amount label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        // Update Total Amount
        totalLabel.text = String(format: "$%.2f", total)
        
        
    }
    @IBAction func calculateTip(_ sender: Any) {
        let bill = Double(billAmountTextField.text!) ?? 0
        // Get Total tip by multiplying tip * tipPercentage
        let tipPercentageList = [0.15, 0.18, 0.20]
        
        // Sync the slider with the value of the segment controller
        switch tipControl.selectedSegmentIndex {
            case 0:
                tipPercentage.text = "15%"
                percentageSlider.value = 15
            case 1:
                tipPercentage.text = "18%"
                percentageSlider.value = 18
            case 2:
            tipPercentage.text = "20%"
            percentageSlider.value = 20
        default:
            tipPercentage.text = "0%"
            percentageSlider.value = 0
        }
        let tip = bill * tipPercentageList[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        // Update Tip Amount label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        // Update Total Amount
        totalLabel.text = String(format: "$%.2f", total)
    }
}

