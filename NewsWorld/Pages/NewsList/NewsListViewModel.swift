//
//  NewsListViewModel.swift
//  NewsWorld
//
//  Created by Nikolaj Nielsen on 09/03/2021.
//

import Combine
import CombineDataSources
import Foundation

class NewsListViewModel {

    private var articles = [Article]()
    
    private var subscriptions = [AnyCancellable]()
    var articlesSubject = PassthroughSubject<[Article], Never>()
    
    private var currentSearchTerm: String? = nil
    private var page = 1
    private var containsMorePages = true
    private var fetchInProgress = false
    
    func fetchAllNews(for searchTerm: String, page: Int = 1) {
        guard !self.fetchInProgress else {
            return
        }
        
        if searchTerm != self.currentSearchTerm {
            self.containsMorePages = true
        }
        
        self.page = page
        self.currentSearchTerm = searchTerm
        self.fetchInProgress = true
        
        if page == 1 {
            self.articles = []
        }
        
        NewsAPI.getEverything(searchTerm: searchTerm, page: page)
            .sink(receiveCompletion: { _ in
                self.fetchInProgress = false
                
            }, receiveValue: { result in
                if let articles = result.articles {
                    self.articles.append(contentsOf: articles)
                    self.articlesSubject.send(self.articles)
                } else if result.code == "maximumResultsReached"{
                    self.containsMorePages = false
                }
                
            }).store(in: &self.subscriptions)
    }
    
    func fetchNextPage() {
        guard let currentSearchTerm = self.currentSearchTerm, !self.fetchInProgress, self.containsMorePages else {
            return
        }
        
        self.fetchAllNews(for: currentSearchTerm, page: self.page + 1)
    }
    
    func clearArticles() {
        self.articlesSubject.send([])
    }
}
