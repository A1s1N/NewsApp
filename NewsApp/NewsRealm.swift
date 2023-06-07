//
//  NewsRealm.swift
//  NewsApp
//
//  Created by Никита Александров on 07.06.2023.
//

import Foundation
import RealmSwift

class NewsRealm: Object, Identifiable {
    @Persisted var id: UUID
    @Persisted var title: String?
    @Persisted var link: String?
    @Persisted var content: String?
    @Persisted var pubDate: String?
    @Persisted var language: String?
}
