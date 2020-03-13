import Foundation

var n = Int(readLine()!)!

var primaryDiagSum = 0;
var secondaryDiagSum = 0;
var primaryIndex = 0;
var secondaryIndex = n - 1;
for i in 0..<n {
    let row = readLine()!.components(separatedBy: " ").map{Int($0)!}
    primaryDiagSum += row[primaryIndex]
    secondaryDiagSum += row[secondaryIndex]
    primaryIndex += 1
    secondaryIndex -= 1
}

print(abs(primaryDiagSum - secondaryDiagSum))
