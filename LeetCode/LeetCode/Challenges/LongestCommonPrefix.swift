// Created 08/11/2021.

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
    //First we convert our strings to character arrays to allow for easier index accessing. Next we take the first element and
    //iterate through its characters. At each iteration we compare `c` against the character at the same index in each of the other
    //`chrs` elements. If `c` is present in all other `chrs` element at the same index then we know that `c` is part of a common and
    //we can add it to `prefix`. If `c` doesn't exist in every other element of `chrs` or an element of `chrs` doesn't have the index
    //that `c` would appear in, then we know `c` isn't part of a common prefix and can return the common prefix we have identified so
    //far. If we iterate through all characters in `chrs[0]` and only find matches then we can return `prefix` as `chrs[0]` as a
    //whole is the prefix.
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
            
            prefix.append(c) //only add `c` to `prefix` after checking it is in fact common
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
    //character arrays we also find which `strs` element that is the shortest as that will be the upper bounds for the prefix. Using
    //that upper bounds we iterate through the elements in `list` and compare each character at a given index. If any character is
    //different from the rest we abort. If all characters at that index are the same we add that character to `prefix` and repeat
    //the process. If we iterate through all indexes up to the upper bounds and only find matches then we can return `prefix`.
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

            prefix.append(c) //only add `c` to `prefix` after checking it is in fact common
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
    //character arrays we also find which `strs` element is the shortest as that will be the upper bounds for the prefix. Using that
    //upper bounds we iterate through the elements in `chars` and compare each character at a given index. If any character is
    //different from the rest we abort and return the prefix we have found so far. If all characters at that index are the same
    //increment `p1` and repeat the process. If we iterate through all indexes up to the upper bounds and only find matches then we
    //can return the prefix.
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
