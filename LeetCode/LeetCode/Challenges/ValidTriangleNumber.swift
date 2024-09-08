//
//  ValidTriangleNumber.swift
//  LeetCode
//
//  Created by William Boles on 08/09/2024.
//

import Foundation

//https://leetcode.com/problems/valid-triangle-number/
struct ValidTriangleNumber {
    
    //Time: O(n log n + n ^ 2) where n is the number of elements in `nums`
    //Space: O(n)
    //array
    //three pointers
    //two pointers
    //sorting
    //nested loops
    //linear scan
    //
    //Solution Description:
    //In order for 3 lengths to make a valid triangle the different permutation of those 3 lengths must result in:
    //
    //1. `a + b > c`
    //2. `a + c > b`
    //3. `b + c > a`
    //
    //Where `a`, `b` and `c` are one of the lengths each.
    //
    //If we first sort `nums` into non-descending order we can then use 3 pointers to extract our `a`, `b` and `c` values. In
    //each iteration `a` will be the smallest (or at least equal smallest), `b` second largest and `c` largest in value. There
    //are two things to note here:
    //
    //Firstly, the non-descending order of `a`, `b` and `c` will allow us to only be concerned with solving `a + b > c` as with
    //`a` and `b` being smaller then `c` indiviually but when summed larger thah `c` means that any equation with `c` on the
    //left-hard side is going to be valid as well e.g.
    //
    //a = 4, b = 6, c = 7
    //
    //`a + b > c` = 4 + 5 > 7
    //`a + c > b` = 4 + 7 > 5
    //`c + b > a` = 7 + 6 > 4
    //
    //And secondly, once we find a value for `a` that results in `a + b > c` then we know that all larger values of `a` will
    //only result in that equation being "more true" so we don't need to check those values `a`.
    //
    //With those two points in mind, we can nest 2 loops inside each other:
    //
    //The outer loop iterates through `nums` in reverse and sets the `c` value which will be largest possible value each iteration
    //The inner loop iterates through either `a` or `b` depending on the outcome of `a + b > c` - if the outcome if true we
    //increase `count` by adding the difference of `b` and `a` to it or we look for where to adjust `a` and `b` if the lefthand side
    //is too small we increase the value of `a` by moving it rightwards else decrease the value of `b` by moving it leftwards.
    //
    //We repeat this process for all possible values of `c` and when exhausted we return `count`.
    func triangleNumber(_ nums: [Int]) -> Int {
        //valid triangle is: `a + b > c`, `a + c > b` and `b + c > a`
        guard nums.count > 2 else {
            return 0
        }
    
        let nums = nums.sorted()
        var count = 0
        var c = nums.count - 1

        while c > 1 { //need at least two other values for `a` and `b`
            var b = c - 1
            var a = 0
            
            while b > a { //even though we have two pointers here the max iterations is `n - 1`
                if  (nums[a] + nums[b]) > nums[c] {
                    count += b - a //we know as `a` passes, anything larger will pass so just get their count
                    b -= 1 //move onto a smaller b value
                } else {
                    a += 1 //left side of equation is too small need to increase it by increasing `a`
                }
            }

            c -= 1
        }
        
        return count
    }
    
    //Time: O(n ^ 3) where n is the number of elements in `nums`
    //Space: O(1)
    //array
    //nested loops
    //
    //Solution Description:
    //In order for 3 lengths to make a valid triangle the different permutation of those 3 lengths must result in:
    //
    //1. `a + b > c`
    //2. `a + c > b`
    //3. `b + c > a`
    //
    //Where `a`, `b` and `c` are one of the lengths each.
    //
    //We iterate through all possible permutations of `a`, `b` and `c` and check if those equations hold true. If they do we
    //increment `count`, if they don't we move on the next iteration.
    func triangleNumber3Loops(_ nums: [Int]) -> Int {
        //valid triangle is: `a + b > c`, `a + c > b` and `b + c > a`
        guard nums.count > 2 else {
            return 0
        }
    
        var count = 0
        var a = 0

        while a < nums.count - 2 {
            var b = a + 1
            while b < nums.count - 1 {
                var c = nums.count - 1
                while c > b {
                    if (nums[a] + nums[b]) > nums[c],
                          (nums[a] + nums[c]) > nums[b],
                          (nums[b] + nums[c]) > nums[a] {
                        count += 1
                    }
                    
                    c -= 1
                }
                
                b += 1
            }
            
            a += 1
        }
        
        return count
    }
}
