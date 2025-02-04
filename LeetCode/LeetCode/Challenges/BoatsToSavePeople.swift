//
//  BoatsToSavePeople.swift
//  LeetCode
//
//  Created by William Boles on 18/07/2023.
//

import Foundation

//https://leetcode.com/problems/boats-to-save-people/
struct BoatsToSavePeople {
    
    //Time: O(n log n) where n is the number of elements in `people`
    //Space: O(n)
    //array
    //sorting
    //greedy
    //two pointers
    //
    //Solution Description:
    //Sorting `people` in ascending order we can take a greedy two pointer approach to filling the boats. As we fill
    //the boats we prioritise the larger of the elements in `people` and attempt to add a smaller element in as well.
    //As each element is added we adjust the pointers inwards.
    func numRescueBoats(_ people: [Int], _ limit: Int) -> Int {
        let sorted = people.sorted()
        
        var boats = 0
        
        var left = 0
        var right = sorted.count - 1
        
        while left <= right { //needs to be less than or equal otherwise we would skip one element
            if (sorted[left] + sorted[right]) <= limit { //can two people get on the boat?
                left += 1
            }
            
            right -= 1 //heavier person always makes the boat
            boats += 1
        }
        
        return boats
    }
}
