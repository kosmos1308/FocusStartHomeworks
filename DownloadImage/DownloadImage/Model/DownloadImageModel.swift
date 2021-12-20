//
//  DownloadImageModel.swift
//  DownloadImage
//
//  Created by pavel on 20.12.21.
//

import Foundation

protocol IDownloadImageModel {
    func setImages(name: String, progressDownload: Float, url: URL?, progressString: String)
    func getImage() -> [Image]
}

final class DownloadImageModel {
    var imagesArray = [Image]()
    
    init() {

    }
}

extension DownloadImageModel: IDownloadImageModel {
    
    func setImages(name: String, progressDownload: Float, url: URL?, progressString: String) {
        self.imagesArray.append(Image(name: name, progressDownload: progressDownload, url: url, progressString: progressString))
    }
    
    func getImage() -> [Image] {
        return self.imagesArray
    }
    
}
