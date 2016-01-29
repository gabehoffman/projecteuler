import Foundation

/* Problem 6-
The sum of the squares of the first ten natural numbers is,
1^2 + 2^2 + ... + 10^2 = 385

The square of the sum of the first ten natural numbers is,
(1 + 2 + ... + 10)2 = 552 = 3025

Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 − 385 = 2640.

Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.
*/

// Sum of the squares

var sumOfSquares = 0
var squareOfSums = 0
for i in 1...100 {
    sumOfSquares += i.squared()
    squareOfSums += i
}
squareOfSums *= squareOfSums
sumOfSquares

squareOfSums - sumOfSquares