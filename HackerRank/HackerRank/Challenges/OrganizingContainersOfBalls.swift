//
//  OrganizingContainersOfBalls.swift
//  HackerRank
//
//  Created by William Boles on 29/10/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://www.hackerrank.com/challenges/organizing-containers-of-balls/problem
struct OrganizingContainersOfBalls {
    static func organizingContainers(containers: [[Int]]) -> Bool {
        /**
         Each type needs to end up in a container by itself,
         as a container can not change its capacity (swaps
         happen equally between containers) then for each
         type to have it's own container, capcity needs to
         match type count.
         */
        var containersCapacity = [Int: Int]()
        var typesCount = [Int: Int]()
        
        for (index, container) in containers.enumerated() {
            containersCapacity[index] = container.reduce(0, +)
            
            for (index, typeCount) in container.enumerated()  {
                typesCount[index, default: 0] += typeCount
            }
        }
        
        return (containersCapacity.values.sorted() == typesCount.values.sorted())
    }
}
