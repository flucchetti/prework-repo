//
//  ViewController.swift
//  Prework
//
//  Created by Francesca on 10/12/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var splitAmountLabel: UILabel!
    @IBOutlet weak var partyTextField: UITextField!
    @IBOutlet weak var partyStepper: UIStepper!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Tip Calculator"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = UserDefaults.standard
            
        // get tip defaults
        let tip1 = defaults.double(forKey: "defaultTip1")
        let tip2 = defaults.double(forKey: "defaultTip2")
        let tip3 = defaults.double(forKey: "defaultTip3")
            
        // set tip control
        let tip1String = String(Int(tip1)) + "%"
        let tip2String = String(Int(tip2)) + "%"
        let tip3String = String(Int(tip3)) + "%"
            
        tipControl.setTitle(tip1String, forSegmentAt: 0)
        tipControl.setTitle(tip2String, forSegmentAt: 1)
        tipControl.setTitle(tip3String, forSegmentAt: 2)
    }
    
    func calc_helper(){
        // get bill amt and party size from text field
        let bill = Double(billAmountTextField.text!) ?? 0
        let partySize = Int(partyTextField.text!) ?? 1
        
        // get tip defaults
        let defaults = UserDefaults.standard
        let tip1 = defaults.double(forKey: "defaultTip1")
        let tip2 = defaults.double(forKey: "defaultTip2")
        let tip3 = defaults.double(forKey: "defaultTip3")
        
        // get total tip: tip * tipPercentage
        let tipPercentages = [tip1/100, tip2/100, tip3/100]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        let splitAmt = total / Double(partySize)
        
        // Update tip amt label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        // Update total amt label
        totalLabel.text = String(format: "$%.2f", total)
        // Update per person amt label
        splitAmountLabel.text = String(format: "$%.2f", splitAmt)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        calc_helper()
    }
    
    @IBAction func changeBillAmount(_ sender: UITextField){
        calc_helper()
    }

    @IBAction func changePartyStepper(_ sender: UIStepper) {
        let stepper_val = Int(partyStepper.value)
        partyTextField.text = stepper_val.description
        calc_helper()
    }
    
    @IBAction func changePartyText(_ sender: UITextField) {
        let new_party_size = Int(partyTextField.text!) ?? 1
        partyStepper.value = Double(new_party_size)
        calc_helper()
    }
    
}

