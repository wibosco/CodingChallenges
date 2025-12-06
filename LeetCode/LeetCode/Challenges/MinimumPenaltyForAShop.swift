// Created 04/11/2023.

import Foundation

//https://leetcode.com/problems/minimum-penalty-for-a-shop/
struct MinimumPenaltyForAShop {
    
    //Time: O(n) where is the number of elements in `customers`
    //Space: O(1)
    //string
    //array
    //prefix sum
    //postfix sum
    //
    //Solution Description:
    //First we iterate through all elements in customers and determine what the penalty would be if the never opened. This
    //value is a postfix sum and will allows us to avoid O(n^2) work when determining the penalty for closing at any time.
    //We then loop back through `customers` and either increment or decrement `penalityForClosing` as we close the shop
    //from that hour. We track the minimum penalty value found, alongside the index where that minimum was first found.
    //At the end of the second `customers` iteration we return the index for the minimum.
    func bestClosingTime(_ customers: String) -> Int {
        var penalityForClosing = 0
        for customer in customers {
            if customer == "Y" {
                penalityForClosing += 1
            }
        }
        
        var minPenalty = (time: 0, penalty: penalityForClosing)
        
        //move closing time forward/rightwards
        for (i, customer) in customers.enumerated() {
            if customer == "Y" {
                penalityForClosing -= 1
            } else if customer == "N" {
                penalityForClosing += 1
            }
            
            if penalityForClosing < minPenalty.penalty {
                minPenalty = ((i + 1), penalityForClosing)
            }
        }
        
        return minPenalty.time
    }
}
