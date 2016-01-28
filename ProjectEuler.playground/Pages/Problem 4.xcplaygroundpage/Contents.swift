import Foundation

/* Problem 4 --
A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

Find the largest palindrome made from the product of two 3-digit numbers.
*/
var threeDigitA = 999
var threeDigitB = 999
var product = threeDigitA * threeDigitB
repeat {
    product = threeDigitA * threeDigitB
    threeDigitB--
    if threeDigitB < 900 {
        threeDigitA--
        threeDigitB = 999
    }
} while !product.isPalindrome()


product
threeDigitA
threeDigitB
