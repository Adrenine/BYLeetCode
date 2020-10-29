//
//  LeetCode234.swift
//  BYLeetCode
//
//  Created by Kystar's Mac Book Pro on 2020/10/23.
//

import Foundation

//请判断一个链表是否为回文链表。
//
//示例 1:
//
//输入: 1->2
//输出: false
//示例 2:
//
//输入: 1->2->2->1
//输出: true

class LeetCode234 {
    func isPalindrome(_ head: BYListNode<Int>?) -> Bool {
        let array = process(list: head)
        guard array.count > 0 else {
            return true
        }
        var head = 0
        var tail = array.count - 1
        while head < tail {
            if array[head] != array[tail] {
                return false
            }
            head += 1
            tail -= 1
        }
        return true
    }
    
    func process(list head: BYListNode<Int>?) -> [Int] {
        var array : [Int] = []
        var h = head
        while h != nil {
            array.append(h!.value!)
            h = h?.next
        }
        return array
    }
}
