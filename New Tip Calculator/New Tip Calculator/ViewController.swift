//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Max Skeen on 11/12/20.
//

import UIKit

class ViewController: UIViewController {
    
    //Declare variables
    var tipPercent = 0.0
    let tipPercentages = [15, 20, 25]
    
    //Declare Elements
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipField: UITextField!
    @IBOutlet weak var totalField: UITextField!

    @IBOutlet weak var billLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var darkModeLabel: UILabel!
    
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var rateField: UITextField!
    
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var darkModeSwitch: UISwitch!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet var background: UIView!
    @IBOutlet weak var dollarSign: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
   // let defaults = UserDefaults.standard

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tipSlider.value = Float(tipPercentages[tipControl.selectedSegmentIndex])
        billField.becomeFirstResponder()
        rateField.text = String(UserDefaults.standard.integer(forKey: "Rate")) + "%"
        tipField.text =  "$" + String(format: "%.2f", UserDefaults.standard.double(forKey: "Tip"))
        
        billField.text = String(format: "%.2f", UserDefaults.standard.double(forKey: "Bill"))
        
//        if UserDefaults.standard.double(forKey: "Bill") == 0.0 {
//            billField.text = String(format: "%.2f", UserDefaults.standard.double(forKey: "Bill"))
//        }
//        else {
//            billField.text = String(UserDefaults.standard.double(forKey: "Bill"))
//        }
        
        totalField.text = "$" + String(format: "%.2f", UserDefaults.standard.double(forKey: "Total"))
        tipSlider.value = UserDefaults.standard.float(forKey: "Slider Value")
        tipControl.selectedSegmentIndex = UserDefaults.standard.integer(forKey: "Tip Control Index")
        
        if UserDefaults.standard.bool(forKey: "DarkMode on") {
            darkModeSwitch.setOn(UserDefaults.standard.bool(forKey: "DarkMode on"), animated: true)
            
            if darkModeSwitch.isOn {
                background.backgroundColor = UIColor.darkGray
                
                changeTextColor(color: UIColor.white)
                
                UserDefaults.standard.set(true, forKey: "DarkMode on")
            }
            else {
                background.backgroundColor = UIColor.white
                
                changeTextColor(color: UIColor.black)
                
                UserDefaults.standard.set(false, forKey: "DarkMode on")
            }
            
            
        }
    }    
    
    func changeTextColor(color: UIColor)
    {
        billLabel.textColor = color
        tipLabel.textColor = color
        totalLabel.textColor = color
        billField.textColor = color
        tipField.textColor = color
        totalField.textColor = color
        dollarSign.textColor = color
        rateField.textColor = color
        rateLabel.textColor = color
    }
    
    @IBAction func darkModeClicked(_ sender: Any) {
        
        if darkModeSwitch.isOn {
            background.backgroundColor = UIColor.darkGray
            
            changeTextColor(color: UIColor.white)
            
            UserDefaults.standard.set(true, forKey: "DarkMode on")
        }
        else {
            background.backgroundColor = UIColor.white
            
            changeTextColor(color: UIColor.black)
            
            UserDefaults.standard.set(false, forKey: "DarkMode on")
        }
    }
    
    @IBAction func tipSlid(_ sender: Any) {
        
        tipSlider.value = round(tipSlider.value)
        rateField.text = String(Int(round(tipSlider.value))) + "%"
        
        tipPercent = Double(tipSlider.value)
        
        UserDefaults.standard.set(tipSlider.value, forKey: "Slider Value")
        print("Default \(String(tipSlider.value))")
    }
    
    @IBAction func tipSelected(_ sender: Any) {
        
        rateField.text = String(tipPercentages[tipControl.selectedSegmentIndex]) + "%"
        
        tipSlider.value = Float(tipPercentages[tipControl.selectedSegmentIndex])
        
        
        tipPercent = Double(tipPercentages[tipControl.selectedSegmentIndex])
        
        //Get the Bill Amount
        let bill = Double(billField.text!) ?? 0
        
        //Calculate the tip and total
        
        let tip = tipPercent/100 * bill
        
        let total = bill + tip
        
        //Update the tip and total labels
        tipField.text = String(format: "$%.2f", tip)
        totalField.text = String(format: "$%.2f", total)
        
        UserDefaults.standard.set(tip, forKey: "Tip")
        UserDefaults.standard.set(tipPercent, forKey: "Rate")
        UserDefaults.standard.set(bill, forKey: "Bill")
        UserDefaults.standard.set(total, forKey: "Total")
        UserDefaults.standard.set(tipControl.selectedSegmentIndex, forKey: "Tip Control Index")
        UserDefaults.standard.set(tipSlider.value, forKey: "Slider Value")
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        
        
        //Get the Bill Amount
        let bill = Double(billField.text!) ?? 0
        
        //Calculate the tip and total
        let tip = tipPercent/100 * bill
        let total = bill + tip
        
        //Update the tip and total labels
        tipField.text = String(format: "$%.2f", tip)
        totalField.text = String(format: "$%.2f", total)
        
        UserDefaults.standard.set(tip, forKey: "Tip")
        UserDefaults.standard.set(tipPercent, forKey: "Rate")
        UserDefaults.standard.set(bill, forKey: "Bill")
        UserDefaults.standard.set(total, forKey: "Total")
    }
}

