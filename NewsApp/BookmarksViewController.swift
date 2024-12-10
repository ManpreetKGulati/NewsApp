//
//  BookmarksViewController.swift
//  NewsApp
//
//  Created by Manpreet Gulati on 07/12/24.
//

import UIKit
import SafariServices 

class BookmarksViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    private var bookmarks: [Bookmark] = []
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Bookmarks"
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.frame = view.bounds
        fetchBookmarks()
    }
    
    private func fetchBookmarks() {
        bookmarks = CoreDataManager.shared.fetchBookmarks()
        print("Fetched \(bookmarks.count) bookmarks") // Debugging
        for bookmark in bookmarks {
            print("Bookmark: \(bookmark.title ?? "No title")") // Debugging
        }
        tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookmarks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let bookmark = bookmarks[indexPath.row]
        cell.textLabel?.text = bookmark.title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let url = URL(string: bookmarks[indexPath.row].url ?? "") else { return }
        let safariVC = SFSafariViewController(url: url)
        present(safariVC, animated: true)
    }
}
