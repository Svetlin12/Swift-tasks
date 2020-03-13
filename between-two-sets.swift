import Foundation

var nm = readLine()!.components(separatedBy: " ").map{Int($0)!}
var a = readLine()!.components(separatedBy: " ").map{Int($0)!}
var b = readLine()!.components(separatedBy: " ").map{Int($0)!}
var count = 0 
if a[a.count - 1 ] < b[0] {
    for i in a[a.count - 1 ]...b[0] {
        var isDivisible = true
        for element in a {
                if i % element != 0 {
                    isDivisible = false
                    break 
                }
                
        }
        if isDivisible == true {
            for element in b {
                if element % i != 0  {
                    isDivisible = false 
                    break
                }
            
            }
        }
        if isDivisible == true {
            count = count + 1 
        } 
    }
}
print (count)
