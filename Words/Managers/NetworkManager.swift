//
//  NetworkManager.swift
//  Words
//
//  Created by Muslim on 27.09.2020.
//  Copyright © 2020 Emil Ismayilov. All rights reserved.
//

import Foundation
import Alamofire

class NetworkManager {
    
    static let shared = NetworkManager()
    private init() {}
    
    private let baseURL = "https://dictionary.skyeng.ru/api/public/v1/"
    
    func search(with text: String, completion: @escaping (Swift.Result<[SearchResponseElement], Error>) -> Void) {
        let url = baseURL + "words/search?search=\(text)"
        
        AF.request(url, method: .get, encoding: JSONEncoding.default).responseJSON { (response) in
            
            print("search RESPONSE:", response)
            
            DispatchQueue.main.async {
                switch response.result {
                case .failure(let error):
                    print("\(#function) Error: \(error)")
                    completion(.failure(error))
                case .success:
                    do {
                        let data = try JSONDecoder().decode([SearchResponseElement].self, from: response.data!)
                        completion(.success(data))
                    } catch(let decoderError) {
                        print("\(#function) Error decoding response:\nError: \(decoderError)")
                        completion(.failure(decoderError))
                    }
                }
            }
        }
    }
    
}
