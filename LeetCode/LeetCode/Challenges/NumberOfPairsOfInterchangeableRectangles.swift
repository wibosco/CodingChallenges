//
//  NumberOfPairsOfInterchangeableRectangles.swift
//  LeetCode
//
//  Created by William Boles on 10/07/2023.
//

import Foundation

//https://leetcode.com/problems/number-of-pairs-of-interchangeable-rectangles/
//array
struct NumberOfPairsOfInterchangeableRectangles {
    
    //Time: O(n) where n is the number of elements in `rectangles`
    //Space: O(n)
    //dictionary
    //combinations
    //maths
    //
    //Solution Description:
    //First we iterate through `rectangles` and calculate the ratio for each triangle which is then stored in a `frequency`
    //dictionary with the same ratio resulting in the value of the dictionary being incremented. Next we loop through
    //`ratios` and build up the `interchangeable` value by using the `(n * (n - 1)) / 2` formula of determing the number
    //of unique combinations from the possible permutations.
    static func interchangeableRectangles(_ rectangles: [[Int]]) -> Int {
        var frequency = [Double: Int]() //[ratio: count]
        
        for rectangle in rectangles {
            let width = Double(rectangle[0])
            let height = Double(rectangle[1])
            let ratio = width/height
            
            frequency[ratio, default: 0] += 1
        }
        
        var interchangeable = 0
        
        for count in frequency.values {
            interchangeable += (count * (count - 1)) / 2
        }
        
        return interchangeable
    }
    
    //Time: O(n) where n is the number of elements in `rectangles`
    //Space: O(n)
    //dictionary
    //combinations
    //
    //Solution Description:
    //First we iterate through `rectangles` and calculate the ratio for each triangle. This ratio is stored in a `frequency`
    //dictionary and a `ratio` array. The `frequency` dictionary is used to hold the count of how many rectangles share the
    //same ratio, with that ratio being the key and the `ratios` array is so that we don't have to recalculate the ratio of
    //each triangle in the next loop. Next we loop through `ratios` and build up the `interchangeable` value. To avoid
    //counting the current rectangle as a interchangeable rectangle we decrement the count before adding it to the
    //`interchangeable` value. As we are only interested in combinations of triangles we also store this decremented count
    //back into the `frequency` dictionary.
    //
    //N.B. The difference between permutations and combinations is that order matters with permutations but not with
    //combinations so:
    //
    //`ABC` and `CAB`
    //Permutations - different
    //Combination - same
    static func interchangeableRectanglesArray(_ rectangles: [[Int]]) -> Int {
        var frequency = [Double: Int]() //[ratio: count]
        var ratios = [Double]()
        
        for rectangle in rectangles {
            let width = Double(rectangle[0])
            let height = Double(rectangle[1])
            let ratio = width/height
            
            ratios.append(ratio)
            frequency[ratio, default: 0] += 1
        }
        
        var interchangeable = 0
        
        for ratio in ratios {
            guard let count = frequency[ratio], count > 1 else {
                continue
            }
            
            let newCount = count - 1
            frequency[ratio] = newCount
            
            interchangeable += newCount
        }
        
        return interchangeable
    }
}
