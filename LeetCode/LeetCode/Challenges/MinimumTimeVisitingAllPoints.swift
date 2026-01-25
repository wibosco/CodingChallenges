// Created 25/01/2026.

import Foundation

//https://leetcode.com/problems/minimum-time-visiting-all-points/
struct MinimumTimeVisitingAllPoints {
    
    //Time: O(n) where n is the number of elements in `points`
    //Space: O(1)
    //array
    //matrix
    //Chebyshev distance
    //
    //Solution Description:
    //The shortest distance between two points is to traverse as much of it as possible diagonally. Here we can use the
    //Chebyshev distance forumla to calculate the shortest distance between two points. For each pair of points we
    //calculate the shortest distance by taking the maximum of how many veritcal or hozitional moves are required for
    //one point to be inline with the other (either vertically inline or hozitionally inline) - this maximum value is
    //the same as moving diagonally. We repeat this process for all point pairs.
    //
    //See https://en.wikipedia.org/wiki/Chebyshev_distance
    func minTimeToVisitAllPoints(_ points: [[Int]]) -> Int {
        guard points.count > 1 else {
            return 0
        }
        
        var totalSeconds = 0
        
        for i in 1..<points.count {
            let dx = abs(points[i][0] - points[(i - 1)][0])
            let dy = abs(points[i][1] - points[(i - 1)][1])

            totalSeconds += max(dx, dy) //simulate moving diagonally
        }
        
        return totalSeconds
    }
    
    //Time: O(n * m) where n is the number of rows in the matrix
    //               where m is the number of columns in the matrix
    //Space: O(n * m)
    //array
    //matrix
    //graph theory
    //BFS
    //visited
    //level traversal
    //relative indexing
    //
    //Solution Description:
    //Using relative indexing we search how to travel from one point to another. To ensure that we find the shortest route
    //we using BFS. We treat each level traversal as 1 second passing. To avoid re-visiting a point, we store the points
    //visited in the `visited` set. Once we find the path from one point to other, we move onto the next point and repeat
    //the process.
    func minTimeToVisitAllPoints2(_ points: [[Int]]) -> Int {
        guard points.count > 1 else {
            return 0
        }
        
        var totalSeconds = 0
        var i = 1

        while i < points.count {
            totalSeconds += bfs(points[(i - 1)], points[i])

            i += 1
        }

        return totalSeconds
    }

    private func bfs(_ start: [Int], _ target: [Int]) -> Int {
        var seconds = 0

        var queue = [[Int]]()
        queue.append(start)

        var visited = Set<[Int]>()

        while !queue.isEmpty {
            var next = [[Int]]()

            for coord in queue {
                guard !visited.contains(coord) else {
                    continue
                }
                visited.insert(coord)

                guard coord != target else {
                    return seconds
                }

                let r = coord[0]
                let c = coord[1]

                next.append([(r + 1), c])
                next.append([(r - 1), c])
                next.append([r, (c + 1)])
                next.append([r, (c - 1)])
                next.append([(r + 1), (c + 1)])
                next.append([(r + 1), (c - 1)])
                next.append([(r - 1), (c + 1)])
                next.append([(r - 1), (c - 1)])
            }

            queue = next
            seconds += 1
        }

        return -1
    }
}
