//
//  Services.swift
//  buggsyK
//
//  Created by Felipe Montoya on 2/10/22.
//

import Foundation

enum ImageService {
    static func downloadImage(_ completion: @escaping (Result<Data,Error>) -> () )  {
        let url = URL(
            string: "https://upload.wikimedia.org/wikipedia/en/2/27/Face_of_Praying_Mantis.jpg")!
        URLSession.shared
            .dataTask(
                with: URLRequest(url: url)) { data, response, error in
                guard error == nil else {
                    return completion(.failure(error!))
                }
                completion(.success(data ?? Data()))
            }
            .resume()
        
    }
}

enum APIError: Error {
    case noDataAvailable
    case some(Error)
}

enum APIClient {
    static func downloadUsers(_ completion: @escaping (Result<[User],APIError>) -> () )  {
        let url = URL(
            string: "https://jsonplaceholder.typicode.com/users")!
        URLSession.shared
            .dataTask(
                with: URLRequest(url: url)) { data, response, error in
                guard error == nil else {
                    return completion(.failure(.some(error!)))
                    
                }
                guard let data = data, let users = try? JSONDecoder()
                        .decode([User].self, from: data) else {
                            return completion(.failure(.noDataAvailable))
                }
                    
                completion(.success(users))
            }
            .resume()
        
    }
}
