//
//  MaximizeSum.swift
//  HackerRank
//
//  Created by William Boles on 11/07/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import Foundation

//https://www.hackerrank.com/challenges/maximize-sum
final class MaximizeSum {
    
    // MARK: Maximum
    
     static func maximizeSum(values: [Int], modulo: Int) -> Int {
        var prefix = [Int]()
        var current = 0
        for value in values {
            current = (value % modulo + current) % modulo
            prefix.append(current)
        }
        
        var ret = prefix[0]
        for i in 1..<values.count {
            for j in (0...(i-1)).reversed() {
                ret = max(ret, (prefix[i] - prefix[j] + modulo) % modulo)
            }
            ret = max(ret, prefix[i])
        }
        
        return ret
    }
}
