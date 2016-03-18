import Foundation

/* Problem 20 

n! means n × (n − 1) × ... × 3 × 2 × 1

For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.

Find the sum of the digits in the number 100!

*/
var n = 20

func problem20SmallClassic() -> Int {
    // works for small integers
    return(n.factorial())
}

func problem20SmallFunctional() -> Int {
    // still for small numbers
    return(Array(1...n).reduce(1, combine: {$0 * $1}))
}

func problem20LargeFunctional() -> Int {
    let sum = Array(1...n).reduce(digitArray(1), combine: { multiplyDigitArray($0, coefficient: $1)}).reduce(0, combine: +)
    return sum
}
let classic = benchmark("Problem 20 Classic   :", body: problem20SmallClassic)
let functional = benchmark("Problem 20 Functional:", body: problem20SmallFunctional)

n = 100
let largefunctional = benchmark("Problem 20 Functional:", body: problem20LargeFunctional)

print(String(format: "%.2f", (classic - functional) / classic * 100) + "% difference")
print(String(format: "%.2f", (classic - largefunctional) / classic * 100) + "% difference")


// Correct Answer = 648

