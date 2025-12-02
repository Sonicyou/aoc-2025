import Algorithms
import Collections

struct Day01: AdventDay {
    var data: String
    let start = 50
    let max = 99    
    
    var entities: [String] {
        data.split(separator: "\n").map {
            String($0)
        }
    }
    
    func part1() -> Any {
        var current = start
        var zeros = 0

        for i in 0..<entities.count {
            var entity = entities[i]
            let first = entity.removeFirst()
            if first == "L" {
                current -= Int(entity)!
            } else {
                current += Int(entity)!
            }
            
            if current % 100 == .zero { zeros += 1 }
        }
        
        return zeros
    }
    
    func part2() -> Any {
        var current = start
        var zeros = 0

        for i in 0..<entities.count {
            var entity = entities[i]
            let first = entity.removeFirst()
            if first == "L" {
                for _ in 0..<Int(entity)! {
                    current -= 1
                    if current % 100 == .zero { zeros += 1 }
                }
            } else {
                for _ in 0..<Int(entity)! {
                    current += 1
                    if current % 100 == .zero { zeros += 1 }
                }
            }
        }
        
        return zeros
    }
}
