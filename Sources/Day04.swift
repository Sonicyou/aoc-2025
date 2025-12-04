import Algorithms
import Collections

struct Day04: AdventDay {
    var data: String
    
    var entities: [[Character]] {
        data.split(separator: "\n").map {
            Array($0)
        }
    }
    
    func part1() -> Any {
        let entities = entities
        let deapth = entities.count
        let length = entities.first!.count
        let movements = [[-1,-1],[0,-1],[1,-1],[-1,0],[1,0],[-1,1],[0,1],[1,1]]
        var good = 0
        for i in 0..<length {
            for j in 0..<deapth {
                if entities[i][j] == "@" {
                    var count = 0
                    for movement in movements {
                        let row = j + movement[0]
                        let column = i + movement[1]
                        if row>=0, column>=0, row<length, column<deapth {
                            if entities[column][row] == "@" {
                                count += 1
                            }
                        }
                    }
                    
                    if count<4 {
                        good += 1
                    }
                }
            }
        }
        return good
    }
    
    func part2() -> Any {
        var entities = entities
        let deapth = entities.count
        let length = entities.first!.count
        let movements = [[-1,-1],[0,-1],[1,-1],[-1,0],[1,0],[-1,1],[0,1],[1,1]]
        var goodRollCount = 0
        var output = 0
        var end = false
        var replaces = [[Int]]()
       
        while !end {
            for i in 0..<length {
                for j in 0..<deapth {
                    if entities[i][j] == "@" {
                        var count = 0
                        for movement in movements {
                            let row = j + movement[0]
                            let column = i + movement[1]
                            if row>=0, column>=0, row<length, column<deapth {
                                if entities[column][row] == "@" {
                                    count += 1
                                }
                            }
                        }
                        
                        if count<4 {
                            replaces.append([i,j])
                            goodRollCount += 1
                        }
                    }
                }
            }

            if goodRollCount == 0 {
                end = true
            } else {
                output += goodRollCount
                goodRollCount = 0
                replaces.forEach({
                    entities[$0[0]][$0[1]] = "x"
                })
            }
        }
        
        return output
    }
}
