//
//  ContentModel.swift
//  chooseCar
//
//  Created by pavel on 10.12.21.
//

import Foundation

protocol IContentModel {
    func getContent() -> Content
}

final class ContentModel: IContentModel {
    func getContent() -> Content {
        let content = Content(navigationBarText: "Выберите", labelText: "Марку машины")
        return content
    }
}
