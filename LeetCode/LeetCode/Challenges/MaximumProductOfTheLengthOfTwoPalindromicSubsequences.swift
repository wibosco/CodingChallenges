//
//  MaximumProductOfTheLengthOfTwoPalindromicSubsequences.swift
//  LeetCode
//
//  Created by William Boles on 10/07/2023.
//

import Foundation

//https://leetcode.com/problems/maximum-product-of-the-length-of-two-palindromic-subsequences/
struct MaximumProductOfTheLengthOfTwoPalindromicSubsequences {
    
    //Time: O(
    //Space: O(
    //array
    //DFS
    //recursive
    //backtracking
    //n-arry tree
    //set
    //two pointers
    //inout
    //
    //Solution Description:
    //To find the max product we need to first generate all possible subsequences of `s` using DFS and backtrackingg. Each
    //subsequence is then checked to determine if it a palindrome or not using two pointers. If that subsequence is a
    //palindrome then we check if it overlaps with any other palindrome subsequences using a set to ensure O(1) retrieval.
    //If two subsequences don't overlap we calculate the product and compare it against our the max product, replacing if
    //needed. Once all palindrome subsequences have been checked we return that max product.
    static func maxProduct(_ s: String) -> Int {
        let characters = Array(s)
        var subsequences = Set<[Int]>()
        var subsequence = [Int]()
        
        for i in 0..<characters.count {
            generateAllSubsequences(characters.count, i, &subsequence, &subsequences)
        }
        
        var palindromes = Set<Set<Int>>()
        
        for subsequence in subsequences {
            guard isPalindrome(characters, subsequence) else {
                continue
            }
            
            palindromes.insert(Set(subsequence))
        }
        
        var maxProduct = 0
        
        for palindrome in palindromes {
            calculateMaxProduct(palindromes, palindrome, &maxProduct)
        }
        
        return maxProduct
    }
    
    private static func generateAllSubsequences(_ count: Int, _ index: Int, _ subsequence: inout [Int], _ subsequences: inout Set<[Int]>) {
        guard index < count else {
            return
        }
        
        for i in index..<count { //with a subsequence we can skip over elements but not go backwards
            subsequence.append(i)
            subsequences.insert(subsequence)
            generateAllSubsequences(count, (i + 1), &subsequence, &subsequences)
            subsequence.removeLast() //backtrack
        }
    }
    
    private static func isPalindrome(_ characters: [Character], _ possible: [Int]) -> Bool {
        var left = 0
        var right = possible.count - 1
        
        while left < right {
            let leftIndex = possible[left]
            let rightIndex = possible[right]
            
            guard characters[leftIndex] == characters[rightIndex] else {
                return false
            }
            
            left += 1
            right -= 1
        }
        
        return true
    }
    
    private static func calculateMaxProduct(_ palindromes: Set<Set<Int>>, _ palindrome: Set<Int>, _ maxProduct: inout Int) {
        for otherPalindrome in palindromes {
            var collision = false
            
            for element in otherPalindrome {
                if palindrome.contains(element) {
                    collision = true
                    break
                }
            }

            if !collision {
                let product = palindrome.count * otherPalindrome.count
                maxProduct = max(maxProduct, product)
            }
        }
    }
}
