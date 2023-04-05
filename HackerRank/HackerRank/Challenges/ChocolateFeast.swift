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
    
     static func countOfEatenChocolates(dollarsInPocket: Int, chocolatePrice: Int, wrapperExchangeTheshold: Int) -> Int {
        let chocolatesBrought = dollarsInPocket/chocolatePrice
        let chocolatesExchanged = exchangeWrappersForChocolate(chocolatesBrought,
                                                               wrapperExchangeTheshold)
        
        return chocolatesBrought + chocolatesExchanged
    }
    
     static func exchangeWrappersForChocolate(_ wrappers: Int, _ wrapperExchangeTheshold: Int) -> Int {
        var chocolatesFromExchange = wrappers/wrapperExchangeTheshold
        
        if chocolatesFromExchange > 0 {
            let leftOverWrappersCount = wrappers % wrapperExchangeTheshold
            
            let furtherChocolateExchange = chocolatesFromExchange + leftOverWrappersCount
            
            let potentialFurtherChocolateInExchange = exchangeWrappersForChocolate(furtherChocolateExchange,
                                                                                   wrapperExchangeTheshold)
            
            if potentialFurtherChocolateInExchange > 0 {
                chocolatesFromExchange += potentialFurtherChocolateInExchange
            }
        }
        
        return chocolatesFromExchange
    }
}
