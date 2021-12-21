//
//  FibonacciNumber.swift
//  CodingChallenges
//
//  Created by William Boles on 21/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/fibonacci-number/
//graph theory
struct FibonacciNumber {
    
    //Time: O(n) where `n` is each number in the squence n - 0
    //Space: O(1)
    //bottom up
    //iterative
    //
    //Solution Description:
    //Using a bottom-up approach we only need to hold onto the previous steps value to enable us to calculate the next steps value - this enables to use space when working out
    //fib(n)
    static func fib(_ n: Int) -> Int {
        guard n > 0 else {
            return 0
        }
        
        guard n > 2 else {
            return 1
        }
        
        var val = 1
        var prev = 1
        var curr = 1
        
        for _ in 0..<(n - 2) {
            val = (prev + curr)
            
            prev = curr
            curr = val
        }
            
        return val
    }
    
    //Time: O(n) where `n` is each number in the squence n - 0
    //Space: O(n) for both the stack and `memo` size
    //top down
    //memoization
    //recursive
    //
    //Solution Description:
    //Using a top-down approach calculate the value for each `n` and them add together. This value is then stored so that there is no need to re-calculate (and so prevent the same
    //recursive stack being built multiple times e.g. notice how `8, 5, 3, 2, 1, 1, 0` is contains `5, 3, 2, 1, ,1, 0`, these two squences could be `n - 1`
    //and `n - 2`)
    static func fibTopDown(_ n: Int) -> Int {
        guard n > 0 else {
            return 0
        }
        
        var memo = [Int: Int]()
        return fib(n, &memo)
    }
    
    private static func fib(_ n: Int, _ memo: inout [Int: Int]) -> Int {
        if let val = memo[n] {
            return val
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
