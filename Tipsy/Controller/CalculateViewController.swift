//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var calculateBrain = CalculateBrain()
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        billTextField.becomeFirstResponder()
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        let userSelectTip = sender.currentTitle!
        billTextField.endEditing(true)
        
        switch userSelectTip {
            case "0%":
                zeroPctButton.isSelected = true
                tenPctButton.isSelected = false
                twentyPctButton.isSelected = false
                
            case "10%":
                zeroPctButton.isSelected = false
                tenPctButton.isSelected = true
                twentyPctButton.isSelected = false
                
            case "20%":
                zeroPctButton.isSelected = false
                tenPctButton.isSelected = false
                twentyPctButton.isSelected = true
                
            default:
                zeroPctButton.isSelected = false
                tenPctButton.isSelected = false
                twentyPctButton.isSelected = false
        }
        
        calculateBrain.selectTip(userSelectTip)

    }
    
    @IBAction func stepperChanged(_ sender: UIStepper) {
        splitNumberLabel.text = Int(sender.value).description
        calculateBrain.getNumberOfPeople(value: Float(sender.value))
        
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        calculateBrain.getPerCost(billText: billTextField.text ?? "0.0")
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.perCost = calculateBrain.getResultCost()
            destinationVC.people = calculateBrain.getPeople()
            destinationVC.tipPct = calculateBrain.getTipPct()
        }
    }
}

