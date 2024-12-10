//
//  ViewController.swift
//  NewsApp
//
//  Created by Manpreet Gulati on 07/12/24.
//


import UIKit
import SafariServices

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private var viewModel = [NewsTableViewCellViewModel]()
    private var articles = [Article]()
    
    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search articles..."
        searchBar.searchBarStyle = .minimal
        searchBar.tintColor = .systemBlue // Cursor and cancel button color
        return searchBar
    }()
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(NewsTableViewCell.self, forCellReuseIdentifier: NewsTableViewCell.identifier)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the title of the screen
        title = "News"
        
        // Add "Bookmarks" button to the navigation bar
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Bookmarks",
            style: .plain,
            target: self,
            action: #selector(openBookmarks)
        )
        
        // Add searchBar and tableView to the view
        view.addSubview(searchBar)
        view.addSubview(tableView)
        
        searchBar.delegate = self // Set the delegate for search functionality
        
        // Set up AutoLayout constraints
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        view.backgroundColor = .systemBackground
        
        // Set tableView delegates
        tableView.dataSource = self
        tableView.delegate = self
        
        // Fetch top stories from the API
        fetchTopStories()
    }
    
    private func fetchTopStories() {
        APICaller.shared.getTopStories { [weak self] result in
            switch result {
            case .success(let articles):
                self?.articles = articles
                self?.viewModel = articles.compactMap { article in
                    NewsTableViewCellViewModel(
                        title: article.title,
                        subTitle: article.description ?? "No description",
                        imageURL: URL(string: article.urlToImage ?? "")
                    )
                }
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    @objc private func openBookmarks() {
        let vc = BookmarksViewController() // Instantiate the BookmarksViewController
        navigationController?.pushViewController(vc, animated: true) // Push it onto the navigation stack
    }
    
    // MARK: - TableView DataSource Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.identifier, for: indexPath) as! NewsTableViewCell
        let viewModel = viewModel[indexPath.row]
        cell.configure(with: viewModel)
        cell.delegate = self // Ensure the delegate is set
        return cell
    }
    
    // Handle row selection
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let article = articles[indexPath.row]
        
        guard let url = URL(string: article.url ?? "") else { return }
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}

// MARK: - NewsTableViewCellDelegate

extension ViewController: NewsTableViewCellDelegate {
    func didTapBookmark(for cell: NewsTableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        let article = articles[indexPath.row]
        
        print("Bookmarking article: \(article.title)") // Debugging
        CoreDataManager.shared.saveBookmark(
            title: article.title,
            subTitle: article.description ?? "No description",
            url: article.url ?? "",
            imageUrl: article.urlToImage
        )
        
        print("Article bookmarked successfully") // Debugging
    }
}

// MARK: - UISearchBarDelegate

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            viewModel = articles.compactMap { article in
                NewsTableViewCellViewModel(
                    title: article.title,
                    subTitle: article.description ?? "No description",
                    imageURL: URL(string: article.urlToImage ?? "")
                )
            }
        } else {
            viewModel = articles.compactMap { article in
                guard article.title.lowercased().contains(searchText.lowercased()) else { return nil }
                return NewsTableViewCellViewModel(
                    title: article.title,
                    subTitle: article.description ?? "No description",
                    imageURL: URL(string: article.urlToImage ?? "")
                )
            }
        }
        tableView.reloadData()
    }
}
