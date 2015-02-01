//
//  ViewController.swift
//  tips
//
//  Created by Josh Lubaway on 1/29/15.
//  Copyright (c) 2015 Frustrated Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var twoPersonLabel: UILabel!
    @IBOutlet weak var threePeopleLabel: UILabel!
    @IBOutlet weak var fourPeopleLabel: UILabel!

    var roundingSetting = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(animated: Bool) {
        let defaults = NSUserDefaults.standardUserDefaults()
        let percentSetting = defaults.integerForKey("tip_percent")

        tipControl.selectedSegmentIndex = percentSetting
        self.roundingSetting = defaults.integerForKey("rounding")

        self.onEditingChanged(self)
    }
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        var billAmount = NSString(string: billField.text).doubleValue
        let tipPercentages = [0.15, 0.18, 0.20]
        let tipPercent = tipPercentages[tipControl.selectedSegmentIndex]
        
        if billAmount > 999 {
            billAmount = billAmount / 100
            billField.text = "\(billAmount)"
        }
        
        var tip = billAmount * tipPercent
        var total = billAmount + tip

        if (self.roundingSetting == 1) {
            tip = round(tip)
            total = billAmount + tip
        } else if (self.roundingSetting == 2) {
            total = round(total)
            tip = total - billAmount
        }

        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)

        twoPersonLabel.text = String(format: "$%.2f", total / 2)
        threePeopleLabel.text = String(format: "$%.2f", total / 3)
        fourPeopleLabel.text = String(format: "$%.2f", total / 4)
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
}

