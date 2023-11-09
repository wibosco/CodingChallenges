//
//  FibonacciNumber.swift
//  LeetCode
//
//  Created by William Boles on 21/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/fibonacci-number/
//binary tree
struct FibonacciNumber {
    
    //Time: O(n) where n is each number in the sequence n - 0
    //Space: O(1)
    //bottom up
    //iterative
    //
    //Solution Description:
    //Using a bottom-up approach we only need to hold onto the previous steps value to enable us to calculate the next steps value
    //- this enables to use space when working out fib(n).
    static func fib(_ n: Int) -> Int {
        guard n > 0 else {
            return 0
        }
        
        guard n > 2 else {
            return 1
        }
        
        var prev = 1
        var curr = 1
        
        for _ in 0..<(n - 2) {
            let val = (prev + curr)
            
            prev = curr
            curr = val
        }
            
        return curr
    }
    
    //Time: O(n) where n is each number in the sequence n - 0
    //Space: O(n) for both the stack and `memo` size
    //top down
    //memoization
    //dynamic programming
    //recursive
    //DFS
    //
    //Solution Description:
    //Using a top-down approach calculate the value for each `n` and add them together. This value is then stored so that there
    //is no need to re-calculate (and so prevent the same recursive stack being built multiple times e.g. notice how
    //`8, 5, 3, 2, 1, 1, 0` contains `5, 3, 2, 1, 1, 0` so there than recalculating `5, 3, 2, 1, 1, 0` we just store it away
    //as the value we get for a fib sequence of `5` and if we need get the fib sequence of `5` we returned it directly from
    //that store.
    //
    //N.B. Memoization is a term describing an optimization technique where you cache previously computed results, and return
    //the cached result when the same computation is needed again.
    //
    //N.B. Dynamic programming can be thought of as local brute force.
    static func fibTopDown(_ n: Int) -> Int {
        guard n > 0 else {
            return 0
        }
        
        var memo = [Int: Int]()
        return fib(n, &memo)
    }
    
    private static func fib(_ n: Int, _ memo: inout [Int: Int]) -> Int {
        //check if we have already went down the `n` branch and can just return the result of the previous effort
        guard memo[n] == nil else {
            return memo[n]!
        }
        
        var val = 0
        if n > 2 {
            val = fib((n - 1), &memo) + fib((n - 2), &memo)
        } else {
            val = 1
        }
        
        memo[n] = val
        
        return val
    }
    
    //Time: O(2^n)
    //Space: O(n)
    //
    //Solution Description:
    //Work out the sequence of values for each value of `n` and add them together.
    static func fibExpensive(_ n: Int) -> Int {
        guard n != 0 else {
            return 0
        }
        
        guard n > 2 else {
            return 1
        }
        
        return fib(n - 1) + fib(n - 2)
    }
}
