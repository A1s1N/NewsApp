//
//  NewsData.swift
//  NewsApp
//
//  Created by Никита Александров on 06.06.2023.
//

import Foundation

struct NewsResults: Decodable {
    let totalResults: Int
    let results: [Result]
    
    struct Result: Decodable {
        var title: String?
        var link: String?
        var keywords: [String?]
        var creator: [String?]
        var video_url: String?
        var description: String?
        var full_description: String?
        var image_url: String?
        var pubDate: String?
        var content: String?
    }
}
