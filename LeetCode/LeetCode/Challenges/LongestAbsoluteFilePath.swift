// Created 13/05/2025.

import Foundation

//https://leetcode.com/problems/longest-absolute-file-path/
struct LongestAbsoluteFilePath {
    
    //Time: O(n) where n is the number components in `input`
    //Space: O(n)
    //stack
    //string
    //array
    //
    //Solution Description:
    //First we split `input` by `\n`, this allows us to get all the distint directory or file segments as seperate substrings.
    //Next we take this seperate substrings and using a stack determine which substrings combine to form a path. As there is
    //not a "back" substring we use the number of `\t` strings know whether this substring is going deeper or coming back. If
    //the number of `\t` substrings is less than the number of items in the stack then we know we need to back out of this
    //path which we do by popping elements from the stack until the count of `\t` substrings and the stack match. We then
    //determine if the current substring is a directory or file which we do by searching for the `.` character. If the current
    //substring is a directory we add it to the stack; if the current substring is a file we determine the character count of
    //the path and if larger than `longestPath` we replace `longestPath`. We repeat this process for all substrings of `input`
    //have been found and can return `longestPath`.
    func lengthLongestPath(_ input: String) -> Int {
        var longestPath = 0
        let newlines = input.components(separatedBy: "\n")
        var stack = [String]()
        
        var pathLength = 0
        
        for newline in newlines {
            let tabs = newline.components(separatedBy: "\t")
            while (tabs.count - 1) < stack.count {
                let dir = stack.removeLast()
                pathLength -= (dir.count + 1) //+1 for adding the "/" in
            }
            
            if tabs.last!.contains(".") {
                let filepathLength = pathLength + 1 + tabs.last!.count
                longestPath = max(longestPath, filepathLength)
            } else {
                stack.append(tabs.last!)
                pathLength += (tabs.last!.count + 1)
            }
        }
        
        return max(0, (longestPath - 1)) //-1 as an extra `/` will have been counted
    }
}
