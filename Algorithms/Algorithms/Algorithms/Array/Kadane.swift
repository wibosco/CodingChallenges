// Created 01/09/2025.

import Foundation

struct Kadane {
    
    // MARK: - Max
    
    //Time: O(n) where n is the number of elements in `array`
    //Space: O(1)
    //array
    //counting
    //greedy
    //Kadanes algorithm
    //
    //Solution Description:
    //To calculate the maximum subarray we need to decide at each element where to include it into a rolling sum or start
    //that sum again. We do this by calculating the sum of adding the current element to the rolling sum vs the sum being
    //the current value itself - we take whichever is greater. This local decision making feels greedy but Kadanes isn't
    //strictly a greedy algorithm as it also remember the largest/max sum there has been so far. After each local
    //decision on whether to start a new sum or not we compare that current sum against the largest sum so far and update
    //it as required. Once all elements in `array` have been processed we return `maxTotal`.
    func maxSubarray(_ array: [Int]) -> Int {
        guard array.count > 0 else {
            return 0
        }
        
        var maxTotal = array[0]
        var currentTotal = array[0]
        
        for a in array[1...] {
            currentTotal = max(a, (currentTotal + a))
            maxTotal = max(maxTotal, currentTotal)
        }
        
        return maxTotal
    }
    
    // MARK: - Min
    
    //Time: O(n) where n is the number of elements in `array`
    //Space: O(1)
    //array
    //counting
    //greedy
    //Kadanes algorithm
    //
    //Solution Description:
    //To calculate the maximum subarray we need to decide at each element where to include it into a rolling sum or start
    //that sum again. We do this by calculating the sum of adding the current element to the rolling sum vs the sum being
    //the current value itself - we take whichever is greater. This local decision making feels greedy but Kadanes isn't
    //strictly a greedy algorithm as it also remember the largest/max sum there has been so far. After each local
    //decision on whether to start a new sum or not we compare that current sum against the largest sum so far and update
    //it as required. Once all elements in `array` have been processed we return `maxTotal`.
    func minSubarray(_ array: [Int]) -> Int {
        guard array.count > 0 else {
            return 0
        }
        
        var minTotal = array[0]
        var currentTotal = array[0]
        
        for a in array[1...] {
            currentTotal = min(a, (currentTotal + a))
            minTotal = min(minTotal, currentTotal)
        }
        
        return minTotal
    }
}
