//
//  ViewController.swift
//  HelloWorld
//
//  Created by Vivin Rajagopalan on 3/12/17.
//  Copyright © 2017 Vivin Rajagopalan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipSwitch: UISwitch!
    @IBOutlet weak var totalLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.tipLabel.isEnabled = false;
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    @IBAction func calculateTip(_ sender: Any) {
        calculate()
    }
    @IBAction func onBillChanged(_ sender: Any) {
        calculate()
    }

    @IBAction func onchangeTip(_ sender: Any) {
        print("value is .....", UISegmentedControl.accessibilityElementsHidden())
        //UISegmentedControl.accessibilityElementsHidden()
        if(tipSwitch.isOn){
            self.tipControl.isHidden = true;
            //self.tipLabel.isEnabled = true;
        }else{
            self.tipControl.isHidden = false;
            //self.tipLabel.isEnabled = false;
        }
        
    }
    
    @IBAction func onEditCustomTip(_ sender: Any) {
        self.tipLabel.isEnabled = true;
        print("inside")
        calculate()
    }
    
    func calculate() -> Void {
        let tipPercentages = [0.18, 0.20, 0.25]
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        tipLabel.text=String(format: "$%.2f", tip)
        totalLabel.text=String(format: "$%.2f", total)
        
    }

}

