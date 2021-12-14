//
//  FinalPricesWithSpecialDiscount.swift
//  CodingChallengesTests
//
//  Created by William Boles on 14/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/final-prices-with-a-special-discount-in-a-shop/
//stack
struct FinalPricesWithSpecialDiscount {
    
    //Time: O(n) where `n` is the prices
    //Space: O(n) where `n` is the final prices
    //monotonic ascending stack
    //
    //Solution Description:
    //Using a monotonic ascending stack we iterate through the `prices` array, adding prices
    //to the stack until we come across an price that is less than the last price in the stock.
    //We pop that last item and pop substitute the current price from it to get the discounted
    //price which is then put into the `finalPrices` array.
    static func finalPrices(_ prices: [Int]) -> [Int] {
        var finalPrices = prices
        var stack = [Int]()
        
        for (i, price) in prices.enumerated() {
            while !stack.isEmpty {
                guard prices[stack.last!] >= price else {
                    break
                }
                
                let toBeDiscounted = stack.removeLast()
                finalPrices[toBeDiscounted] -= price
            }
            stack.append(i)
        }
        
        return finalPrices
    }
}
