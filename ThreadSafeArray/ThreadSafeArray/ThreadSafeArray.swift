//
//  ThreadSafeArray.swift
//  ThreadSafeArray
//
//  Created by pavel on 18.11.21.
//

import Foundation

public class ThreadSafeArray<T> {
    private let queue = DispatchQueue(label: "ThreadSafeArray", attributes: .concurrent)
    private var array: [T] = [T]()
    
    public var isEmpty: Bool {
        var result = false
        queue.sync {
            result = self.array.isEmpty
        }
        return result
    }
    
    public var count: Int {
        var count = 0
        queue.sync {
            count = array.count
        }
        return count
    }
    
    public func append(_ item: T) {
        queue.async(flags: .barrier) {
            self.array.append(item)
        }
    }
    
    public func remove(at index: Int) {
        queue.async(flags: .barrier) {
            if index < self.array.count && index >= 0 {
                self.array.remove(at: index)
            }
        }
    }
    
    public subscript(index: Int) -> T {
        get {
            queue.sync {
                return array[index]
            }
        }
    }
}

public extension ThreadSafeArray where T: Equatable {
    func contains(_ element: T) -> Bool {
        var result: Bool = false
        queue.sync {
            result = array.contains(element)
        }
        return result
    }
}

