import Foundation

/* Problem 5 --
2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
*/

var set1to10: Set = [1,2,3,4,5,6,7,8,9,10]
var set1to20: Set = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]

var factors = Set(2520.factors())

factors.intersect(set1to20) == set1to20

var number = 0
var found = false
let numberOfFactors = 11
var muliplier = numberOfFactors.factors().count

repeat {
    number += muliplier
    found = number.hasFirstNFactors(numberOfFactors)
} while !found

number

