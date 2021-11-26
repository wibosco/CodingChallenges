//
//  SimplifyPath.swift
//  CodingChallenges
//
//  Created by William Boles on 15/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/simplify-path/
//stack
struct SimplifyPath {
    
    //Time: O(n)
    //Space: O(n)
    //
    //Solution Description:
    //1. Split path using "/"
    //2. Build stack of path by traversing through split path, if encoutering ".." pop last element from stack
    //3. Concatenate stack elements together
    static func simplifyPath(_ path: String) -> String {
        let components = path.split(separator: "/")
        var stack = [String]()
        
        for component in components {
            guard component != ".", component != "" else {
                continue
            }
            
            if component == ".." {
                _ = stack.popLast()
            } else {
                stack.append(String(component))
            }
        }
    
        return "/" + stack.joined(separator: "/")
    }
}
