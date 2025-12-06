// Created 08/05/2016.

import Foundation

//https://www.hackerrank.com/challenges/find-digits
final class FindDigits {

     static func findCountOfDivisibleValuesOfNumberInNumber(number: Int) -> Int {
        
        var divisibles = 0
        
        let stringNumber = String(number)
        
        for ch in stringNumber {
            if let digit = Int(String(ch)) {
                
                if digit > 0 {
                    
                    if number % digit == 0 {
                        
                        divisibles += 1
                    }
                    
                }
            }
        }
        
        return divisibles
    }
}
