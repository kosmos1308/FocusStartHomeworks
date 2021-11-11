//
//  Body.swift
//  homework_1
//
//  Created by pavel on 3.11.21.
//

import Foundation

enum Body: String, CaseIterable {
    case sedan = "Седан"
    case hatchback = "Хэтчбек"
    case coupe = "Купе"
    
    init?(index: Int) {
        for (indexEnumerated, value) in Self.allCases.enumerated() {
            if indexEnumerated == index {
                self = value
                return
            }
        }

        return nil
    }
    
//    init?(index: Int) {
//        for (indexCases, value) in Self.allCases {
//            if indexCases == index {
//                self = value
//                return
//            }
//        }
//
//        return nil
//    }
}

