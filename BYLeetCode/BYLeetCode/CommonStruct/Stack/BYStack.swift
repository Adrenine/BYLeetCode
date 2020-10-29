//
//  BYStack.swift
//  BYLeetCode
//
//  Created by Kystar's Mac Book Pro on 2020/9/21.
//

import Foundation

public protocol BYStackProtocol {
    associatedtype Element
    mutating func push(_ element: Element) -> Bool
    mutating func pop() -> Element?
    var isEmpty: Bool {get}
    var peek: Element? {get}
}


