//
//  ChocolateFeast.swift
//  HackerRank
//
//  Created by Boles on 08/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import Foundation

//https://www.hackerrank.com/challenges/chocolate-feast
final class ChocolateFeast {
    
     static func countOfEatenChocolates(dollarsInPocket: Int, chocolatePrice: Int, wrapperExchangeThreshold: Int) -> Int {
        let chocolatesBrought = dollarsInPocket/chocolatePrice
        let chocolatesExchanged = exchangeWrappersForChocolate(chocolatesBrought,
                                                               wrapperExchangeThreshold)
        
        return chocolatesBrought + chocolatesExchanged
    }
    
     static func exchangeWrappersForChocolate(_ wrappers: Int, _ wrapperExchangeThreshold: Int) -> Int {
        var chocolatesFromExchange = wrappers/wrapperExchangeThreshold
        
        if chocolatesFromExchange > 0 {
            let leftOverWrappersCount = wrappers % wrapperExchangeThreshold
            
            let furtherChocolateExchange = chocolatesFromExchange + leftOverWrappersCount
            
            let potentialFurtherChocolateInExchange = exchangeWrappersForChocolate(furtherChocolateExchange,
                                                                                   wrapperExchangeThreshold)
            
            if potentialFurtherChocolateInExchange > 0 {
                chocolatesFromExchange += potentialFurtherChocolateInExchange
            }
        }
        
        return chocolatesFromExchange
    }
}
