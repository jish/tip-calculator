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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        var billAmount = NSString(string: billField.text).doubleValue
        let tipPercentages = [0.15, 0.18, 0.20]
        let tipPercent = tipPercentages[tipControl.selectedSegmentIndex]
        
        if billAmount > 999 {
            billAmount = billAmount / 100
            billField.text = "\(billAmount)"
        }
        
        let tip = billAmount * tipPercent
        let total = billAmount + tip
        
        println(billAmount)
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
}

