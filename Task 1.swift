import Foundation

var nk = readLine()!.components(separatedBy: " ").map{Int($0)!}
var (n, k) = (nk[0], nk[1])
var count = Array<Int>(repeating: 0, count: k)
var arr = readLine()!.components(separatedBy: " ").map{Int($0)!}

for el in arr {
    count[el % k] += 1
}

var sum = 0
for i in 1...k/2 {
    if i == k/2 && k % 2 == 0
    {
        sum += count[i] * (count[i] - 1) / 2
    }
    else
    {
        sum += count[i]*count[k - i]
    }
}

sum += count[0] * (count[0] - 1) / 2

print(sum)
