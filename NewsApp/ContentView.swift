//
//  ContentView.swift
//  NewsApp
//
//  Created by Никита Александров on 06.06.2023.
//

import SwiftUI
import RealmSwift

struct ContentView: View {
    
    @State var news: [NewsFromApi.Results]?
    @ObservedResults(NewsRealm.self, sortDescriptor: .init(keyPath: "id", ascending: false)) var newsFetched
    @State var flag = false
    
    var body: some View {
        NavigationStack {
            if flag {
                List(newsFetched) { item in
                    NavigationLink(item.title ?? "Title") {
                        DetailView(title: item.title, link: item.link, content: item.content, pubDate: item.pubDate)
                            .navigationTitle(item.title ?? "title")
                            
                    }
                    .navigationTitle("News")
                }
            } else {
                ProgressView()
            }
            
            
        }
        .refreshable {
            NetworkService.shared.fetchData { result in
                switch result {
                case .success(let newsData):
                    let news = newsData.results
                    self.news = news
                    
                    let realm = try! Realm()
                    try! realm.write {
                        realm.deleteAll()
                    }
                    saveData(news: news)
                    
                case .failure(let failure):
                    print(failure.localizedDescription)
                }
            }
        }
        
        
        
        .onAppear {
            NetworkService.shared.fetchData { result in
                switch result {
                case .success(let newsData):
                    let news = newsData.results
                    self.news = news
                case .failure(let failure):
                    print(failure.localizedDescription)
                }
            }
            
            //print(Realm.Configuration.defaultConfiguration.fileURL)
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                let realm = try! Realm()
                if realm.isEmpty {
                    saveData(news: news)
                }
                flag.toggle()
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

func saveData(news: [NewsFromApi.Results]?) {
    let realm = try! Realm()

    for i in 0..<(news?.count ?? 0) {
        try! realm.write ({
            let newsRLM = NewsRealm()
            newsRLM.id = UUID()
            newsRLM.title = news?[i].title
            newsRLM.link = news?[i].link
            newsRLM.content = news?[i].content
            newsRLM.pubDate = news?[i].pubDate
            newsRLM.language = news?[i].language
            realm.add(newsRLM)
        })
    }
}
