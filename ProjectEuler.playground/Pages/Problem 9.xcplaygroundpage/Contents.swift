import Foundation

/* Problem 9 --
A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,

a2 + b2 = c2
For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.

There exists exactly one Pythagorean triplet for which a + b + c = 1000.
Find the product abc.
*/

var maxRange = 500
var triplets: [(a: Int, b: Int, c: Int)] = []

5.hasAPythagoreanTriplet()

for i in 1...maxRange {
    var trips = i.pythagoreanTriplets()
    if trips.count > 0 {
        for j in trips.indices {
            triplets.append(trips[j])
        }
    }
}

print(triplets)

// CORRECT ANSWER: 31875000 for a:200, b:375, c:425
// Special Note: Some values for c yield more than a single triplet, you can't just find the first one
