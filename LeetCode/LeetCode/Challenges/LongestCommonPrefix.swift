//
//  LongestCommonPrefix.swift
//  LeetCode
//
//  Created by William Boles on 08/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/longest-common-prefix/
struct LongestCommonPrefix {
    
    //Time: O(n * m) where n is the number of elements in `strs`
    //               where m is the number of characters in the smallest element in `strs`
    //Space: O(m)
    //string
    //array
    //vertical scanning
    //
    //Solution Description:
    //First we convert our strings to character arrays to allow for easier index accessing. Next we take the first element
    //and iterate through its characters. At each iteration we compare the `c` against the character at the same index in
    //each of the other `chrs`. If that index doesn't exist or the character doesn't match `c` we return the prefix that we
    //have built up so far. If we iterate through all characters in `chrs[0]` and only find matches then we can return `prefix`
    //
    //NB: if we get to the final return it means not only that the whole of `chrs[0]` is the prefix but also that `chrs[0]`
    //must the smallest (or joint smallest) element in `strs`
    func longestCommonPrefix(_ strs: [String]) -> String {
        let chrs = strs.map { Array($0) } //to optimise access
        
        var prefix = [Character]()
        for (i, c) in chrs[0].enumerated() {
            for chr in chrs[1...] {
                if i >= chr.count {
                    return String(prefix)
                }
                
                if chr[i] != c {
                    return String(prefix)
                }
            }
            
            prefix.append(c) //`c` is found in all `chrs` elements
        }
        
        return String(prefix)
    }
    
    //Time: O(n * m) where n is the number of elements in `strs`
    //               where m is the number of characters in the smallest element in `strs`
    //Space: O(m)
    //string
    //array
    //
    //Solution Description:
    //First we convert each `strs` element into a character array to allow for easier index accessing. As we are coverting to
    //character arrays we also find which `strs` element is the shortest as that will be the upper bounds for the prefix. Using
    //that upper bounds we iterate through the elements in `chars` and compare each character at a given index. If any character
    //is different from the rest we abort. If all characters at that index are the same we add that character to `prefix` and
    //repeat the process. If we iterate through all indexes up to the upper bounds and only find matches then we can return
    //`prefix`.
    func longestCommonPrefix2(_ strs: [String]) -> String {
        var list = [[Character]]()
        var maxPrefix = Int.max

        for str in strs {
            list.append(Array(str))

            maxPrefix = min(maxPrefix, str.count)
        }

        var p1 = 0
        var prefix = [Character]()

        while p1 < maxPrefix {
            let c = list[0][p1]
            for chars in list[1...] {
                guard c == chars[p1] else {
                    return String(prefix)
                }
            }

            prefix.append(c)
            p1 += 1
        }

        return String(prefix)
    }
    
    //Time: O(n * m) where n is the number of elements in `strs`
    //               where m is the number of characters in the smallest element in `strs`
    //Space: O(1)
    //string
    //array
    //
    //Solution Description:
    //First we convert each `strs` element into a character array to allow for easier index accessing. As we are coverting to
    //character arrays we also find which `strs` element is the shortest as that will be the upper bounds for the prefix. Using
    //that upper bounds we iterate through the elements in `chars` and compare each character at a given index. If any character
    //is different from the rest we abort and return the prefix we have found so far. If all characters at that index are the
    //same increment `p1` and repeat the process. If we iterate through all indexes up to the upper bounds and only find matches
    //then we can return the prefix.
    func longestCommonPrefix3(_ strs: [String]) -> String {
        var list = [[Character]]()
        var maxPrefix = Int.max

        for str in strs {
            list.append(Array(str))

            maxPrefix = min(maxPrefix, str.count)
        }

        var p1 = 0

        while p1 < maxPrefix {
            let c = list[0][p1]
            for chars in list[1...] {
                guard c == chars[p1] else {
                    return p1 == 0 ? "" : String(list[0][0..<p1])
                }
            }

            p1 += 1
        }

        return String(list[0][0..<p1])
    }
}
