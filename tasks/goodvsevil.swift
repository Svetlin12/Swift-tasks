import Foundation

func evaluate(good: String, vsEvil evil: String) -> String {
    
    let goodArr = good.components(separatedBy: " ").map { Int($0) ?? 0 }
    let evilArr = evil.components(separatedBy: " ").map { Int($0) ?? 0 }
    
    let sum: ([Int], String) -> Int = { (arr: [Int], type: String) -> Int in
        var sum = 0;
        var multiplyBy = [Int]()
        if type == "good" {
            multiplyBy.append(contentsOf: [1, 2, 3, 3, 4, 10])
        }
        else {
            multiplyBy.append(contentsOf: [1, 2, 2, 2, 3, 5, 10])
        }
        for i in 0..<arr.count {
            sum += arr[i] * multiplyBy[i]
        }
        return sum
    }
    
    if sum(goodArr, "good") > sum(evilArr, "evil")
    {
      return "Battle Result: Good triumphs over Evil"
    }
    else if sum(goodArr, "good") == sum(evilArr, "evil")
    {
      return "Battle Result: No victor on this battle field"
    }
    else
    {
      return "Battle Result: Evil eradicates all trace of Good"
    }
}
