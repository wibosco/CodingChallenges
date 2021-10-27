//
//  FindDigits.swift
//  CodingChallenges
//
//  Created by Boles on 08/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import UIKit

//https://www.hackerrank.com/challenges/find-digits
class FindDigits {

     static func findCountOFDivisableValuesOfNumberInNumber(number: Int) -> Int {
        
        var divisables = 0
        
        let stringNumber = String(number)
        
        for ch in stringNumber {
            if let digit = Int(String(ch)) {
                
                if digit > 0 {
                    
                    if number % digit == 0 {
                        
                        divisables += 1
                    }
                    
                }
            }
        }
        
        return divisables
    }
}
