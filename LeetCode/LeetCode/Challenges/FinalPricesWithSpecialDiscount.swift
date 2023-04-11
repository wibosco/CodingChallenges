//
//  FinalPricesWithSpecialDiscount.swift
//  LeetCodeTests
//
//  Created by William Boles on 14/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/final-prices-with-a-special-discount-in-a-shop/
//stack
struct FinalPricesWithSpecialDiscount {
    
    //Time: O(n) `n` is the prices
    //Space: O(n) `n` is the final prices
    //monotonic ascending stack
    //
    //Solution Description:
    //Using a monotonic ascending stack we iterate through the `prices` array, adding prices to the stack until we come
    //across an price that is less than the last price in the stock. We pop that last item and pop substitute the
    //current price from it to get the discounted price which is then put into the `finalPrices` array.
    //
    //Background:
    //Monotonic = It is a word for mathematics functions. A function y = f(x) is monotonically increasing or decreasing
    //when it follows the below conditions:
    //
    //As x increases, y also increases always, then it’s a monotonically increasing function.
    //As x increases, y decreases always, then it’s a monotonically decreasing function.
    //
    //See: https://www.geeksforgeeks.org/introduction-to-monotonic-stack-data-structure-and-algorithm-tutorials/
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
