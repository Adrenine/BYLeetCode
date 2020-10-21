//
//  LeetCode1002.swift
//  AlgorithmSwift
//
//  Created by Kystar's Mac Book Pro on 2020/10/15.
//

import Foundation

//给定仅有小写字母组成的字符串数组 A，返回列表中的每个字符串中都显示的全部字符（包括重复字符）组成的列表。例如，如果一个字符在每个字符串中出现 3 次，但不是 4 次，则需要在最终答案中包含该字符 3 次。
//
//你可以按任意顺序返回答案。
//
//
//
//示例 1：
//
//输入：["bella","label","roller"]
//输出：["e","l","l"]
//示例 2：
//
//输入：["cool","lock","cook"]
//输出：["c","o"]
//
//
//提示：
//
//1 <= A.length <= 100
//1 <= A[i].length <= 100
//A[i][j] 是小写字母


class LeetCode1002 {
    public func commonChars(_ A :[String]) -> [String] {
        var res : [Character: Int] = ["a":Int.max,"b":Int.max,"c":Int.max,"d":Int.max,"e":Int.max,"f":Int.max,"g":Int.max,"h":Int.max,"i":Int.max,"j":Int.max,"k":Int.max,"l":Int.max,"m":Int.max,"n":Int.max,"o":Int.max,"p":Int.max,"q":Int.max,"r":Int.max,"s":Int.max,"t":Int.max,"u":Int.max,"v":Int.max,"w":Int.max,"x":Int.max,"y":Int.max,"z":Int.max]
        let first : [Character: Int] = ["a":0,"b":0,"c":0,"d":0,"e":0,"f":0,"g":0,"h":0,"i":0,"j":0,"k":0,"l":0,"m":0,"n":0,"o":0,"p":0,"q":0,"r":0,"s":0,"t":0,"u":0,"v":0,"w":0,"x":0,"y":0,"z":0]
        for str in A {
            var temp = first
            for i in 0..<str.count {
                let pos = str.index(str.startIndex, offsetBy: i)
                let ch = str[pos]
                temp[ch]! += 1
            }
            
            for key in res.keys {
                res[key]! = min(res[key]!, temp[key]!)
            }
        }
        
        var result : [String] = []
        for key in res.keys {
            let c = res[key]!
            if c != Int.max {
                for _ in 0..<c {
                    result.append(String(key))
                }
            }
        }
        return result
    }
    
    public func commonChars1(_ A :[String]) -> [String] {
        var res = Array.init(repeating: Int.max, count: 26)
        for str in A {
            var freq = Array.init(repeating: 0, count: 26)
            for i in 0..<str.count {
                let pos = str.index(str.startIndex, offsetBy: i)
                let ch = str[pos]
                let str = String(ch)
                var code = 0
                // 字符串转ASCII码
                for c in str.unicodeScalars {
                    code = Int(c.value);
                }
                freq[code - 97] += 1
            }
            for i in 0..<26 {
                res[i] = min(res[i], freq[i])
            }
        }
        var result : [String] = []
        for i in 0..<26 {
            let c = res[i]
            if c != Int.max {
                let ch:Character = Character(UnicodeScalar(i+97)!)
                for _ in 0..<c {
                    result.append(String(ch))
                }
            }
        }
        return result
    }
    
    func test() {
        print(commonChars(["bella","label","roller"]))  //["e","l","l"]
        print(commonChars1(["bella","label","roller"]))  //["e","l","l"]
        print(commonChars(["cool","lock","cook"]))  //["c","o"]
        print(commonChars1(["bella","label","roller"]))  //["c","o"]
    }
}
