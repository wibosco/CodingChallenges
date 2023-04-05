//
//  BestTimeToBuyAndSellStock.swift
//  LeetCode
//
//  Created by William Boles on 31/01/2022.
//

import Foundation

//https://leetcode.com/problems/best-time-to-buy-and-sell-stock/
//array
struct BestTimeToBuyAndSellStock {
    
    //Time: O(n) where `n` is the number of elements in `prices`
    //Space: O(1)
    //counting
    //greedy
    //Kadanes algorithm
    //
    //Solution Description:
    //To generate the maximum profit we need to find the largest difference two price elements - as we can't buy in the future
    //and sell in the past that difference needs to be with the low price coming before the high price. To do this we keep track
    //of the highest possible profit that we've come across so far and the lowest buying price that we've seen. As we iterate
    //through `prices` we substract the current price from the lowest buying price and compare it against the highest possible
    //profit value that we have seen so far - if it larger then we update with the current difference and if lower we discard.
    //We are always looking for a lower price so when we encounter one we update our lowest buying price value.
    //
    //See: https://en.wikipedia.org/wiki/Maximum_subarray_problem#Kadane's_algorithm
    static func maxProfit(_ prices: [Int]) -> Int {
        var maxProfit = 0
        var lowestBuyingPrice = prices[0]
        
        for price in prices[1...] {
            lowestBuyingPrice = min(price, lowestBuyingPrice)
            maxProfit = max(maxProfit, (price - lowestBuyingPrice))
        }
        
        return maxProfit
    }
}
