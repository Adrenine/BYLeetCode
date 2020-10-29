//
//  LeetCode1207.swift
//  BYLeetCode
//
//  Created by Kystar's Mac Book Pro on 2020/10/28.
//

import Foundation

class LeetCode1207 {
    func uniqueOccurrences(_ arr: [Int]) -> Bool {
        guard arr.count > 0 else {
            return true
        }
        var map : [Int: Int] = [:]
        for num in arr {
            if let a = map[num]  {
                map[num] = a + 1
            } else {
                map[num] = 1
            }
        }
        var values = Set<Int>()
        for v in map.values {
            values.insert(v)
        }
        return map.count == values.count
    }
}
