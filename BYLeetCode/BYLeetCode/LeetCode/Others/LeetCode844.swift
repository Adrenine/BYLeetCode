//
//  LeetCode844.swift
//  AlgorithmSwift
//
//  Created by Kystar's Mac Book Pro on 2020/10/19.
//

import Foundation
//给定 S 和 T 两个字符串，当它们分别被输入到空白的文本编辑器后，判断二者是否相等，并返回结果。 # 代表退格字符。
//
//注意：如果对空文本输入退格字符，文本继续为空。
//
//
//
//示例 1：
//
//输入：S = "ab#c", T = "ad#c"
//输出：true
//解释：S 和 T 都会变成 “ac”。
//示例 2：
//
//输入：S = "ab##", T = "c#d#"
//输出：true
//解释：S 和 T 都会变成 “”。
//示例 3：
//
//输入：S = "a##c", T = "#a#c"
//输出：true
//解释：S 和 T 都会变成 “c”。
//示例 4：
//
//输入：S = "a#c", T = "b"
//输出：false
//解释：S 会变成 “c”，但 T 仍然是 “b”。
//
//
//提示：
//
//1 <= S.length <= 200
//1 <= T.length <= 200
//S 和 T 只含有小写字母以及字符 '#'。

class LeetCode844 {
    func backspaceCompare(_ S: String, _ T: String) -> Bool {
        let s = process(string: S)
        let t = process(string: T)

        return s == t
    }
    
    func process(string: String) -> String {
        let array : [Character] = string.map{$0}
        var res : [Character] = []
        for i in 0..<array.count {
            switch array[i] {
            case "#":
                if !res.isEmpty {
                    res.removeLast()
                }
                
            default:
                res.append(array[i])
            }
        }
        
        return String(res)
    }
    
    func test() {
        print(backspaceCompare("ab##","c#d#"))  //true
        print(backspaceCompare("a##c","#a#c"))  //true
        print(backspaceCompare("a#c","b"))  //false
    }
}
