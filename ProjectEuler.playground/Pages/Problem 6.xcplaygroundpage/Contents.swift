import Foundation

/* Problem 6-
The sum of the squares of the first ten natural numbers is,
1^2 + 2^2 + ... + 10^2 = 385

The square of the sum of the first ten natural numbers is,
(1 + 2 + ... + 10)2 = 552 = 3025

Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 − 385 = 2640.

Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.
*/

public func problem6Classic() -> Int {
    var sumOfSquares = 0
    var squareOfSums = 0
    for i in 1...100 {
        sumOfSquares += i.squared()
        squareOfSums += i
    }
    squareOfSums *= squareOfSums
    sumOfSquares

    return(squareOfSums - sumOfSquares)
}

public func problem6Functional() -> Int {
    let sumOfSquares = Array(1...100).map(){$0 * $0}.reduce(0, combine: +)
    var squareOfSums = Array(1...100).reduce(0, combine: +)
    squareOfSums *= squareOfSums
    return(squareOfSums - sumOfSquares)
}

let classic = benchmark("Problem 6 Classic   :", body: problem6Classic)
let functional = benchmark("Problem 6 Functional:", body: problem6Functional)

print(String(format: "%.2f", (classic - functional) / classic * 100) + "% difference")

// Correct Answer = 25164150