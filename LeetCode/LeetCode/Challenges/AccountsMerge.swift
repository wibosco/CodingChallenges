//
//  AccountsMerge.swift
//  CodingChallenges
//
//  Created by William Boles on 08/01/2022.
//  Copyright © 2022 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/accounts-merge/
//graph theory
struct AccountsMerge {
    
    //Time: O(m * (n log n)) where `n` is the number of unique accounts and `m` the number of unique email addresses
    //Space: O(n * m) where `n` is the number of unique accounts and `m` the number of email addresses
    //BFS
    //multi-source
    //visited
    //dictionary
    //adjacency list
    //sorting
    //
    //Solution Description:
    //Treat the accounts as a graph, with the emails being the vertices. Ignoring the account name to begin with, we first
    //build up adjacency list (using a dictionary) from the email addresses - treating the first email address in each
    //account as the "root" for that subgraph. What's important to note here is that the add the email addresses to both
    //sides of the edge and we use the email addresses as both key and value in that adjacency list. Next we iterate
    //back through the `accounts` array and perform a breadth first search on each vertice we encounter. As this graph can
    //contain multiple subgraphs, we need to perform multiple BFSs - to ensure that we don't get caught in a cycle we
    //track which vertices we have visited and only search those vertices that haven't been previously visited. Once each
    //subgraph has been search we sort the email addresses, add the name and append the merged account to our
    //`mergedAccounts` array
    static func accountsMerge(_ accounts: [[String]]) -> [[String]] {
        var adjList = [String: [String]]()
        
        //build adjacency list
        for account in accounts {
            let firstEmail = account[1] //treat the first email as the root of this accounts graph
            
            for otherEmail in account[2...] {
                adjList[firstEmail, default: [String]()].append(otherEmail)
                adjList[otherEmail, default: [String]()].append(firstEmail)
            }
        }
        
        
        var visited = Set<String>()
        
        var mergedAccounts = [[String]]()
        
        for account in accounts {
            var queue = [account[1]]
            var mergedEmails = [String]()
            
            while !queue.isEmpty {
                let email = queue.removeFirst()
                
                guard !visited.contains(email) else {
                    continue
                }
                
                mergedEmails.append(email)
                visited.insert(email)
                
                guard let neighbors = adjList[email] else {
                    continue
                }
                
                for neigbor in neighbors {
                    guard !visited.contains(neigbor) else {
                        continue
                    }
                    
                    queue.append(neigbor)
                }
            }
            
            guard !mergedEmails.isEmpty else { //only merge those accounts that still have associated email addresses
                continue
            }
            
            let sortedEmails = mergedEmails.sorted { $0 < $1 } // n log n
            
            var mergedAccount = [String]()
            mergedAccount.append(account[0]) //name
            mergedAccount.append(contentsOf: sortedEmails)
            
            mergedAccounts.append(mergedAccount)
        }
        
        return mergedAccounts
    }
    
    //Time: O(m * (n log n)) where `n` is the number of unique accounts and `m` the number of unique email addresses
    //Space: O(n * m) where `n` is the number of unique accounts and `m` the number of email addresses
    //DFS
    //multi-source
    //visited
    //dictionary
    //adjacency list
    //sorting
    //
    //Solution Description:
    //Treat the accounts as a graph, with the emails being the vertices. Ignoring the account name to begin with, we first
    //build up adjacency list (using a dictionary) from the email addresses - treating the first email address in each
    //account as the "root" for that subgraph. What's important to note here is that the add the email addresses to both
    //sides of the edge and we use the email addresses as both key and value in that adjacency list. Next we iterate
    //back through the `accounts` array and perform a depth first search on each vertice we encounter. As this graph can
    //contain multiple subgraphs, we need to perform multiple DFSs - to ensure that we don't get caught in a cycle we
    //track which vertices we have visited and only search those vertices that haven't been previously visited. Once each
    //subgraph has been search we sort the email addresses, add the name and append the merged account to our
    //`mergedAccounts` array
    static func accountsMergeDFS(_ accounts: [[String]]) -> [[String]] {
        var adjList = [String: [String]]()
        
        //build adjacency list
        for account in accounts {
            let firstEmail = account[1] //treat the first email as the root of this accounts graph
            
            for otherEmail in account[2...] {
                adjList[firstEmail, default: [String]()].append(otherEmail)
                adjList[otherEmail, default: [String]()].append(firstEmail)
            }
        }
        
        var visited = Set<String>()
        
        var mergedAccounts = [[String]]()
        for account in accounts { //as this graph can contain multiple subgraphs we need to loop through all vertices to make sure we try each path
            let email = account[1]
            
            guard !visited.contains(email) else {
                continue
            }
            
            var mergedEmails = [String]()
            
            dfs(&mergedEmails, email, &visited, adjList)
            
            let sortedEmails = mergedEmails.sorted { $0 < $1 } // n log n
            
            var mergedAccount = [String]()
            mergedAccount.append(account[0]) //name
            mergedAccount.append(contentsOf: sortedEmails)
            
            mergedAccounts.append(mergedAccount)
        }
        
        return mergedAccounts
    }
    
    private static func dfs(_ mergedEmails: inout [String], _ email: String, _ visited: inout Set<String>, _ adjList: [String: [String]]) {
        visited.insert(email)
        
        mergedEmails.append(email)
        
        guard let neighbors = adjList[email] else {
            return
        }
        
        for neighbor in neighbors {
            guard !visited.contains(neighbor) else {
                continue
            }
            
            dfs(&mergedEmails, neighbor, &visited, adjList)
        }
    }
    
    //Time: O(m * (n log n)) where `n` is the number of unique accounts and `m` the number of unique email addresses
    //Space: O(n * m) where `n` is the number of unique accounts and `m` the number of unique email addresses
    //disjoint set
    //array
    //dictionary
    //sorting
    //
    //Solution Description:
    //Treat the accounts as a graph, with the emails being the vertices. We iterate through the accounts emails and attempt
    //to find overlap using UnionFind/Disjont-Sets. For UnionFind to work we treat the account index as the value for that
    //set. Each unique email we encounter we store in a dictionary alongside the index of the account associated with the
    //email address. If we encounter an email address that we have already encountered we know that we have overlap and merge
    //that email addresses account the previously encountered email addresses account. Once we have have iterated through all
    //accounts we will have a `map` that contains all unique email addresses and their account indexes and disjoint-sets that
    //combined the duplicated email addresses in sets. We now need to iterate through each unique email address and find
    //which set they are associated with to complete our merge. Once we have all accounted represented once with their email
    //addresses, we only need to sort the email addresses and add in the users name
    static func accountsMergeUnionFind(_ accounts: [[String]]) -> [[String]] {
        var map = [String: Int]() //[Email: Index], to add all unique emails
        let uf = UnionFind(count: accounts.count)
        
        for (i, account) in accounts.enumerated() {
            for email in account[1...] {
                if let match = map[email] {
                    uf.union(i, match) //previously seen email for associate `i` with `match`
                } else {
                    map[email] = i //new email
                }
            }
        }
        
        var mergedAccounts = [Int: [String]]()
        for (key, value) in map { //[Email: Index]
            //find the root for each unique email (even through the email only appears once, it may be associated with other emails that appear multiple times)
            let root = uf.find(value)
            mergedAccounts[root, default: [String]()].append(key)
        }
        
        var sortedMergedAccounts = [[String]]()
        for (key, value) in mergedAccounts {
            let name = accounts[key][0]
            
            var account = [String]()
            account.append(name)
            
            let sortedEmails = value.sorted { $0 < $1 } // n log n
            account.append(contentsOf: sortedEmails)
            
            sortedMergedAccounts.append(account)
        }
        
        return sortedMergedAccounts
    }
}

//Union-by-rank/disjoint set
//See: https://www.youtube.com/watch?v=wU6udHRIkcc
//
//Can only be applied on undirected graphs
//
//Solution Description:
//1. Each vertice is given an initial value of -1 to indicate that they are their own root
//2. Perform a union between two vertices by finding the root of each vertice (this will be a
//   negative number). This root may not be directly associated with the vertice but instead
//   require multiple steps hence the while loop in `find`
//3. Compare the size of the nodes assoicated with each vertices root and select the root with
//   the most nodes i.e. lowest negative value. Update the smaller root to point at the other
//   root and update the other roots count to include the count that the former root had
private class UnionFind {
    private(set) var ranks: [Int]
    private(set) var groupCount: Int
    
    // MARK: - Init
    
    init(count: Int) {
        //roots will have a negative count of the number of nodes in their group;
        //if an element has a non-negative number it is pointing at the index of a root
        ranks = Array(repeating: -1, count: count)
        
        groupCount = count
    }
    
    // MARK: - Find
    
    func find(_ x: Int) -> Int { //rather than just looking directly for `x` we are searching for the root of `x`
        guard ranks[x] >= 0 else { // 0 is valid as an array index
            return x
        }
        
        ranks[x] = find(ranks[x])
        
        return ranks[x]
    }
    
    // MARK: - Union
    
    func union(_ x: Int, _ y: Int) {
        let rootX = find(x)
        let rootY = find(y)
        
        guard rootX != rootY else { //already in the same grouping
            return
        }
        
        groupCount -= 1
        
        //join the smaller graph with larger. If both are the same
        //size then favour `x`
        if ranks[rootX] <= ranks[rootY] { //careful with the comparison here as the larger root has a smaller value (due to being negative)
            let tmp = ranks[rootY] //tmp will be a negative
            ranks[rootY] = rootX
            ranks[rootX] += tmp //increasing the value as this index, increases the rank of that root
        } else {
            let tmp = ranks[rootX]
            ranks[rootX] = rootY
            ranks[rootY] += tmp // remember here we are adding two negative numbers
        }
    }
}
