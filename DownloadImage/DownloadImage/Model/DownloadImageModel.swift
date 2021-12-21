//
//  DownloadImageModel.swift
//  DownloadImage
//
//  Created by pavel on 20.12.21.
//

import Foundation

//MARK: - Protocol definition
protocol IDownloadImageModel {
    func setImages(url: URL?)
    func getNameImage() -> String
    func getSizeImage() -> String
}

//MARK: - Class definition
final class DownloadImageModel {
    private var nameImage = String()
    private var sizeImage = String()
}

//MARK: - IDownloadImageModel
extension DownloadImageModel: IDownloadImageModel {
    func setImages(url: URL?) {
        guard let url = url else { return }
        guard let data = try? Data(contentsOf: url) else { return }
        
        //size
        let bcf = ByteCountFormatter()
        bcf.allowedUnits = [.useMB]
        bcf.countStyle = .file
        self.sizeImage = bcf.string(fromByteCount: Int64(data.count))
        
        //name
        if let urlString = URL(string: url.absoluteString) {
            let withoutExt = urlString.deletingPathExtension()
            let nameImage = withoutExt.lastPathComponent
            self.nameImage = nameImage
        }
    }
    
    func getNameImage() -> String {
        return self.nameImage
    }
    
    func getSizeImage() -> String {
        return self.sizeImage
    }
}
