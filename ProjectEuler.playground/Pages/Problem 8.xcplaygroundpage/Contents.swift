import Foundation

/* Problem 8 -- 
The four adjacent digits in the 1000-digit number that have the greatest product are 9 × 9 × 8 × 9 = 5832.

73167176531330624919225119674426574742355349194934
96983520312774506326239578318016984801869478851843
85861560789112949495459501737958331952853208805511
12540698747158523863050715693290963295227443043557
66896648950445244523161731856403098711121722383113
62229893423380308135336276614282806444486645238749
30358907296290491560440772390713810515859307960866
70172427121883998797908792274921901699720888093776
65727333001053367881220235421809751254540594752243
52584907711670556013604839586446706324415722155397
53697817977846174064955149290862569321978468622482
83972241375657056057490261407972968652414535100474
82166370484403199890008895243450658541227588666881
16427171479924442928230863465674813919123162824586
17866458359124566529476545682848912883142607690042
24219022671055626321111109370544217506941658960408
07198403850962455444362981230987879927244284909188
84580156166097919133875499200524063689912560717606
05886116467109405077541002256983155200055935729725
71636269561882670428252483600823257530420752963450

Find the thirteen adjacent digits in the 1000-digit number that have the greatest product. What is the value of this product?
*/

let num1000Digits = "73167176531330624919225119674426574742355349194934" +
    "96983520312774506326239578318016984801869478851843" +
    "85861560789112949495459501737958331952853208805511" +
    "12540698747158523863050715693290963295227443043557" +
    "66896648950445244523161731856403098711121722383113" +
    "62229893423380308135336276614282806444486645238749" +
    "30358907296290491560440772390713810515859307960866" +
    "70172427121883998797908792274921901699720888093776" +
    "65727333001053367881220235421809751254540594752243" +
    "52584907711670556013604839586446706324415722155397" +
    "53697817977846174064955149290862569321978468622482" +
    "83972241375657056057490261407972968652414535100474" +
    "82166370484403199890008895243450658541227588666881" +
    "16427171479924442928230863465674813919123162824586" +
    "17866458359124566529476545682848912883142607690042" +
    "24219022671055626321111109370544217506941658960408" +
    "07198403850962455444362981230987879927244284909188" +
    "84580156166097919133875499200524063689912560717606" +
    "05886116467109405077541002256983155200055935729725" +
"71636269561882670428252483600823257530420752963450"

let bigDigitArray = num1000Digits.characters.map({ Int(String($0))!})
var maxStreak = 13


// When being clever doesn't work better :)
func problem8BooleanFilter() -> Int {
    
    let bigDigitMap = bigDigitArray.map({$0 > 3})
    
    var goodStreak: [Int] = []
    var goodStreakProducts: [Int] = []

    func productAtIndex(index: Int) -> Int {
        var product = 1
        let end = index + maxStreak - 1
        for i in index...end {
            product *= bigDigitArray[i]
        }
        return product
    }

    for i in bigDigitArray.indices {
        if i + maxStreak >= bigDigitArray.count {
            break
        }
        let start = i
        let end = start + maxStreak - 1
        var containsNoLowValues = true
        
        for j in start...end {
            if !bigDigitMap[j] {
                containsNoLowValues = false
                break
            }
        }
        if containsNoLowValues {
            goodStreak.append(i)
            goodStreakProducts.append(productAtIndex(i))
        }
    }
    
    return goodStreakProducts.maxElement()!
}

// You can always just check all the elements
func problem8BruteForce() -> Int {
    let series = 13
    var largestProductInSeries = -1
    for var i = 0; i < bigDigitArray.count - series - 1; i++ {
        var possibleLargestProductInSeries = 1
        for j in 0..<series {
            if bigDigitArray[i + j] == 0 {
                i = i + j
                break
            } else {
                possibleLargestProductInSeries *= bigDigitArray[i + j]
            }
        }
        if(possibleLargestProductInSeries != 1) && largestProductInSeries < possibleLargestProductInSeries{
            largestProductInSeries = possibleLargestProductInSeries
        }
    }
    return(largestProductInSeries)
}

let classic = benchmark("Problem 6 Brute Force:", body: problem8BruteForce)
let functional = benchmark("Problem 6 Filtering  :", body: problem8BooleanFilter)

print(String(format: "%.2f", (classic - functional) / classic * 100) + "% difference")

// CORRECT ANSWER: 23514624000

