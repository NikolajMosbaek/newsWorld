//
//  NewsListViewController.swift
//  NewsWorld
//
//  Created by Nikolaj Nielsen on 09/03/2021.
//

import Combine
import CombineDataSources
import UIKit

class NewsListViewController: UIViewController, UITableViewDelegate, UISearchBarDelegate {

    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    private let viewModel = NewsListViewModel()
    private var subscriptions = [AnyCancellable]()
    
    private var page = 1
    private var searchTerm = ""
        
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = Strings.news_list_title
        
        self.navigationItem.titleView = self.searchBar
        self.searchBar.placeholder = Strings.news_list_search_placeholder
        self.searchBar.delegate = self
        
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 80
        self.tableView.tableFooterView = UIView()
        self.tableView.register(UINib(nibName: NewsCell.identifier, bundle: nil), forCellReuseIdentifier: NewsCell.identifier)
        self.tableView.delegate = self
        
        self.viewModel.articlesSubject.bind(subscriber: self.tableView.rowsSubscriber(cellIdentifier: NewsCell.identifier, cellType: NewsCell.self, cellConfig: { cell, indexPath, article in
            cell.setup(article: article)
        })).store(in: &self.subscriptions)
    }
            
    // MARK: - TableView delegate
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row > tableView.numberOfRows(inSection: indexPath.section) - 3 {
            self.viewModel.fetchNextPage()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if let cell = tableView.cellForRow(at: indexPath) as? NewsCell,
           let article = cell.article {
            NewsPageViewController.push(from: self, article: article)
        }
    }
    
    // MARK: - SearchBar delegate
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.viewModel.fetchAllNews(for: searchBar.text ?? "")
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            self.viewModel.clearArticles()
        }
    }
}

