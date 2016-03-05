import Foundation

/* 

Starting in the top left corner of a 2×2 grid, and only being able to move to the right and down, there are exactly 6 routes to the bottom right corner.

How many such routes are there through a 20×20 grid?

*/

struct Grid {
    let rows: Int
    var paths: [[Bool]] = []
    
    init(rows: Int) {
        self.rows = rows
        for i in 0..<rows {
            var row: [Bool] = []
            var col: [Bool] = []
            for j in 0..<rows {
                row.append(false)
            }
            for j in 0...rows {
                col.append(false)
            }
            paths.append(row)
            paths.append(col)
        }
        var row: [Bool] = []
        for j in 0..<rows {
            row.append(false)
        }
        paths.append(row)
    }
    
    func printGrid() {
        for i in paths.indices {
            if i.isOdd() {
                print("", terminator: "")
            } else {
                print("", terminator: " ")
            }
            for j in paths[i].indices {
                if !paths[i][j] {
                    if i == paths.count - 1 {
                        print("‾", terminator: " ")
                    } else if i.isOdd() {
                        print("⎮", terminator: " ")
                    } else {
                        print("–", terminator: " ")
                    }
                } else {
                    print(" ", terminator: " ")
                }
            }
            print("")
        }
    }
}

var twoByTwo = Grid(rows: 2)

twoByTwo.printGrid()