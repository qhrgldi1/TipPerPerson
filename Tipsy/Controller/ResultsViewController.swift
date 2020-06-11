//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by JSworkstation on 2020/06/11.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var perCost: Float = 0.0
    var people: Int?
    var tipPct: Float = 0.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = String(format: "%0.2f", perCost)
        settingsLabel.text = "Split between \(people!) people, with \(String(format: "%0.0f", tipPct * 10))% tip"
        
    }
    

    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
