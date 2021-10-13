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
    @IBOutlet weak var sliderLabel: UILabel!
    
//    let locationManager = CLLocationManager()
//    func getSymbol(forCurrencyCode code: String) -> String? {
//       let locale = NSLocale(localeIdentifier: code)
//       return locale.displayNameForKey(NSLocaleCurrencySymbol, value: code)
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Tip Calculator"
    }
    
    func calc_helper(){
        // Get bill amt from text field
        let bill = Double(billAmountTextField.text!) ?? 0
        let partySize = Int(partyTextField.text!) ?? 1
        
        // Get total tip: tip * tipPercentage
        let tipPercentages = [0.15, 0.18, 0.2]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        let splitAmt = total / Double(partySize)
        
        // Update tip amt label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        // Update total amt
        totalLabel.text = String(format: "$%.2f", total)
        // Update per person amt
        splitAmountLabel.text = String(format: "$%.2f", splitAmt)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        calc_helper()
    }

    @IBAction func changeParty(_ sender: UIStepper) {
        self.partyTextField.text = Int(sender.value).description
        calc_helper()
    }
    
    @IBAction func changeBillAmount(_ sender: UITextField) {
        calc_helper()
    }
    
    @IBAction func changePartySize(_ sender: UITextField) {
        calc_helper()
    }
    
    @IBAction func setTipSlider(_ sender: UISlider) {
        sliderLabel.text = String(format: "$%d", Int(sender.value))
        sender.value = roundf(sender.value)
        let trackRect = sender.trackRect(forBounds: sender.frame)
        let thumbRect = sender.thumbRect(forBounds: sender.bounds, trackRect: trackRect, value: sender.value)
        self.sliderLabel.center = CGPoint(x: thumbRect.midX, y: self.sliderLabel.center.y)
        let bill = Double(billAmountTextField.text!) ?? 0
        if( bill != 0 ){
                calc_helper()
        }
        
    }
}

