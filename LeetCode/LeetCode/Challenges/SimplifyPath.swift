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
    
    //Time: O(n) where n is the number of characters in `path`
    //Space: O(n)
    //stack
    //string
    //
    //Solution Description:
    //Using a stack we build up the final version of the path by iterating through the characters in `path`. Treating the "/"
    //character as a signal the start of a new path component we fast forward through any additional "/" and then build up
    //the body of path component until we hit another "/" character which signals the end of that component. We then
    //determine if the path component is a command by checking if it is:
    //
    //1. `.` - treat as a no-op and skip
    //2.  '..', pop last component from the `stack`
    //
    //Anything else we add to `stack`. Once all chracters in `path` have been processed we concatenate the elements of `stack`
    //together, add a "/" prefix and return that single string.
    func simplifyPath2(_ path: String) -> String {
        let path = Array(path)
        var stack = [String]()

        var p1 = 0

        while p1 < path.count {
            if path[p1] == "/" {
                while p1 < path.count, path[p1] == "/" {
                    p1 += 1
                }

                guard p1 < path.count else {
                    break
                }

                var component = [Character]()
                while p1 < path.count, path[p1] != "/" {
                    component.append(path[p1])
                    p1 += 1
                }

                let str = String(component)

                if str == "." {
                    continue
                } else if str == ".." {
                    _ = stack.popLast()
                } else {
                    stack.append(str)
                }
            }
        }

        return "/" + stack.joined(separator: "/")
    }
}
