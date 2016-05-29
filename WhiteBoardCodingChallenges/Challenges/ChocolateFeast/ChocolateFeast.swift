//
//  ChocolateFeast.swift
//  WhiteBoardCodingChallenges
//
//  Created by Boles on 08/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import UIKit

class ChocolateFeast: NSObject {
    
    class func countOfEatenChocolates(dollarsInPocket: Int, chocolatePrice: Int, wrapperExchangeTheshold: Int) -> Int {
        
        let chocolatesBrought = dollarsInPocket/chocolatePrice
        let chocolatesExchanged = ChocolateFeast.exchangeWrappersForChocolate(chocolatesBrought, wrapperExchangeTheshold: wrapperExchangeTheshold)
        
        return chocolatesBrought + chocolatesExchanged
    }
    
    class func exchangeWrappersForChocolate(wrappers: Int, wrapperExchangeTheshold: Int) -> Int {
        
        var chocolatesFromExchange = wrappers/wrapperExchangeTheshold
        
        if chocolatesFromExchange > 0 {
            
            let leftOverWrappersCount = wrappers % wrapperExchangeTheshold
            
            let furtherChocolateExchange = chocolatesFromExchange + leftOverWrappersCount
            
            let potentialFurtherChocolateInExchange = ChocolateFeast.exchangeWrappersForChocolate(furtherChocolateExchange, wrapperExchangeTheshold: wrapperExchangeTheshold)
            
            if potentialFurtherChocolateInExchange > 0 {
                
                chocolatesFromExchange += potentialFurtherChocolateInExchange
            }
        }
        
        return chocolatesFromExchange
    }
}
