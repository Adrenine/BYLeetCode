//
//  BYArrayStack.swift
//  BYLeetCode
//
//  Created by Kystar's Mac Book Pro on 2020/10/24.
//

import Foundation

public struct BYArrayStack<T>: BYStackProtocol {
    private var array: [T] = []
    public init() {}
    public var isEmpty: Bool {
        return array.isEmpty
    }
    public var peek: T? {
        return array.last
    }
    
    @discardableResult
    public mutating func push(_ element: T) -> Bool {
        array.append(element)
        return true
    }
    
    @discardableResult
    public mutating func pop() -> T? {
        return isEmpty ? nil : array.removeLast()
    }

}

extension BYArrayStack: ExpressibleByArrayLiteral {
    public init(arrayLiteral elements: Element...) {
        array = elements
    }
}

extension BYArrayStack: CustomStringConvertible {
    public var description: String {
        return "Top -> " + array
            .map {"\($0)"}
            .reversed()
            .joined(separator: " -> ")
    }
}

extension BYArrayStack {
    var count: Int {
      return array.count
    }
}
