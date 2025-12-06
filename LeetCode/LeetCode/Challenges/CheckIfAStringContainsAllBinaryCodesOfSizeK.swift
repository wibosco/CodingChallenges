// Created 14/07/2023.

import Foundation

//https://leetcode.com/problems/check-if-a-string-contains-all-binary-codes-of-size-k/
struct CheckIfAStringContainsAllBinaryCodesOfSizeK {
    
    //Time: O(n * k) where n is the number of characters in `s`
    //               where k is the size of the substring
    //Space: O(n)
    //array
    //two pointers
    //sliding window
    //set
    //string
    //substrings
    //
    //Solution Description:
    //As we want to see if `s` can produce all binary codes of length `k` then we know that we need to produce 2^k codes.
    //We can do this by creating a window into `s` of size `k`, we then take the substring that this window produces and
    //add that substring to our `substrings` set. As `substrings` is a set any duplicate substring that is produced will
    //be discarded. We then increment our window to the left by one element and repeat the process. Once all possible
    //substrings have been produced and added to `substrings` we take the count of that set and check it is equal to 2^k.
    func hasAllCodes(_ s: String, _ k: Int) -> Bool {
        let characters = Array(s)
        guard characters.count >= k else {
            return false
        }
    
        var substrings = Set<[Character]>()
        
        var left = 0
        var right = k - 1
        
        while right < characters.count {
            let code = Array(characters[left...right])
            substrings.insert(code)
            
            left += 1
            right += 1
        }
        
        return substrings.count == Int(pow(Double(2), Double(k)))
    }
}
