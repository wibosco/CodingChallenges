//
//  FindDigits.swift
//  HackerRank
//
//  Created by Boles on 08/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import Foundation

//https://www.hackerrank.com/challenges/find-digits
final class FindDigits {

     static func findCountOfDivisableValuesOfNumberInNumber(number: Int) -> Int {
        
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
