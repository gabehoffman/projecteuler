import Foundation

/* Problem 18

By starting at the top of the triangle below and moving to adjacent numbers on the row below, the maximum total from top to bottom is 23.

   3
  7 4
 2 4 6
8 5 9 3

That is, 3 + 7 + 4 + 9 = 23.

Find the maximum total from top to bottom of the triangle below:

              75
             95 64
            17 47 82
           18 35 87 10
          20 04 82 47 65
         19 01 23 75 03 34
        88 02 77 73 07 63 67
       99 65 04 28 06 16 70 92
      41 41 26 56 83 40 80 70 33

     41 48 72 33 47 32 37 16 94 29

    53 71 44 65 25 43 91 52 97 51 14
   70 11 33 28 77 73 17 78 39 68 17 57
  91 71 52 38 17 14 91 43 58 50 27 29 48
 63 66 04 68 89 53 67 30 73 16 69 87 40 31
04 62 98 27 23 09 70 98 73 93 38 53 60 04 23

NOTE: As there are only 16384 routes, it is possible to solve this problem by trying every route. However, Problem 67, is the same challenge with a triangle containing one-hundred rows; it cannot be solved by brute force, and requires a clever method! ;o)

*/


// HELPER FUNCTIONS

func formatRow(s: String) -> [Int] {
    let row = s.characters.split(" ").map({ Int(String($0))!})
    return row
}

func printTriangle(triangle: [[Int]]) {
    for i in 0..<height {
        let elementCount = height - triangle[i].count
        let halfway = elementCount / 2
        if i.isOdd() {
            print("  ", terminator: "")
        }
        for _ in 0..<halfway {
            print("   ", terminator: "")
        }
        for j in triangle[i] {
            if j == 0 {
                print("-- ", terminator: "")
            } else if j > 9 {
                print("\(j) ", terminator: "")
            } else {
                print("0\(j) ", terminator: "")
            }
        }
        for _ in 0..<halfway {
            print("   ",  terminator: "")
        }
        print("")
    }
}

func findTrianglePaths(triangle: [[Int]]) -> [[Int]] {
    var goodPaths: [[Int]] = []
    let height = triangle.count
    
    func findPathFromRow(row: Int, col: Int, path: [Int]) -> Bool {
        var myPath = path
        
        //print(row, col, path)
        
        // Out of Bounds
        if (row >= height) || (col >= height) {
            return false
        }
        if triangle[row][col] == 0 {
            return false
        }
        
        // Current location is now valid
        myPath.append(triangle[row][col])
        
        // End of path
        if row == height - 1 {
            goodPaths.append(myPath)
            return true
        }
        
        // Check child paths
        let childPathLeft = findPathFromRow(row + 1, col: col, path: myPath)
        let childPathRight = findPathFromRow(row + 1, col: col + 1, path: myPath)
        
        return childPathLeft || childPathRight
    }
 
    findPathFromRow(0, col: 0, path: [])
    
    return goodPaths
}

func flattenTriangle(triangle: [[Int]]) -> [Int]{
    var flattenedRow: [Int] = []
    for row in triangle {
        var newRow: [Int] = []
        // init the values on the first row
        if row.count == 1 {
            flattenedRow = row
        } else {
            for i in 0..<row.count {
                // Check and see if there exisits nodes above to the left and right and pick the max
                if i == 0 { // first element has only one choice
                    newRow.append(flattenedRow[i] + row[i])
                } else if i == row.count - 1 { // last element only has one choice
                    newRow.append(flattenedRow[i-1] + row[i])
                } else {
                    let left = flattenedRow[i-1] + row[i]
                    let right = flattenedRow[i] + row[i]
                    if left > right {
                        newRow.append(left)
                    } else {
                        newRow.append(right)
                    }
                }
            }
            flattenedRow = newRow
            print(newRow)
        }
    }
    return flattenedRow
}
// END HELPER FUNCTIONS

var height = 15
var triangle: [[Int]] = []
var paths: [[Int]] = []
let input: [String] = [
"75",
"95 64",
"17 47 82",
"18 35 87 10",
"20 04 82 47 65",
"19 01 23 75 03 34",
"88 02 77 73 07 63 67",
"99 65 04 28 06 16 70 92",
"41 41 26 56 83 40 80 70 33",
"41 48 72 33 47 32 37 16 94 29",
"53 71 44 65 25 43 91 52 97 51 14",
"70 11 33 28 77 73 17 78 39 68 17 57",
"91 71 52 38 17 14 91 43 58 50 27 29 48",
"63 66 04 68 89 53 67 30 73 16 69 87 40 31",
"04 62 98 27 23 09 70 98 73 93 38 53 60 04 23"]

for s in input {
    triangle.append(formatRow(s))
}

// printTriangle(triangle)
// find the average of all the numbers in the triangle and use that to prune possible nodes
var average = 0
var elementCount = 0
for row in triangle {
    for element in row {
        average += element
        elementCount += 1
    }
}
average /= elementCount

// the average is still too high to find the right paths, reduce it further
//average /= 2

// Remove numbers that are less than the average of their respective rows
let filteredTriangle = triangle.map(){ row in row.map(){ number -> Int in if (number <= average && row.count > 4){ return 0 } else {return number} } }

paths = findTrianglePaths(filteredTriangle)

var max = 0
for path in paths {
    var pathSum = path.reduce(0, combine: +)
    if pathSum > max {
        max = pathSum
        print(path)
    }
}

print(max)

printTriangle(filteredTriangle)
print("")

// Correct Answer [75, 64, 82, 87, 82, 75, 73, 28, 83, 32, 91, 78, 58, 73, 93]
// 1074


/* Utilizing the idea that there exsists local optimal answers, 
you can reduce each row of the triangle into an arry of max values very quickly
so row 2 is simply 75 + 95 and 75 + 64 = [170, 139]
row 3 is the max of the current element and node to left and right above = [187, 217, 221]
this gives you max values, but doesn't revel the path, so there is a trade off
*/
print(flattenTriangle(triangle).maxElement()!)
