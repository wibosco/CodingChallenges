//
//  DestroyingAsteroids.swift
//  LeetCode
//
//  Created by William Boles on 19/01/2022.
//  Copyright © 2022 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/destroying-asteroids/
//array
struct DestroyingAsteroids {
    
    //Time: O(n log n) where n is the elements in `asteroids`
    //Space: O(n) sorted asteroids array
    //sorted
    //greedy
    //
    //Solution Description:
    //First sort the `asteroids` array into ascending order and iterate through that sorted array comparing the asteroid size
    //with `mass`. If `mass` is equal or larger then the asteroid then it is absorbed into `mass`; if the asteroid is larger
    //then we exit early and return false. Finally after we have iterated through all the asteroids we return true as the
    //planet has survived
    static func asteroidsDestroyed(_ mass: Int, _ asteroids: [Int]) -> Bool {
        var mass = mass
        let asteroids = asteroids.sorted { $0 < $1 }
        
        for asteroid in asteroids {
            guard mass >= asteroid else {
                return false
            }
            
            mass += asteroid
        }
        
        return true
    }
}
