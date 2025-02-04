//
//  SimplifyPath.swift
//  LeetCode
//
//  Created by William Boles on 15/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/simplify-path/
struct SimplifyPath {
    
    //Time: O(n) where n is the number of subpaths in `path`
    //Space: O(n) where n is the number of characters in `path`
    //stack
    //string
    //
    //Solution Description:
    //Split path using "/" into directory-names and/or commands (`..`). Build stack of path by traversing through the split
    //path and apply thr rules:
    //
    //1. If current component is an empty string then skip it
    //2. If element is `.` - treat as a no-op and skip
    //3. If current component is '..', pop last component from the `stack`
    //4. Anything else add to `stack`
    //
    //Add a starting "/" and concatenate stack components together using "/"
    func simplifyPath(_ path: String) -> String {
        let components = path.split(separator: "/") //don't try and treat each character independently
        var stack = [String]()
        
        for component in components {
            guard component != ".", component != "" else { // no-op
                continue
            }
            
            if component == ".." { //pop up a directory
                _ = stack.popLast() //no need to check if the stack has elements when using `popLast()`
            } else {
                stack.append(String(component))
            }
        }
    
        return "/" + stack.joined(separator: "/")
    }
}
