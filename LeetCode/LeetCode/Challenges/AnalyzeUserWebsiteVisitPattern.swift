// Created 04/05/2025.

import Foundation

//https://leetcode.com/problems/analyze-user-website-visit-pattern/
struct AnalyzeUserWebsiteVisitPattern {
    
    //Time: O(n^3) where n is the number of elements in `username`/`timestamp`/`website`
    //Space: O(n) where n is the number of elements in `username`/`timestamp`/`website`
    //array
    //set
    //dictionary
    //sorting
    //permutations
    //inout
    //recursive
    //backtracking
    //
    //Solution Description:
    //Visits are not ordered by date so first we group visits by user so that we can break the index linking between three arrays,
    //then sort each group by timestamp. Then we generate all possible permutations for each user. A permutation is only counted
    //once for each user once so if we generate the same permutation it is skipped. We then check if another user has generated
    //and if so we increment that count else we set it to 1. We then compare that permutation against the current msot common
    //permutation and if it is more common we update `mostCommonPermutation`, if they are at the same count we take the
    //lexicographically smaller of the two as `mostCommonPermutation`. Once all permutations have been generated for each user
    //we return the current value of `mostCommonPermutation`.
    func mostVisitedPattern(_ username: [String], _ timestamp: [Int], _ website: [String]) -> [String] {
        var visits = [String: [(Int, String)]]()
        
        //group by user
        for x in 0..<username.count {
            visits[username[x], default: [(Int, String)]()].append((timestamp[x], website[x]))
        }
        
        //sort by timestamps
        for (username, _) in visits {
            visits[username]?.sort { $0.0 < $1.0 }
        }
        
        var combinedPermutations = [[String]: Int]()
        var mostCommonPermutation = ([String](), 0)
        
        //generate all permutations of a users visits
        for (_, visit) in visits {
            var currentPermutations = Set<[String]>()
            for x in 0..<visit.count {
                var currentPermutation = [String]()
                permutations(visit, x, &currentPermutation, &currentPermutations, &combinedPermutations, &mostCommonPermutation)
            }
        }
        
        return mostCommonPermutation.0
    }
    
    private func permutations(_ websites: [(Int, String)], _ index: Int, _ currentPermutation: inout [String], _ currentPermutations: inout Set<[String]>, _ combinedPermutations: inout [[String]: Int], _ mostCommonPermutation: inout ([String], Int)) {
        currentPermutation.append(websites[index].1)
        
        defer {
            currentPermutation.removeLast()
        }
        
        guard currentPermutation.count < 3 else {
            //only store unique permutations for each user
            guard !currentPermutations.contains(currentPermutation) else {
                return
            }
            currentPermutations.insert(currentPermutation)
            
            //check if another user has produced the same permutation
            let count = (combinedPermutations[currentPermutation] ?? 0) + 1
            combinedPermutations[currentPermutation] = count
            
            if count > mostCommonPermutation.1 {
                mostCommonPermutation = (currentPermutation, count)
            } else if count == mostCommonPermutation.1 {
                if currentPermutation.lexicographicallyPrecedes(mostCommonPermutation.0) {
                    mostCommonPermutation = (currentPermutation, count)
                }
            }
            
            return
        }
        
        // + 1 so we don't reuse the current index
        for x in (index + 1)..<websites.count {
            permutations(websites, x, &currentPermutation, &currentPermutations, &combinedPermutations, &mostCommonPermutation)
        }
    }
}
