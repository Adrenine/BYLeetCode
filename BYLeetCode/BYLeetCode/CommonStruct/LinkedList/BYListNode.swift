//
//  BYListNode.swift
//  BYLeetCode
//
//  Created by Kystar's Mac Book Pro on 2020/10/23.
//

import Foundation

public class BYListNode<E> where E: Equatable & CustomStringConvertible {
    typealias E = E
    
    public var value: E?
    public var next: BYListNode?
    public convenience init(_ value: E?) {
        self.init(value, next: nil)
    }
    init(_ value: E?, next: BYListNode? = nil) {
        self.value = value
        self.next = next
    }
}

extension BYListNode: CustomStringConvertible {
    public var description: String {
        guard let next = next else { return value?.description ?? "nil" }
        return (value?.description ?? "nil") + " -> " + String(describing: next)
    }
}

public class BYDoubleListNode<E> where E: Equatable {
    typealias E = E
    
    public var value: E
    public var pre: BYDoubleListNode?
    public var next: BYDoubleListNode?
    
    public convenience init(_ value: E) {
        self.init(value, pre:nil, next: nil)
    }
    
    init(_ value: E, pre: BYDoubleListNode?, next: BYDoubleListNode?) {
        self.value = value
        self.pre = pre
        self.next = next
    }
}

extension BYDoubleListNode: CustomStringConvertible {
    public var description: String {
        guard let next = next else { return "\(value)" }
        return "\(value) -> " + String(describing: next)
    }
}
