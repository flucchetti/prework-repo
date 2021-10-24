//
//  SettingsViewController.swift
//  Prework
//
//  Created by Francesca on 10/12/21.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTip1Field: UITextField!
    @IBOutlet weak var defaultTip2Field: UITextField!
    @IBOutlet weak var defaultTip3Field: UITextField!
    @IBOutlet weak var darkModeSwitch: UISwitch!
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // set defaults
        let tip1 = Double(defaultTip1Field.text!) ?? 15.0
        let tip2 = Double(defaultTip2Field.text!) ?? 18.0
        let tip3 = Double(defaultTip3Field.text!) ?? 20.0
        
        defaults.set(tip1, forKey: "defaultTip1")
        defaults.set(tip2, forKey: "defaultTip2")
        defaults.set(tip3, forKey: "defaultTip3")
        
        defaults.synchronize()
    }
    
    func darkModeHelper()
    {
        navigationController!.overrideUserInterfaceStyle = defaults.bool(forKey: "darkMode") ? .dark : .light
    }
    
    
    @IBAction func activateDarkMode(_ sender: Any) {
        defaults.set(darkModeSwitch.isOn, forKey: "darkMode")
        defaults.synchronize()
        darkModeHelper()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        darkModeSwitch.setOn(defaults.bool(forKey: "darkMode"), animated: false)
        darkModeHelper()
        
        defaultTip1Field.text = String(defaults.double(forKey: "defaultTip1"))
        defaultTip2Field.text = String(defaults.double(forKey: "defaultTip2"))
        defaultTip3Field.text = String(defaults.double(forKey: "defaultTip3"))
    }
    
}
