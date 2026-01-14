// Created 14/01/2026.

import Foundation

//https://leetcode.com/problems/number-of-smooth-descent-periods-of-a-stock/
struct NumberOfSmoothDescentPeriodsOfAStock {
    
    //Time: O(n) where n is the number of elements in `prices`
    //Space: O(1)
    //array
    //two pointers
    //fast forward
    //nested loops
    //subarrays
    //
    //Solution Description:
    //Using two pointer we iterate through `prices` and find each descent subarray. We then use the formula:
    //`count * (count + 1) / 2` to calculate the total number of possible subarrays that exist for the descent subarray. This
    //total is then added to `count`. At the end of each descent subarray iteration we set `p1` to `p2` so as to not check
    //indexes that have already be counted. Once all indexes have been counted, we return `count`.
    func getDescentPeriods(_ prices: [Int]) -> Int {
        var count = 0

        var p1 = 0

        while p1 < prices.count {
            var p2 = p1 + 1
            
            //fast forward to end of descent subarray
            while p2 < prices.count && ((prices[(p2 - 1)] - prices[p2]) == 1) {
                p2 += 1
            }

            //formula for calculating how many possible subarrays from this length
            let length = (p2 - p1) //note the lack of -1 here as a single element is a valid descent array
            count += length * (length + 1) / 2

            p1 = p2
        }

        return count
    }
    
    //Time: O(n) where n is the number of elements in `prices`
    //Space: O(1)
    //array
    //two pointers
    //fast forward
    //nested loops
    //subarrays
    //
    //Solution Description:
    //Using two pointer we iterate through `prices` and find each descent subarray. With each valid element we add to an
    //existing descent subarray we can update `count` by the subarrays new length i.e. each the new element can be paired with
    //all existing subarrays so it addes the length new possible subarrays. At the end of each descent subarray iteration we
    //set `p1` to `p2` so as to not check indexes that have already be counted. Once all indexes have been counted, we return
    //`count`.
    func getDescentPeriods2(_ prices: [Int]) -> Int {
        var count = prices.count //note how we count the single element descent subarray seperate from the multi ones.

        var p1 = 0

        while p1 < prices.count {
            var p2 = p1 + 1
            
            //fast forward to end of descent subarray
            while p2 < prices.count && ((prices[(p2 - 1)] - prices[p2]) == 1) {
                count += (p2 - p1)
                p2 += 1
            }

            p1 = p2
        }

        return count
    }
}
