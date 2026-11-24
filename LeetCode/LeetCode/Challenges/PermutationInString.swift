// Created 05/05/2023.

import Foundation

//https://leetcode.com/problems/permutation-in-string/
struct PermutationInString {
    
    //Time: O(n + m) where n is the number of characters in `s1`
    //               where m is the number of characters in `s2`
    //Space: O(n + m)
    //string
    //sliding window
    //two pointers
    //dictionary
    //frequency
    //
    //Solution Description:
    //For `s2` to contain a permutation of `s1`, a contiguous section of `s2` must hold exactly the characters of `s1`, so
    //we use a sliding window over `s2`. First we convert `s1` into a frequency dictionary, `freq`, recording how many
    //times each character appears, and calculate `windowSize` up front (a `String`'s `count` is O(n) so we avoid calling
    //it inside the loop). We then iterate through `s2` (converted to an array to allow O(1) indexing) with `right` as the
    //leading edge of the window and `left` as the trailing edge. `seen` stores how many times each character currently
    //appears in the window. If the character at `right` isn't in `freq` then no window containing it can be a permutation,
    //so we clear `seen` and start a new window from the next index. If it is in `freq` but the window already holds as
    //many of that character as `s1` does, we have too many, so we move `left` forward, decrementing the count in `seen` of
    //each character we step over, until we reach the oldest occurrence of that character. We step over that too, but leave
    //its count alone as the character at `right` takes its place. Otherwise we increment the count of the character in
    //`seen`. As the window never holds more of a character than `s1` does, once its size is equal to `windowSize` it must
    //be a permutation of `s1` and we return true. If we reach the end of `s2` without that happening, we return false.
    //
    //N.B. Counts in `seen` that drop to zero are left in place - a zero can never equal a frequency in `freq` (which is
    //always at least 1) so it can never trigger the shrink. As `left` and `right` only ever move forward, each index
    //enters and leaves the window at most once.
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        var freq = [Character: Int]()
        for c in s1 {
            freq[c, default: 0] += 1
        }

        let windowSize = s1.count

        let s2 = Array(s2)
        var seen = [Character: Int]()

        var left = 0
        var right = 0
        while right < s2.count {
            let c = s2[right]
            guard let count = freq[c] else {
                seen.removeAll()
                right += 1
                left = right //must be reset
                continue
            }

            if seen[c, default: 0] == count {
                //no need to go to remove decrement `c` as it is about to be used for the right edge
                while s2[left] != c {
                    seen[s2[left]]! -= 1
                    left += 1
                }
                left += 1 //move beyond the old index of `c`
            } else {
                seen[c, default: 0] += 1
            }

            if ((right - left) + 1) == windowSize {
                return true
            }

            right += 1
        }

        return false
    }
    
    //Time: O(n + m) where n is the number of characters in `s1`
    //               where m is the number of characters in `s2`
    //Space: O(n + m)
    //string
    //sliding window
    //two pointers
    //dictionary
    //frequency
    //array
    //
    //Solution Description:
    //For `s2` to contain a permutation of `s1`, a contiguous section of `s2` must hold exactly the characters of `s1`, so
    //we use a sliding window over `s2`. First we convert `s1` into a frequency dictionary, `freq`, recording how many
    //times each character appears, and calculate `windowSize` up front (a `String`'s `count` is O(n) so we avoid calling
    //it inside the loop). We then iterate through `s2` (converted to an array to allow O(1) indexing) with `right` as the
    //leading edge of the window and `left` as the trailing edge. `seen` stores, for each character in the window, the
    //indexes where it appears in order. If the character at `right` isn't in `freq` then no window containing it can be a
    //permutation, so we clear `seen` and start a new window from the next index. If it is in `freq` but the window already
    //holds as many of that character as `s1` does, we have too many, so we move `left` just past the oldest occurrence of
    //that character, removing the oldest index of every character we step over. We then record `right` in `seen`. As the
    //window never holds more of a character than `s1` does, once its size is equal to `windowSize` it must be a
    //permutation of `s1` and we return true. If we reach the end of `s2` without that happening, we return false.
    func checkInclusion2(_ s1: String, _ s2: String) -> Bool {
        var freq = [Character: Int]()
        for c in s1 {
            freq[c, default: 0] += 1
        }

        let windowSize = s1.count //with a string, `count` is O(n)

        let s2 = Array(s2)
        var seen = [Character: [Int]]()

        var left = 0
        var right = 0
        while right < s2.count {
            guard let count = freq[s2[right]] else {
                seen.removeAll()
                right += 1
                left = right //must be reset
                continue
            }

            if let indexes = seen[s2[right]], indexes.count == count {
                let first = indexes[0]
                while left < (first + 1) {
                    seen[s2[left]]?.removeFirst()
                    left += 1
                }
            }
            seen[s2[right], default: [Int]()].append(right)

            if ((right - left) + 1) == windowSize {
                return true
            }

            right += 1
        }

        return false
    }
    
    //Time: O(n + m) where n is the number of characters in `s1`
    //               where m is the number of characters in `s2`
    //Space: O(1)
    //string
    //sliding window
    //two pointers
    //dictionary
    //frequency
    //
    //Solution Description:
    //For `s2` to contain a permutation of `s1` means that a contiguous subarray of `s2` must contain all the characters in `s1`. So
    //first we convert `s1` into a frequency dictionary that tracks how many times a character appears in `s1`. We can then iterate
    //through `s2` and using a sliding window compare the elements in that current window into `s2` against `s1`. We know that the
    //window required to product a permutation will be exactly the size of `s1` so until we hit that window size we only push `p2`
    //rightwards, once that window size has been reached we then need to also push `p1` rightwards. When pushing `p2` rightwards if
    //we find a match in the window, we reduce the count of that character frequency by 1 in `c1Frequency`. If that reduced frequency
    //is equal to or greater than 0 we track it as a match; if the reduced frequency is less than 0 then we too many of that
    //character in the window as even through it matches we don't count it as a match because of that. If we are also moving `p1`
    //rightwards we check if the character dropping out the window has affected the `c1Frequency`. If it has affected `c1Frequency`
    //we increase that characters count by 1 and where that count has now become greater than 0 we also reduce `matches` by 1 (this
    //check ensures that we don't under count a character just because it appear multiple times in that window). If at any point
    //`matches` is equal to `windowSize` meaning that all the characters in `s1` are present in that window we return true.
    func checkInclusion3(_ s1: String, _ s2: String) -> Bool {
        var c1Frequency = [Character: Int]()
        
        let c1 = Array(s1)
        let c2 = Array(s2)
        
        for c in c1 {
            c1Frequency[c, default: 0] += 1
        }
        
        var p1 = 0
        var p2 = 0
        
        let windowSize = c1.count
        
        var matches = 0
        
        while p2 < c2.count {
            if let count = c1Frequency[c2[p2]] {
                let newCount = count - 1
                c1Frequency[c2[p2]] = newCount
                
                //to handle the scenario where the character `c2[p2]` appears more often in the current window then it does
                //in `c1` so we only count it as a match if same character in `c1` isn't already paired up
                 if newCount >= 0 {
                    matches += 1
                }
            }
            
            guard matches != windowSize else {
                return true
            }
            
            let currentWindowSize = (p2 - p1) + 1
            if currentWindowSize == windowSize {
                
                //as we are about to move p1 we need to "re-add" c2[p1] to our frequency count if we had removed it as it will
                //no longer be part of our window
                if let count = c1Frequency[c2[p1]] {
                    let newCount = count + 1
                    c1Frequency[c2[p1]] = newCount
                    
                    //to handle the scenario where the same character appears more than once in the window, we only reduce
                    //`matches` if removing `c2[p1]` would result in the frequency increasing above zero
                    if newCount > 0 {
                        matches -= 1
                    }
                }
                
                p1 += 1
            }
            
            //always move p2 forward regardless of p1 moving as any movement in p1 would result in a correctly-sized window becoming
            //too small so by always moving p2 rightwards we ensure that once we have a correctly-sized window we always do
            p2 += 1
        }
        
        return false
    }
}
