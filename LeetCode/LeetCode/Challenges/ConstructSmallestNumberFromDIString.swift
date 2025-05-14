// Created 13/05/2025.

import Foundation

//https://leetcode.com/problems/construct-smallest-number-from-di-string/
struct ConstructSmallestNumberFromDIString {
    
    //Time: O(n ^ m) where n is the number of digits for that pattern
    //               where m is the number of elements in `pattern`
    //Space: O(n)
    //string
    //array
    //graph theory
    //DFS
    //recursive
    //visited
    //inout
    //backtracking
    //
    //Solution Description:
    //Traating the digits that will represent the `pattern` as a graph, using DFS we explore each possible path of different
    //digits that satisfy the current element of `pattern`. If a path is shown to be invalid we backtrack out the last digit
    //choosen and attempt to choose a different one. To ensure that we don't go down the same path we use a `visited` set to
    //hold the values of the path taken so far. The first path found that satisfies `pattern` is the smallest and ca be
    //returned.
    func smallestNumber(_ pattern: String) -> String {
        var result = [Int]()
        
        for i in 1...(pattern.count + 1) {
            var visited = Set<Int>()
            visited.insert(i)
            
            var value = [Int]()
            value.append(i)
            
            dfs(Array(pattern), &visited, &value, &result)
            
            if !result.isEmpty {
                break
            }
        }
        
        return result.map { String($0) }.joined()
    }
    
    private func dfs(_ pattern: [Character], _ visited: inout Set<Int>, _ current: inout [Int], _ result: inout [Int]) {
        guard result.isEmpty else {
            return
        }
        
        guard current.count < (pattern.count + 1) else {
            result = current
            return
        }
        
        let p = pattern[(current.count - 1)]
        let lower = p == "D" ? 1 : (current.last! + 1)
        let upper = p == "D" ? current.last! : (pattern.count + 2)
        
        for val in lower..<upper {
            guard !visited.contains(val) else {
                continue
            }
            visited.insert(val)
            current.append(val)
            
            dfs(pattern, &visited, &current, &result)
                
            visited.remove(val)
            current.removeLast()
        }
    }
}
