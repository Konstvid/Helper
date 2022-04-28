//
//  NetworkService.swift
//  Helper
//
//  Created by Andrey on 18.04.2022.
//

import Foundation

protocol NetworkServiceProtocol {
    func getNews(completion: @escaping NewsCompletion)
    func getWeather()
}

class NetworkService: NetworkServiceProtocol {
    
    func getNews(completion: @escaping NewsCompletion) {
        getRequest(URLString: baseNewsURL + accessKey +  "&countries=ca") { result in
            switch result {
            case .failure(let error):
                completion(.failure(error))
            case .success(let data):
                do {
                    let jsonData = try JSONDecoder().decode(NewsResponse.self, from: data)
                    completion(.success(jsonData.data))
                } catch {
                    completion(.failure(error))
                }
            }
        }
    }
    
    func getWeather() {
        
    }
}

extension NetworkService {
    
    private func getRequest(URLString: String, completion: @escaping ResultCompletion) {
        guard let url = URL(string: URLString) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
            }
            if let data = data {
                completion(.success(data))
            }
        }
        task.resume()
    }
}

