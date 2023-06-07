//
//  NetworkService.swift
//  NewsApp
//
//  Created by Никита Александров on 07.06.2023.
//

import Foundation
import RealmSwift

class NetworkService {
    static let shared = NetworkService(); private init() { }
    
    private func createURL() -> URL? {
        let server = "https://newsdata.io/api/1/news?apikey="
        let apiKey = "pub_24109a4084e337c84ba82488f7e83771fd1d2"
        let keywords = "&q=apple"
        let language = "&language=en"
        
        let urlStr = server + apiKey + keywords + language
        
        let url = URL(string: urlStr)
        return url
    }
    
    func fetchData(completion: @escaping (Result<NewsFromApi, Error>) -> ()) {
        guard let url = createURL() else {
            completion(.failure(NetworkingError.badUrl))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data else {
                if let error {
                    completion(.failure(error))
                }
                return
            }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            do {
                let usersData = try decoder.decode(NewsFromApi.self, from: data)
                completion(.success(usersData))
            } catch {
                completion(.failure(NetworkingError.invalidData))
            }
        }.resume()
    }
}

enum NetworkingError: Error {
    case badUrl, badRequest, badPesponse, invalidData
}
