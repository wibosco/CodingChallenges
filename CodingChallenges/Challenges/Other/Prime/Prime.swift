//
//  Prime.swift
//  CodingChallenges
//
//  Created by William Boles on 06/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import UIKit

class Prime: NSObject {

    // MARK: isPrime
    
    class func isPrime(value: Int) -> Bool {
        
        if value < 4 {
            
            return true
        }
        
        if value % 2 == 0 {
            
            return false
        }
        
        let squareRootDouble: Double = sqrt(Double(value))
        
        if squareRootDouble == floor(squareRootDouble) {
            
            return false
        }
        
        var i = 5
        
        while i * i < value {
            
            if value % i == 0 {
                
                return false
            }
            
            i = i + 2
        }
        
        return true
    }
    
    // MARK: PrimeFactors
    
    class func primeFactors(value: Int) {

        var runningTotal = value
        
        var i = 2
        
        while i < runningTotal {
            
            if runningTotal % i == 0 {
                
                print("\(i)")
                
                runningTotal = runningTotal / i
                
                i = 2
            }
            else {
                i = i + 1
            }
        }
        
        print(i)
    }
}
