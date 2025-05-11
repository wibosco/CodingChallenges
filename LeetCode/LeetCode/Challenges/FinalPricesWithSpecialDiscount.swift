//
//  FinalPricesWithSpecialDiscount.swift
//  LeetCodeTests
//
//  Created by William Boles on 14/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/final-prices-with-a-special-discount-in-a-shop/
struct FinalPricesWithSpecialDiscount {
    
    //Time: O(n) where n is the number of elements in `prices`
    //Space: O(n)
    //stack
    //monotonic stack
    //array
    //
    //Solution Description:
    //As not all prices will be discounted when we  initilise `finalPrices` we make a copy of `price`, this ensures
    //that prices whether discounted or not are present in the final array. Instead of calculating the discount for
    //the current price we actually add the current price to an ascending monotonic stack to be calculated when we
    //find the lower price. So calculating the earlier `index[i]` only when we reach the later `index[j]`. By using
    //a stack this way we able to calculate all discounts in O(n) time complexity. So for each price we encounter we
    //first check if that price is lower than the prices in the stack - if it is we can now discount that earlier
    //prices and set its final price; if not we skip (all other prices in the stack will be lower so we can break out
    //of the stack loop). We then add the current price to the stack. We repeat this process for all prices. And
    //finally return `finalPrices`.
    //
    //Background:
    //Monotonic = It is a word for mathematics functions. A function y = f(x) is monotonically increasing or decreasing
    //when it follows the below conditions:
    //
    //As x increases, y also increases always, then it’s a monotonically increasing function.
    //As x increases, y decreases always, then it’s a monotonically decreasing function.
    //
    //See: https://www.geeksforgeeks.org/introduction-to-monotonic-stack-data-structure-and-algorithm-tutorials/
    //
    //Similar to: https://leetcode.com/problems/next-greater-node-in-linked-list/
    func finalPrices(_ prices: [Int]) -> [Int] {
        var finalPrices = prices
        var stack = [Int]() //this stack contains the indexes of the prices waiting to be discounted
        
        for j in 0..<prices.count {
            while let i = stack.last {
                guard prices[j] <= prices[i] else { //check if prices[i] can be popped from the stack
                    break
                }
                
                finalPrices[i] = prices[i] - prices[j]
                stack.removeLast() //pop
            }
            stack.append(j)
        }
        
        return finalPrices
    }
}
