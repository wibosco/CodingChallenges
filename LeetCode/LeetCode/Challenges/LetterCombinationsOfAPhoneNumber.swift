// Created 08/11/2021.

import Foundation

//https://leetcode.com/problems/letter-combinations-of-a-phone-number/
struct LetterCombinationsOfAPhoneNumber {
    
    //Time: O(4^n * n) where n is the number of values in `digits` (4 is the max letters)
    //Space: O(n) where n is the number of values in `digits` (recursive stack calls)
    //string
    //dictionary
    //backtracking (DFS)
    //recursive
    //inout
    //graph theory
    //
    //Solution Description:
    //First we build a map between an individual digit and the letter that digit can represent. Then treating `digits` as
    //a graph we take take each possible letter for each digit and fully explore the graph using DFS and backtracking. So
    //for each digit each choose one letter it can map to add that letter to `combination` and move onto the next digit.
    //Once all digits can be used we add `combination` to `combinations`, we then let the recursive stack unwind one frame
    //and then choose the next character for that digit (this is the backtracking part). Once all letter for that digit
    //have been selected we unwind the the previous digit and repeat the process for it's remaining letters. We repeat
    //this process until all possible combinations for all digits have been produced - at which point we return
    //`combinations`.
    func letterCombinations(_ digits: String) -> [String] {
        guard !digits.isEmpty else {
            return [String]()
        }
        
        let map: [Character: [Character]] = ["2": ["a", "b", "c"],
                                             "3": ["d", "e", "f"],
                                             "4": ["g", "h", "i"],
                                             "5": ["j", "k", "l"],
                                             "6": ["m", "n", "o"],
                                             "7": ["p", "q", "r", "s"],
                                             "8": ["t", "u", "v"],
                                             "9": ["w", "x", "y", "z"]]
        
        var combination = [Character]()
        var combinations = [String]()

        dfs(Array(digits), 0, map, &combination, &combinations)

        return combinations
    }

    private func dfs(_ digits: [Character], _ index: Int, _ map: [Character: [Character]], _ combination: inout [Character], _ combinations: inout [String]) {
        //goal
        guard index < digits.count else {
            combinations.append(String(combination))
            return
        }

        for c in map[digits[index], default: [Character]()] {
            combination.append(c)

            dfs(digits, (index + 1), map, &combination, &combinations)

            //backtrack
            combination.removeLast()
        }
    }
    
    //Time: O(4^n * n) where n is the number of values in `digits` (4 is the max letters)
    //Space: O(n) where n is the number of values in `digits` (recursive stack calls)
    //string
    //dictionary
    //backtracking (DFS)
    //recursive
    //inout
    //graph theory
    //
    //Solution Description:
    //First we map the keypad digits to letters using a dictionary - `keypad`. Then treating this problem as multiple tree
    //problems we use backtracking to iterate through all possible combinations of letters in a recursive DFS manner gradually
    //building each possible letter combination for the given number. We know that we've reached the end of combination when
    //there are no more digits to process. Eventually the recursive backtracking call will return and we can return the
    //`combinations` array
    //
    //NB: don't the `key` in space complexity as it is constant
    func letterCombinations2(_ digits: String) -> [String] {
        guard !digits.isEmpty else {
            return [String]()
        }
        
        let keypad: [Character: String] = ["2": "abc",
                                           "3": "def",
                                           "4": "ghi",
                                           "5": "jkl",
                                           "6": "mno",
                                           "7": "pqrs",
                                           "8": "tuv",
                                           "9": "wxyz"]
                   
        var combinations = [String]()
        let digits = Array(digits)
        
        backtrack(digits, 0, keypad, "", &combinations)
        
        return combinations
    }
        
    private func backtrack(_ digits: [Character], _ index: Int, _ keypad: [Character: String], _ combination: String, _ combinations: inout [String]) {
        //Goal
        guard index < digits.count else {
            combinations.append(combination)
            return
        }
        
        let letters = keypad[digits[index]]!
        
        //Choice, this problem does not have constraints
        for letter in letters { //no need iterate through the `digits` array as we are only interested in letters
            let combination = "\(combination)\(letter)"
            backtrack(digits, (index + 1), keypad, combination, &combinations)
        }
    }
    
    //Time: O(n^3)
    //string
    func letterCombinations3(_ digits: String) -> [String] {
        guard !digits.isEmpty else {
            return []
        }
        
        let keypad: [Character: String] = ["2": "abc",
                                           "3": "def",
                                           "4": "ghi",
                                           "5": "jkl",
                                           "6": "mno",
                                           "7": "pqrs",
                                           "8": "tuv",
                                           "9": "wxyz"]
        
        var permutations = [""]//Empty string so that the array had one element
        
        for digit in digits {
            var tmp = [String]()
            let letters = keypad[digit]!
            for permutation in permutations {
                for letter in letters {
                    //Add letter.count number of new permutations to the existing premutation value
                    tmp.append("\(permutation)\(letter)")
                }
            }
            permutations = tmp //throw away out permutations as newer ones have been generated from new digit
        }
        
        return permutations
    }
}
