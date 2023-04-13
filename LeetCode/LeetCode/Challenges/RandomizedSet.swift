//
//  InsertDeleteGetRandom.swift
//  LeetCode
//
//  Created by William Boles on 28/03/2022.
//

import Foundation

//https://leetcode.com/problems/insert-delete-getrandom-o1/
//design
//array
//dictionary
//
//Time: O(n) where n is the window size
//Space: O(1)
//
//Solution Description:
//Using a dictionary and array we are able to take advantage of the O(1) access, searching and inserting of the dictionary
//while still having O(1) for retrieving a random element. We do this by inserting and removing any `val` value from both
//the dictionary and array. When removing an element from an array we must be careful not to triggger a O(n) shuffle of
//element so we first move the to-be-removed element to the end of the array (so there are no elements needed to be
//shuffled), update the map for the swapped elements new index and remove the to-be-removed element from both data
//structures
final class RandomizedSet {
    private var map = [Int: Int]()
    private var list = [Int]()
    
    init() {
        
    }
    
    func insert(_ val: Int) -> Bool {
        guard map[val] == nil else {
            return false
        }
        
        map[val] = list.count
        list.append(val)
        
        return true
    }
    
    func remove(_ val: Int) -> Bool {
        guard let index = map[val] else {
            return false
        }
        
        map[val] = nil
        
        let endIndex = (list.count - 1)
        
        if index != endIndex {
            let endElement = list[endIndex]
            map[endElement] = index
            
            list.swapAt(index, endIndex)
        }
        list.removeLast()

        return true
    }
    
    func getRandom() -> Int {
        list.randomElement()!
    }
}
