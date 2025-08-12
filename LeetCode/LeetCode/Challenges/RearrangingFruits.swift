// Created 12/08/2025.

import Foundation

//https://leetcode.com/problems/rearranging-fruits/
struct RearrangingFruits {
    
    //Time: O(n log n) where n is the combined elements of `basekt1` and `basket2`
    //Space: O(n)
    //array
    //frequency
    //sorting
    //
    //Solution Description:
    //We first calculate which items are need to be swapped using a frequency table. Items from `basket1` are added to the
    //table and items from `basket2` are removed - any items with a value of 0 are already balanced. Next we iterate
    //through the frequency table to determine how many items need to be swapped and also if it is even possible to balance
    //the items. Next we sort the items this is to ensure that when we swap items we do so s cheaply as possible to reduce
    //the overall cost. When balancing items we take half of the difference between the baskets for a given item and move
    //those items across (virtually). We then determine the cost involved in doing so - this is trick we can choose to pay
    //the current item price or double the cheapest item price, we take whichever is cheaper. We reduce the number of
    //outstanding swaps by the items moved and repeat the process. Once all items have been moved we return `cost`.
    func minCost(_ basket1: [Int], _ basket2: [Int]) -> Int {
        var freq = [Int: Int]()
        
        for item in basket1 {
            freq[item, default: 0] += 1
        }

        for item in basket2 {
            freq[item, default: 0] -= 1
        }

        var swaps = 0
        var cost = 0
        
        //calculate how many swaps are required for balance
        for count in freq.values {
            guard count % 2 == 0 else {
                //only even differences can be shared out
                return -1
            }

            swaps += max(0, (count / 2))
        }

        let sorted = freq.sorted { $0.key < $1.key }

        for (item, count) in sorted {
            guard swaps > 0 else {
                break
            }

            let take = min(swaps, (abs(count) / 2)) //share only as much as needed
            cost += take * min(item, (sorted.first!.key * 2)) //direct or indirect swap
            swaps -= take
        }

        return cost
    }
}
