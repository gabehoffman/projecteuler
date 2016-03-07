import Foundation

/* 

Starting in the top left corner of a 2×2 grid, and only being able to move to the right and down, there are exactly 6 routes to the bottom right corner.

How many such routes are there through a 20×20 grid?

*/

struct Grid {
    let rows: Int
    var pathCount: [[Int]] = []
    
    
    // Create a grid with all the answers, if you add the square above and square to the left of you, you get the path count to that square
    init(rows: Int) {
        self.rows = rows
        
        var firstRow: [Int] = []
        for i in 1...rows {
            firstRow.append(i+1)
        }
        pathCount.append(firstRow)
        
        for i in 2...rows {
            pathCount.append([i+1])
        }
        
        for i in 1..<rows {
            
            for j in 1..<rows {
                let paths: Int = pathCount[i-1][j] + pathCount[i][j-1]
                pathCount[i].append(paths)
            }

        }
    }
    
    func printGrid() {
        for i in pathCount.indices {
            for j in pathCount[i].indices {
                print("\(pathCount[i][j])", terminator: ", ")
            }
            print("")
        }
    }
}

var threeByThree = Grid(rows: 3)
var twentyByTwenty = Grid(rows: 20)

// Just to check that things are working
print(threeByThree)

twentyByTwenty.printGrid()