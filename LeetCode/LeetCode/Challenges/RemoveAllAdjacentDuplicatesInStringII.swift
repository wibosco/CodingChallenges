// Created 06/04/2022.

import Foundation

//https://leetcode.com/problems/remove-all-adjacent-duplicates-in-string-ii/
struct RemoveAllAdjacentDuplicatesInStringII {
    
    //Time: O(n) where n is the number of characters in `s`
    //Space: O(n)
    //string
    //stack
    //counting
    //
    //Solution Description:
    //As we iterate through `s` we store the characters that we come across in `stack` alongside their duplicate count
    //value. We need to store the duplicate count value in the stack as it is possible that when we start removing/popping
    //duplicates from the stack characters that are the same but not directly beside each other in `s` will come together.
    //By storing the duplicate value in the stack we make it possible to determine if that coming-together has resulted in
    //`k` duplicates now being side-by-side without having to recount the stack for the current `s` value. Once we encounter
    //a `duplicateCount` value that matches `k` we pop those duplicates off the stack.
    func removeDuplicates(_ s: String, _ k: Int) -> String {
        var stack = [(Character, Int)]() //(character, duplicate-count)
        
        for c in s {
            let duplicateCount: Int
            if stack.last?.0 == c {
                duplicateCount = (stack.last!.1 + 1)
            } else {
                duplicateCount = 1 //new character, reset count
            }
            
            if duplicateCount == k {
                stack.removeLast((k - 1)) //final duplicate wasn't added to the stack so we need to take one away from `k`
            } else {
                //no need to remove the previous count as this would just make converting into a string harder by requiring
                //as to expand on each stack element so that it matches the number of characters matches the count
                stack.append((c, duplicateCount))
            }
        }
        
        return String(stack.map { $0.0 })
    }
    
    //Time: O(n) where n is the number of characters in `s`
    //Space: O(n)
    //string
    //stack
    //two pointers
    //
    //Solution Description:
    //As we iterate through `s` we store the characters that we come across in `stack`. If the top of the stack is the same as
    //the current value of `s` we iterate through the stack to see if there are enough duplicates to justify removing those
    //duplicates from the stack. If there are enough duplicates we remove them; if there are not enough duplicates we add the
    //current value to the stack. Once all characters have been processed we return those characters still in the stack.
    func removeDuplicates2(_ s: String, _ k: Int) -> String {
        var stack = [Character]()
        let chars = Array(s)

        for c in chars {
            if stack.last == c && stack.count >= (k - 1) {
                var remaining = k - 1
                var j = stack.count - 1
                while remaining > 0 && stack[j] == c {
                    j -= 1
                    remaining -= 1
                }

                if remaining == 0 {
                    stack.removeLast((k - 1))
                } else {
                    stack.append(c)
                }
            } else {
                stack.append(c)
            }
        }

        return String(stack)
    }
    
    //Time: O(n^2) where n is the number of characters in `s`
    //Space: O(n)
    //string
    //in-line
    //
    //Solution Description:
    //Using a `counts` array we keep track of the duplicate count for the character in `s` that is at the `counts` index.
    //When a `counts` value equals `k` we remove the duplicate characters in `s` until `k` duplicates are gone, we also
    //remove `k` elements from `counts` to keep them in sync. We repeat this process until all of `s` is processed.
    //Special must be taken to reset `i` back to a value before `k` elements where removed.
    func removeDuplicates3(_ s: String, _ k: Int) -> String {
        var characters = Array(s)
        var counts = [Int]()
        counts.append(1)
        
        var i = 1
        
        while i < characters.count {
            if characters[i] == characters[(i - 1)] {
                let count = counts.last ?? 1
                counts.append((count + 1))
            } else {
                counts.append(1)
            }
            
            if counts.last == k {
                let indexToRemove = i - (k - 1)
                for _ in 0..<k {
                    characters.remove(at: indexToRemove) //O(n)
                    counts.removeLast()
                }
                
                if counts.isEmpty {
                    i = 1
                    counts.append(1)
                } else {
                    i -= (k - 1)
                }
            } else {
                i += 1
            }
        }
        
        return String(characters)
    }
}
