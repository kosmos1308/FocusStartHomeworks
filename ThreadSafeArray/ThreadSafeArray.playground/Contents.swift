import UIKit
import Foundation
import PlaygroundSupport

class ThreadSafeArray<T> {
    let queue = DispatchQueue(label: "ThreadSafeArray", attributes: .concurrent)
    var array: [T] = [T]()
    
    var isEmpty: Bool {
        var result: Bool
        if array.isEmpty {
            result = true
            print("Массив пустой")
        } else {
            result = false
            print("Массив НЕ пустой")
        }
        return result
    }
    
    var count: Int {
        print("Кол-во элументов в массиве: ", array.count)
        return array.count
    }
    
    func append(_ item: T) {
        queue.async(flags: .barrier) {
            self.array.append(item)
        }
    }
    
    func remove(at index: Int) {
        queue.async(flags: .barrier) {
            if index > self.array.count {
                print("В массиве нет такого индекса")
            } else {
                self.array.remove(at: index)
                print("Вы удалили элемент по индексу \(index)")
            }
        }
    }
    
    subscript(index: Int) -> T {
        get {
            queue.sync {
                print("По индексу \(index) находится элемент \(array[index])")
                return array[index]
            }
        }
    }
}


extension ThreadSafeArray where T: Equatable {
    func contains(_ element: T) -> Bool {
        var result: Bool
        result = array.contains(element)
        
        if result == false {
            print("В массиве нет такого элемента")
        } else {
            print("В массиве есть такой элемент")
        }
        
        return result
    }
}

let queue = DispatchQueue(label: "ThreadSafeArray", attributes: .concurrent)
let group = DispatchGroup()
var threadSafeArray = ThreadSafeArray<Int>()

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

threadSafeArray.count
print()
threadSafeArray.isEmpty
print()
threadSafeArray.contains(10)
print()
threadSafeArray[200]




