//
//  CalculateBrain.swift
//  Tipsy
//
//  Created by JSworkstation on 2020/06/11.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

struct CalculateBrain {
    
    var tipPct: Float = 0.0
    var numberOfPeople: Int? = 2
    var billText: String = ""
    var cost: Float = 0.0
    
    mutating func selectTip(_ userSelectTip: String) {
        if userSelectTip == "0%" {
            tipPct = 0.0
        } else if userSelectTip == "10%" {
            tipPct = 1.0
        } else {
            tipPct = 2.0
        }
    }
    
    mutating func getNumberOfPeople(value: Float) {
        numberOfPeople = Int(value)
    }
    
    mutating func getPerCost(billText: String) {
        cost = (Float(billText) ?? 0.0) * (1 + tipPct) / Float(numberOfPeople!)
    }
    
    func getResultCost() -> Float {
        return cost
    }
    
    func getPeople() -> Int? {
        return numberOfPeople
    }
    
    func getTipPct() -> Float {
        return tipPct
    }
}
