import Foundation

/* Problem 9 --
A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,

a2 + b2 = c2
For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.

There exists exactly one Pythagorean triplet for which a + b + c = 1000.
Find the product abc.
*/

var maxRange = 1000
var triplets: [Int] = []

5.hasAPythagoreanTriplet()


for i in 1...maxRange {
    if i.hasAPythagoreanTriplet() {
        if i.sumOfPythagoreanTriplet() == 1000 {
            triplets.append(i)
        }
    }
}

triplets

