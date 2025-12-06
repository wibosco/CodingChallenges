// Created 19/11/2021.

import Foundation

//https://leetcode.com/problems/search-in-a-sorted-array-of-unknown-size/
//binary search
struct SearchSortedArrayOfUnknownSize {
    
    // MARK: - Search
    
    func search(_ reader: ArrayReader, _ target: Int) -> Int {
        var left = 0
        var right = 10_000
        
        while left <= right {
            let mid = left + (right - left) / 2
            
            let val = reader.get(mid)
            if val == target {
                return mid
            } else if val > target {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        
        return -1
    }
}

final class ArrayReader {
    let secret: [Int]
    
    // MARK: - Init
    
    init(secret: [Int]) {
        self.secret = secret
    }
    
    // MARK: - Access
    
    func get(_ index: Int) -> Int {
        if index > 0 && index < secret.count {
            return secret[index]
        }
        
        return Int((Int32.max - 1))
    }
}
