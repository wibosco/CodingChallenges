//
//  DecimalToBinary.swift
//  CodingChallenges
//
//  Created by William Boles on 06/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import UIKit

class DecimalToBinary: NSObject {

    class func convertDecimalToBinary(decimal: Int) -> String {
        
        var convertingDecimal = decimal
        var binaryValue = ""
        
        while convertingDecimal > 0 {
            
            let modValue = convertingDecimal % 2
            convertingDecimal = convertingDecimal / 2
            
            binaryValue += "\(modValue)"
        }
        
        return String(binaryValue.reversed())
    }
}
