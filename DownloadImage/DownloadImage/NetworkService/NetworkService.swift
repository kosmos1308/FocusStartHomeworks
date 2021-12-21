//
//  NetworkService.swift
//  DownloadImage
//
//  Created by pavel on 21.12.21.
//

import Foundation
import Alamofire

protocol INetworkService {
    func execute(_ url: String, completion: @escaping (Progress, Data?, Error?) -> Void)
}

class NetworkService: INetworkService {
    func execute(_ url: String, completion: @escaping (Progress, Data?, Error?) -> Void) {
        AF.download(url)
            .validate()
            .downloadProgress { progress in
                let progress = progress
                completion(progress, nil, nil)
            }
        
            .responseData { response in
            if let error = response.error {
                print(error.localizedDescription)
                completion(Progress(totalUnitCount: 0), nil, error)
            } else if let data = response.value {
                completion(Progress(totalUnitCount: 0), data, nil)
            }
        }
    }
}
