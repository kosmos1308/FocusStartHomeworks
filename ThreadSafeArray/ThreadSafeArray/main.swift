//
//  main.swift
//  ThreadSafeArray
//
//  Created by pavel on 18.11.21.
//

import Foundation

private let queue = DispatchQueue(label: "ThreadSafeArray", attributes: .concurrent)
private let group = DispatchGroup()
private var threadSafeArray = ThreadSafeArray<Int>()

group.enter()
queue.async {
    for number in 0...1000 {
        threadSafeArray.append(number)
    }
    group.leave()
}

group.enter()
queue.async {
    for number in 0...1000 {
        threadSafeArray.append(number)
    }
    group.leave()
}

group.wait()
print("Кол-во элументов в массиве: ", threadSafeArray.count)



