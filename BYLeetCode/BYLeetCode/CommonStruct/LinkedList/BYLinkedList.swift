//
//  BYLinkedList.swift
//  BYLeetCode
//
//  Created by Kystar's Mac Book Pro on 2020/9/21.
//

import Foundation

protocol BYLinkedListProtocol {
    /// 关联类型
    associatedtype E: Equatable
    /// 描述（快速debug用）
    var description: String { get }

    /// 元素数量
    func count() -> Int
    /// 是否为空
    func isEmpty() -> Bool
    /// 是否包含某个元素
    /// - Parameter element: 某个元素
    func contains(_ element: E?) -> Bool
    /// 获取某个元素的索引
    /// - Parameter element: 元素
    func firstIndexOf(_ element: E?) -> Int?
    /// 获取某个索引的元素
    /// - Parameter index: 索引
    func nodeValue(at index: Int) -> E?
    
    /// 添加元素到最后的位置
    /// - Parameter element: 元素
    func append(element: E?)
    /// 添加某个元素到指定位置
    /// - Parameters:
    ///   - index:   指定位置
    ///   - element: 元素
    func insert(at index: Int, element: E?) -> Bool
    
    /// 设置指定位置的元素
    /// - Parameters:
    ///   - index:   指定位置
    ///   - element: 指定位置上原来的元素
    func set(at index: Int, element: E?) -> E?
    
    /// 清除所有元素
    func removeAll()
    /// 移除指定位置的元素
    /// - Parameter index: 指定位置
    func remove(at index: Int) -> E?

}

public class BYLinkedList<E> where E: Equatable & CustomStringConvertible {
    public var head: BYListNode<E>?
    public var tail: BYListNode<E>?
    private var size: Int = 0
    
    init() {}
}

extension BYLinkedList: BYLinkedListProtocol {
    /// 清除所有元素
    func removeAll() {
        head = nil
        tail = nil
        size = 0
    }
    
    /// 元素数量
    func count() -> Int {
        return size
    }
    
    /// 是否为空
    func isEmpty() -> Bool {
        return head == nil
    }
    
    /// 是否包含某个元素
    /// - Parameter element: 某个元素
    func contains(_ element: E?) -> Bool {
        if let _ = firstIndexOf(element) {
            return true
        }
        return false
    }
    
    /// 添加元素到最后的位置
    /// - Parameter element: 元素
    func append(element: E?) {
        return append(BYListNode(element))
    }
    
    /// 添加某个元素到指定位置
    /// - Parameters:
    ///   - index:   指定位置
    ///   - element: 元素
    @discardableResult
    func insert(at index: Int, element: E?) -> Bool {
        guard index >= 0 && index <= size else {
            return false
        }
        
        if index == 0 {
            add(head: BYListNode(element))
        } else {
            let prevNode = node(at: index - 1)
            prevNode?.next = BYListNode(element, next: prevNode?.next)
            size += 1
        }
        return true
    }
    
    /// 获取指定位置的元素
    /// - Parameter index: 指定位置
    func nodeValue(at index: Int) -> E? {
        return node(at: index)?.value
    }
    
    /// 设置指定位置的元素
    /// - Parameters:
    ///   - index:   指定位置
    ///   - element: 指定位置上原来的元素
    @discardableResult
    func set(at index: Int, element: E?) -> E? {
        let originNode = node(at: index)
        let originElement = originNode?.value
        originNode?.value = element
        return originElement
    }
    
    /// 移除指定位置的元素
    /// - Parameter index: 指定位置
    @discardableResult
    func remove(at index: Int) -> E? {
        guard index >= 0 && index < size else {
            return nil
        }
        var node = head
        
        if index == 0 {
            head = head?.next
        } else {
            let prevNode = self.node(at: index - 1)
            node = prevNode?.next
            prevNode?.next = node?.next
        }
        size -= 1
        
        return node?.value
    }
    
    /// 获取某个元素的索引
    /// - Parameter element: 索引
    func firstIndexOf(_ element: E?) -> Int? {
        var node = head
        for i in 0..<size {
            if element == node?.value {
                return i
            }
            node = node?.next
        }
        return nil
    }
}

extension BYLinkedList {
    // MARK: - ---- Search
    func node(at index: Int) -> BYListNode<E>? {
        guard index >= 0 && index < size else {
            return nil
        }
        
        var node = head
        
        (0..<index).forEach { _ in
            node = node?.next
        }
        
        return node
    }
    
    // MARK: - ---- Add
    @discardableResult
    func insert(element : E, after node: BYListNode<E>) -> BYListNode<E> {
        self.insert(BYListNode(element), after: node)
    }
    
    @discardableResult
    func insert(_ node: BYListNode<E>, after preNode: BYListNode<E>) -> BYListNode<E> {
        guard tail !== preNode else {
            append(node)
            return tail!
        }
        node.next = preNode.next
        preNode.next = node
        size += 1
        return preNode.next!
    }
    
    func append(_ node: BYListNode<E>) {
        return add(tail: node)
    }
    
    func add(head: BYListNode<E>) {
        head.next = self.head
        self.head = head
        size += 1
        if self.tail == nil {
            self.tail = head
        }
    }
    
    func add(tail: BYListNode<E>?) {
        
        self.tail?.next = tail
        self.tail = tail
        
        if tail != nil {
            size += 1
        }
        
        if self.head == nil {
            self.head = tail
        }
    }
    
    // MARK: - ---- Delete
    @discardableResult
    func removeFirst() -> BYListNode<E>?{
        
        guard head != nil else {
            return nil
        }
        size -= 1
        head = head?.next
        if isEmpty() {
            tail = nil
        }
        
        return head
    }
    
    @discardableResult
    func removeLast() -> BYListNode<E>? {
        guard let head = head else { return nil }
        guard head.next != nil else { return removeFirst() }
        var prev = head
        var current = head
        while let next = current.next {
            prev = current
            current = next
        }
        prev.next = nil
        tail = prev
        size -= 1
        return current
    }
    
    @discardableResult
    func remove(after node: BYListNode<E>) -> BYListNode<E>? {
        defer {
            if node.next === tail {
                tail = node
            }
            node.next = node.next?.next
            size -= 1
        }
        return node.next
    }
}

extension BYLinkedList: Collection {
    public struct Index: Comparable {
        public var node: BYListNode<E>?
        
        static public func == (lhs: Index, rhs: Index) -> Bool {
            switch (lhs.node, rhs.node) {
            case let (left?, right?):
                return left.next === right.next
            case (nil, nil):
                return true
            default:
                return false
            }
        }
        
        static public func < (lhs: Index, rhs: Index) -> Bool {
            guard lhs != rhs else {
                return false
            }
            let nodes = sequence(first: lhs.node) {$0?.next}
            return nodes.contains{$0 === rhs.node}
        }
    }
    
    public var startIndex: Index {
        return Index(node: head)
    }
    
    public var endIndex: Index {
        return Index(node: tail?.next)
    }
    
    public func index(after i: Index) -> Index {
        return Index(node: i.node?.next)
    }
    
    public subscript(position: Index) -> E? {
        return position.node!.value
    }
}

extension BYLinkedList: CustomStringConvertible {
    public var description: String {
        guard let head = head else {
            return ""
        }
        return String(describing: head)
    }
}
