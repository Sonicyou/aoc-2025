import Algorithms
import Collections
import Foundation

struct Day03: AdventDay {
    var data: String
    
    var entities: [String] {
        data.split(separator: "\n").map({ String($0) })
    }
    
    func part1() -> Any {
        var output = 0
        for battery in entities {
            let digits = battery.compactMap { $0.wholeNumberValue }
            var firstMax = 0
            var secondMax = 0
            for i in 0..<digits.count {
                if digits[i] > firstMax && i != digits.count-1 {
                    firstMax = digits[i]
                    secondMax = 0
                } else if digits[i] > secondMax {
                    secondMax = digits[i]
                }
            }
            output += firstMax * 10 + secondMax
        }
        return output
    }
    
    func part2() -> Any {
        var output = 0
        for battery in entities {
            let digits = battery.compactMap { $0.wholeNumberValue }
            var maxes = Array(repeating: 0, count: 12)
            for i in 0..<digits.count {
                for k in 0..<12 {
                    if digits[i] > maxes[k] && digits.count-1-i+k>=11 {
                        maxes[k] = digits[i]
                        for l in k+1..<12 {
                            maxes[l] = 0
                        }
                        break
                    }
                }
            }
            output += Int(maxes.map(String.init).joined())!
        }
        return output
    }
}
