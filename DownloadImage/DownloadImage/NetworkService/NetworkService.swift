//
//  NetworkService.swift
//  DownloadImage
//
//  Created by pavel on 21.12.21.
//

import Foundation
import Alamofire

protocol INetworkService {
    func execute(_ url: String, completion: @escaping (String, Data?, Error?) -> Void)
}

class NetworkService {
    
}

extension NetworkService: INetworkService {
    
    func execute(_ url: String, completion: @escaping (String, Data?, Error?) -> Void) {
        //AF.download(url)
        AF.request(url)
            .validate()
            .downloadProgress { progress in
                print("progress.localizedDescription: ", progress.localizedDescription)
                completion(progress.localizedDescription, nil, nil)
            }
        
            .responseData { response in
            if let error = response.error {
                print(error.localizedDescription)
                completion("Error", nil, error)
            } else if let data = response.value {
                print(data)
                completion("", data, nil)
            }
        }
    }
    
}
