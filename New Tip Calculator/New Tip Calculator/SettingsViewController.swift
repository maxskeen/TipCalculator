//
//  SettingsViewController.swift
//  New Tip Calculator
//
//  Created by Max Skeen on 11/15/20.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var darkModeButton: UISwitch!
    @IBOutlet weak var darkModeLabel: UILabel!
    
    let main:ViewController = ViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func darkModeButton(_ sender: Any) {
        
        presentingViewController
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
