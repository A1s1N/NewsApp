//
//  NewsFromApi.swift
//  NewsApp
//
//  Created by Никита Александров on 07.06.2023.
//

import Foundation

struct NewsFromApi: Decodable {
    var totalResults: Int
    var results: [Results]
    
    struct Results: Decodable {
        var title: String?
        var link: String?
        var description: String?
        var content: String?
        var pubDate: String?
        var language: String?
    }
}
