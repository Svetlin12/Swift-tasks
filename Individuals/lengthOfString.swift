import Foundation

func calcLen (str : inout String)->Int {
    var len = 0
    for _ in str {
        len += 1
    }
    return len
}

func calcLenRec(str : inout String, index : Int)->Int {
    var len = 0
    if index < str.count {
        len += calcLenRec(str: &str, index: index + 1) + 1
    }
    return len
}

print("Enter a string:")
var input = readLine()
var str : String = String()
if let input = input {
    str = input
}
print("The length of the string is: \(calcLen(str: &str))")
print("(recursive function) The length of the string is: \(calcLenRec(str: &str, index: 0))")
