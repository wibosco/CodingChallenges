//
//  BestTimeToBuyAndSellStockII.swift
//  LeetCode
//
//  Created by William Boles on 01/02/2022.
//

import Foundation

//https://leetcode.com/problems/best-time-to-buy-and-sell-stock-ii/
struct BestTimeToBuyAndSellStockII {
    
    //Time: O(n) where n is the number of elements in `prices`
    //Space: O(1)
    //array
    //greedy
    //
    //Solution Description:
    //To generate profit we need to buy low and sell high. We can do this by tracking the cheapest (min) stock price that
    //hasn't been sold yet. When we encounter a price is higher then we sell and take that higher price as the new cheapest
    //stock price and repeat the process. If we encounter a price that is lower then we set that lower price to be the
    //cheapest stock price. We repeat this process until all prices have been processed and can return `profit`.
    func maxProfit(_ prices: [Int]) -> Int {
        var cheapest = prices[0]
        var profit = 0

        for p in prices[1...] {
            if p > cheapest {
                profit += (p - cheapest)
                cheapest = p
            } else {
                cheapest = min(cheapest, p)
            }
        }

        return profit
    }
    
    //Time: O(n) where n is the number of elements in `prices`
    //Space: O(n)
    //array
    //stack
    //monotonic stack
    //
    //Solution Description:
    //To generate profit we need to buy low and sell high. We can do this by tracking the cheapest (min) stock price that
    //hasn't been sold yet in a monotonic stack. When we encounter a price is less than what is currently in the stack we
    //remove those higher values until either the stack is empty or a cheaper price is encountered. Once we know that the
    //the stack can contain only cheaper prices than the current price we sell that cheaper price and add the difference to
    //`profit`, we then add the current price to `stack` and repeat the process for next price. Once all elements in
    //`prices` have been processed we return `profit`.
    func maxProfit2(_ prices: [Int]) -> Int {
        var stack = [Int]()
        var profit = 0

        for p in prices {
            while let last = stack.last, last > p {
                stack.removeLast()
            }

            if !stack.isEmpty {
                let last = stack.removeLast()
                profit += (p - last)
            }
            stack.append(p)
        }

        return profit
    }
    
    //Time: O(n) where n is the number of elements in `prices`
    //Space: O(1)
    //array
    //counting
    //greedy
    //Kadanes algorithm
    //
    //Solution Description:
    //To generate profit we need to buy low and sell high. We can do this by always comparing the current price with the
    //next price. If the next price is higher we don't buy and if it lower we do buy and sell that next day. The profit is
    //then banked and we continue on looking for the next profitable buy/sell combination. We are not trying to find the
    //greatest positive difference instead we are using a greedy approach and taking any positive difference.
    func maxProfit3(_ prices: [Int]) -> Int {
        var profit = 0
        
        for i in 0..<(prices.count - 1) {
            if prices[i] < prices[(i + 1)] {
                profit += prices[(i + 1)] - prices[i]
            }
        }
        
        return max(profit, 0)
    }
}
