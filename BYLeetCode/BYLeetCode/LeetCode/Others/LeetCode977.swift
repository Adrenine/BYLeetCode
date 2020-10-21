//
//  LeetCode977.swift
//  AlgorithmSwift
//
//  Created by Kystar's Mac Book Pro on 2020/10/19.
//

import Foundation
//给定一个按非递减顺序排序的整数数组 A，返回每个数字的平方组成的新数组，要求也按非递减顺序排序。
//
//
//
//示例 1：
//
//输入：[-4,-1,0,3,10]
//输出：[0,1,9,16,100]
//示例 2：
//
//输入：[-7,-3,2,3,11]
//输出：[4,9,9,49,121]
//
//
//提示：
//
//1 <= A.length <= 10000
//-10000 <= A[i] <= 10000
//A 已按非递减顺序排序。

class LeetCode977 {
    func sortedSquares(_ A: [Int]) -> [Int] {
        guard A.count > 0 else {
            return []
        }
        var j = A.count - 1
        var i = 0
        var array : [Int] = []
        while i <= j {
            let l = A[i] * A[i]
            let r = A[j] * A[j]
            if l > r {
                array.insert(l, at: 0)
                i += 1
            } else {
                array.insert(r, at: 0)
                j -= 1
            }
        }
        return array
    }
    
    func test() {
        print(sortedSquares([-4,-1,0,3,10]))    //[0,1,9,16,100]
        print(sortedSquares([-7,-3,2,3,11]))    //[4,9,9,49,121]
    }
}
