import Algorithms
import Collections

struct Day02: AdventDay {
    var data: String
    
    var entities: [[Int]] {
        data.split(separator: ",").map {
            $0.split(separator: "-").compactMap { Int($0) }
        }
    }
    
    func part1() -> Any {
        let entities = entities
        var sum = 0

        for distance in entities {
            for i in distance[0]...distance[1] {
                let digits = String(i).compactMap { $0.wholeNumberValue }
                let digitsCount = digits.count
                if digitsCount % 2 == 0 {
                    if digits[0..<digitsCount/2] == digits[digitsCount/2..<digitsCount] {
                        sum += i
                    }
                }
            }
        }
        
        return sum
    }
    
    func part2() -> Any {
        let entities = entities
        var sum = 0

        for distance in entities {
            for i in distance[0]...distance[1] {
                let digits = String(i).compactMap { $0.wholeNumberValue }
                let digitsCount = digits.count

                if digitsCount == 1 { break }
                for k in (1...digitsCount/2).reversed() {
                    if digitsCount % k == 0 {
                        var equal = true
                        var l = 0
                        while equal && l != digitsCount/k - 1 {
                            equal = digits[l*k..<(k*(1+l))] == digits[k*(1+l)..<(k*(2+l))]
                            l+=1
                        }
                        
                        if equal {
                            sum += i
                            break
                        }
                    }
                }
            }
        }
        
        return sum
    }
}
