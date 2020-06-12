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
    
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var peopleLabel: UILabel!
    @IBOutlet weak var stepperPressed: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tipPressed(_ sender: UIButton) {
        let currentSelectedTip = sender.currentTitle!
        
        if currentSelectedTip == "0%" {
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
            
        } else if currentSelectedTip == "10%" {
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = true
            twentyPctButton.isSelected = false
            
        } else {
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = true
            
        }
        
        calculateBrain.selectTip(currentSelectedTip)
        billTextField.endEditing(true)
    }
    
    @IBAction func stepperUpDown(_ sender: UIStepper) {
        peopleLabel.text = String(format: "%.0f", stepperPressed.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let beforeCalculate = Float(billTextField.text!) ?? 0.0
        let people = Float(peopleLabel.text!) ?? 2.0
        
        calculateBrain.getResult(beforeCalculate, people)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.tip = calculateBrain.getTip()
            destinationVC.people = calculateBrain.getPeople()
            destinationVC.result = calculateBrain.gettingResult()
        }
    }
}

