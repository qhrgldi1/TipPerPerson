//
//  ResultViewController.swift
//  Tipsy
//
//  Created by JSworkstation on 2020/06/12.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    var tip: Float = 0.0
    var beforeCalculate: Float = 0
    var people: Float = 2
    var result: Float = 0
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        resultLabel.text = String(result)
        descriptionLabel.text = "Split between \(String(format: "%.0f", people)) people, with \(Int(tip * 100))% tip."
    }
    

    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
