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

func problem20aLargeFunctional() -> Int {
    let sum = Array(1...n).reduce(digitArray(1), combine: { multiplyDigitArray($0, coefficient: $1)}).reduce(0, combine: +)
    return sum
}

func problem20bLargeFunctional() -> Int {
    // Typical solution from Project Euler Forums
    // Note the n^2 inefficiency of the solution
    var  array = Array(count: 1000, repeatedValue:0)
    array[0] = 1
    
    for i in 1...100 {
        array = array.map{$0 * i}
        for j in 0..<1000{
            if array[j] > 10{
                let a = array[j] / 10
                array[j] = array[j] - a*10
                array[j+1] = array[j+1] + a
            }
        }
    }
    
    return(array.reduce(0, combine: { $0 + $1 }))
}

let classic = benchmark("Problem 20 Classic   :", body: problem20SmallClassic)
let functional = benchmark("Problem 20 Functional:", body: problem20SmallFunctional)
print(String(format: "%.2f", (classic - functional) / classic * 100) + "% difference on small numbers")
print("")

n = 100
let largeFunctionalA = benchmark("Problem 20 Functional:", body: problem20aLargeFunctional)
let largeFunctionalB = benchmark("Problem 20 Functional:", body: problem20bLargeFunctional)


print(String(format: "%.2f", (largeFunctionalB - largeFunctionalA) / classic * 100) + "% difference on large numbers")


// Correct Answer = 648

