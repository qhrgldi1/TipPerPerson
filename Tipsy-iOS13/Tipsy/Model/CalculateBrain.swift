//
//  CalculateBrain.swift
//  Tipsy
//
//  Created by JSworkstation on 2020/06/12.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct CalculateBrain {
    var tip: Float = 0
    var beforeCalculate: Float = 0
    var people: Float = 2
    var result: Float = 0
    
    mutating func selectTip(_ currentSelectedTip: String) {
        if currentSelectedTip == "0%" {
            tip = 0
        } else if currentSelectedTip == "10%" {
            tip = 0.1
        } else {
            tip = 0.2
        }
    }
    
    mutating func getResult(_ beforeCalculate: Float, _ people: Float) {
        result = beforeCalculate * (1 + tip) / people
    }
    
    func getTip() -> Float {
        return tip
    }
    
    func getPeople() -> Float {
        return people
    }
    
    func gettingResult() -> Float {
        return result
    }

}
