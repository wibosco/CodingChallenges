// Created 12/05/2025.

import Foundation

//https://leetcode.com/problems/number-of-students-unable-to-eat-lunch/
struct NumberOfStudentsUnableToEatLunch {

    //Time: O(n + m) where n is the number of elements in `students`
    //               where m is the number of elements in `sandwiches`
    //Space: O(1)
    //array
    //counting
    //
    //Solution Description:
    //We iterate through `students` and count how many want a circle or square sandwich. We then iterate through `sandwiches`
    //and decrement the count for each sandwich preference. Once a sandwich type can't be consumed (because it is 0) we know
    //that there exists a block in sandwich consumption that be overcome and we exit that loop. We then return the count of
    //the hungry students by adding the remaining count for each sandwich type.
    func countStudents(_ students: [Int], _ sandwiches: [Int]) -> Int {
        var count = [0, 0] //[circle count, square count]
        for s in students {
            count[s] += 1
        }
        
        for s in sandwiches {
            guard count[s] > 0 else {
                //no more sandwiches of the perfered type left
                break
            }
            count[s] -= 1
        }
        
        return count[0] + count[1] //how many circle and square sandwiches/students left
    }

    //Time: O(n * m) where n is the number of elements in `students`
    //               where m is the number of elements in `sandwiches`
    //Space: O(n + m)
    //array
    //queue
    //nested loops
    //
    //Solution Description:
    //We iterate through the students and check if the student wants the top-most sandwich. If they do we remove that sandwich
    //and student; if they don't the student is added to the next iteration and the top-most sandwich reamins. To avoid an
    //infinite loop we have a second condition of the outer loop `sandwitchTaken`. Once all sandwiches have been consumed or
    //no more can be we return the count of `students`.
    func countStudents2(_ students: [Int], _ sandwiches: [Int]) -> Int {
        var sandwichTaken = true
        var students = students
        var sandwiches = sandwiches

        while !sandwiches.isEmpty, sandwichTaken {  //could have been students.isEmpty
            sandwichTaken = false
            var next = [Int]()

            for student in students {
                if student == sandwiches[0] {  //students and sandwiches are cosumed at the same rate so [0] is safe
                    sandwichTaken = true
                    sandwiches.removeFirst()
                } else {
                    next.append(student)
                }
            }

            students = next
        }

        return students.count
    }
}
