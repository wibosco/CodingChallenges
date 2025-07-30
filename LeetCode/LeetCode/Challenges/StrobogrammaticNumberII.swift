// Created 30/07/2025.

import Foundation

//https://leetcode.com/problems/strobogrammatic-number-ii/
struct StrobogrammaticNumberII {
    private let pairs: [(Character, Character)] = [("0", "0"),
                                                   ("1", "1"),
                                                   ("6", "9"),
                                                   ("8", "8"),
                                                   ("9", "6")]
    
    private let singles: [Character] = ["0", "1", "8"]
    
    //Time: O(n^5) where n is `n`
    //             where 5 is the count of `pairs`
    //Space: O(n^5)
    //array
    //graph thoery
    //permutations
    //DFS
    //recursive
    //backtracking
    //inout
    //set
    //two pointers
    //
    //Solution Description:
    //Treating this as a graph, we use DFS to produce each possible iteration of Strobogrammatic number within `n` characters. At
    //each recursion we insert either two values or one value depending on how many unfilled indexes are left for that iteration
    //of the number. If there are two or more unfilled indexes, we select a pair of values and insert at opposite ends of the
    //number. If there is only one unfilled index, we select a single value and insert it at that space. Regardless of which path
    //is taken we go deeper into the recursion. Once all indexes have been filled we add `number` to `numbers` (which is a set to
    //avoid duplicates). As the recursion calls unwind we select different values and override the previously set indexes. We
    //repeat this process until all possible permutations has been created. `numbers` is then converted into an array and
    //returned.
    func findStrobogrammatic(_ n: Int) -> [String] {
        var numbers = Set<String>()
        var number = Array(repeating: Character("A"), count: n)
        
        permutations(&number, 0, (n - 1), &numbers)
        
        return Array(numbers)
    }
    
    private func permutations(_ number: inout [Character], _ left: Int, _ right: Int, _ numbers: inout Set<String>) {
        guard left <= right else {
            numbers.insert(String(number))
            return
        }
        
        if left == right {
            for value in singles {
                number[left] = value
                
                permutations(&number, (left + 1), (right - 1), &numbers)
            }
        } else {
            for pair in pairs {
                guard !(left == 0 && pair.0 == "0") else {
                    continue
                }
                
                number[left] = pair.0
                number[right] = pair.1
                
                permutations(&number, (left + 1), (right - 1), &numbers)
            }
        }
    }
}
