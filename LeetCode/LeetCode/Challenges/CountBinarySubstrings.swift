// Created 11/06/2024.

import Foundation

//https://leetcode.com/problems/count-binary-substrings/
struct CountBinarySubstrings {
    
    //Time: O(n) where n is the number of characters in `s`
    //Space: O(n)
    //string
    //array
    //two pointer
    //
    //Solution Description:
    //As we are only interested in two adjacent blocks of the same characters e.g. `0011`, rather than searching from each index 
    //to find if it is part of a block we can instead count the blocks of same characters and then compare that block size
    //against it's neighbour so `[0,0,1,1,1]` becomes `[2,3]` while not a perfect match we do that these neighbour blocks could
    //be split into `0011` or `01` so we can update `result` with the value of 2. In fact with any two neighbours we can take the
    //smaller value as the number of possible substrings. So we first group `s` into a pattern array where each value is the
    //number of same characters in that block, we then take these groups and compare them against their direct neighbours, taking
    //smaller value as the number of possible substrings.
    func countBinarySubstrings(_ s: String) -> Int {
        let chars = Array(s)
        
        var result = 0
        var patternGroups = [Int]()
        
        var p1 = 0
        var p2 = 1
        
        var count = 1
        
        while p2 < chars.count {
            if chars[p1] == chars[p2] {
                count += 1
            } else {
                patternGroups.append(count)
                count = 1
            }
            
            p1 += 1
            p2 += 1
        }
        
        patternGroups.append(count)
        
        p1 = 0
        p2 = 1
        
        while p2 < patternGroups.count {
            result += min(patternGroups[p1], patternGroups[p2])
            
            p1 += 1
            p2 += 1
        }
        
        return result
        
//        var substringCount = 0
//        
//        for i in 0..<chars.count {
//            var zeroCount = 0
//            var oneCount = 0
//            
//            var stoppedZeroCount = false
//            var stoppedOneCount = false
//            
//            for c in chars[i...] {
//                if c == "0" {
//                    if stoppedZeroCount {
//                        break
//                    }
//                    
//                    stoppedOneCount = oneCount > 0
//                    
//                    zeroCount += 1
//                } else {
//                    if stoppedOneCount {
//                        break
//                    }
//                    
//                    stoppedZeroCount = zeroCount > 0
//                    
//                    oneCount += 1
//                }
//                
//                if zeroCount == oneCount {
//                    substringCount += 1
//                    break
//                }
//            }
//        }
//        
//        return substringCount
    }
}
