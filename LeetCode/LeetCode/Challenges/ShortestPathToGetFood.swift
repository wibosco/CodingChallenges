// Created 10/11/2026.

import Foundation

//https://leetcode.com/problems/shortest-path-to-get-food/
struct ShortestPathToGetFood {
    
    //Time: O(n * m) where n is the number of rows in `grid`
    //               where m is the number of columns in `grid`
    //Space: O(n * m)
    //matrix
    //array
    //graph theory
    //BFS
    //iterative
    //relative indexing
    //inline
    //negative marking
    //level traversal
    //
    //Solution Description:
    //Treating `grid` as a graph, we use BFS to find the length of the shortest route from `*` to the nearest `#`. First we
    //need to find `*` (our starting cell), which we do by iterating through the rows and columns in turn. Once we have our
    //starting cell, we perform a BFS outwards from it. As BFS searches wide rather than deep with every move costing the same,
    //the first `#` we reach is guaranteed to be the closest one. To track how far a cell is from our starting cell, we treat
    //each pass through `queue` as a level and count those passes in `level` - the level a cell is dequeued at is its distance,
    //in moves, from `*`. When adding a cell's neighbours, we add all four possible moves. To avoid processing a cell more
    //than once, rather than tracking processed cells in a separate `visited` set, we take a mutable copy of `grid` and
    //overwrite each processed cell with `X` - turning it into a cell we can't move to. Before inspecting a cell, we first
    //ensure that its coordinates are valid i.e. within `grid`. We then inspect the contents of the cell: if we find `#`, we
    //return `level`; if we find `X` (either an original obstacle or a cell we have already processed), we can't move to this
    //cell; otherwise (`O` or our starting `*`), we mark the cell as `X` and add its neighbours to `next` so they are checked
    //in the following level. If `queue` empties without us finding `#`, we return -1.
    func getFood(_ grid: [[Character]]) -> Int {
        for r in 0..<grid.count {
            for c in 0..<grid[r].count {
                if grid[r][c] == "*" {
                    return bfs(grid, [r, c])
                }
            }
        }

        return -1
    }

    private func bfs(_ grid: [[Character]], _ srcCoords: [Int]) -> Int {
        var grid = grid

        var queue = [[Int]]() //[[r, c]]
        queue.append(srcCoords)

        var level = 0

        while !queue.isEmpty {
            var next = [[Int]]()

            for coords in queue {
                guard coords[0] >= 0, coords[0] < grid.count, coords[1] >= 0, coords[1] < grid[coords[0]].count else {
                    continue
                }

                guard grid[coords[0]][coords[1]] != "#" else {
                    return level
                }

                guard grid[coords[0]][coords[1]] != "X" else {
                    continue
                }
                grid[coords[0]][coords[1]] = "X"

                next.append([(coords[0] + 1), coords[1]])
                next.append([(coords[0] - 1), coords[1]])
                next.append([coords[0], (coords[1] + 1)])
                next.append([coords[0], (coords[1] - 1)])
            }

            queue = next
            level += 1
        }

        return -1
    }
    
    //Time: O(n * m) where n is the number of rows in `grid`
    //               where m is the number of columns in `grid`
    //Space: O(n * m)
    //matrix
    //array
    //graph theory
    //BFS
    //iterative
    //relative indexing
    //visited
    //level traversal
    //
    //Solution Description:
    //Treating `grid` as a graph, we use BFS to find the length of the shortest route from `*` to the nearest `#`. First we
    //need to find `*` (our starting cell), which we do by iterating through the rows and columns in turn. Once we have our
    //starting cell, we perform a BFS outwards from it. As BFS searches wide rather than deep with every move costing the same,
    //the first `#` we reach is guaranteed to be the closest one. To track how far a cell is from our starting cell, we treat
    //each pass through `queue` as a level and count those passes in `level` - the level a cell is dequeued at is its distance,
    //in moves, from `*`. When adding a cell's neighbours, we add all four possible moves. To avoid processing a cell more
    //than once, we track the cells we have already processed in `visited`. Before inspecting a cell, we first ensure that its
    //coordinates are valid i.e. within `grid` and not already visited. We then inspect the contents of the cell: if we find
    //`X`, we can't move to this cell; if we find `#`, we return `level`; otherwise (`O` or our starting `*`), we add this
    //cell's neighbours to `next` so they are checked in the following level. If `queue` empties without us finding `#`, we
    //return -1.
    func getFood2(_ grid: [[Character]]) -> Int {
        for r in 0..<grid.count {
            for c in 0..<grid[r].count {
                if grid[r][c] == "*" {
                    return bfs2(grid, [r, c])
                }
            }
        }

        return -1
    }

    private func bfs2(_ grid: [[Character]], _ srcCoords: [Int]) -> Int {
        var queue = [[Int]]() //[[r, c]]
        queue.append(srcCoords)

        var level = 0

        var visited = Set<[Int]>()

        while !queue.isEmpty {
            var next = [[Int]]()

            for coords in queue {
                guard coords[0] >= 0, coords[0] < grid.count, coords[1] >= 0, coords[1] < grid[coords[0]].count else {
                    continue
                }

                guard !visited.contains(coords) else {
                    continue
                }
                visited.insert(coords)

                guard grid[coords[0]][coords[1]] != "X" else {
                    continue
                }

                guard grid[coords[0]][coords[1]] != "#" else {
                    return level
                }

                next.append([(coords[0] + 1), coords[1]])
                next.append([(coords[0] - 1), coords[1]])
                next.append([coords[0], (coords[1] + 1)])
                next.append([coords[0], (coords[1] - 1)])
            }

            queue = next
            level += 1
        }

        return -1
    }
}
