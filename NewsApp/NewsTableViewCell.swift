//
//  NewsTableViewCell.swift
//  NewsApp
//
//  Created by Manpreet Gulati on 07/12/24.
//

import UIKit

class NewsTableViewCellViewModel {
    let title:String
    let subTitle:String
    let imageURL:URL?
    var imageData:Data? = nil
    
    init(title: String, subTitle: String, imageURL: URL?) {
        self.title = title
        self.subTitle = subTitle
        self.imageURL = imageURL

    }
    
}
protocol NewsTableViewCellDelegate: AnyObject {
    func didTapBookmark(for cell: NewsTableViewCell)
}

class NewsTableViewCell: UITableViewCell {
    
    static let identifier = "NewsTableViewCell"
    
    weak var delegate: NewsTableViewCellDelegate? // Delegate for bookmark action
    
    private let newsTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22, weight: .medium)
        label.numberOfLines = 2
        return label
    }()

    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .light)
        label.numberOfLines = 2
        return label
    }()

    private let newsImage: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .secondarySystemBackground
        return imageView
    }()
    
    private let bookmarkIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "bookmark") // Use "bookmark.fill" for filled version
        imageView.tintColor = .systemBlue
        imageView.isUserInteractionEnabled = true
        return imageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(newsTitleLabel)
        contentView.addSubview(subTitleLabel)
        contentView.addSubview(newsImage)
        contentView.addSubview(bookmarkIcon)
        
        // Enable AutoLayout
        newsTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        newsImage.translatesAutoresizingMaskIntoConstraints = false
        bookmarkIcon.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            // News Image
            newsImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            newsImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            newsImage.widthAnchor.constraint(equalToConstant: 120),
            newsImage.heightAnchor.constraint(equalToConstant: 90),
            
            // News Title
            newsTitleLabel.leadingAnchor.constraint(equalTo: newsImage.trailingAnchor, constant: 10),
            newsTitleLabel.trailingAnchor.constraint(equalTo: bookmarkIcon.leadingAnchor, constant: -10),
            newsTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            
            // Subtitle
            subTitleLabel.leadingAnchor.constraint(equalTo: newsImage.trailingAnchor, constant: 10),
            subTitleLabel.trailingAnchor.constraint(equalTo: bookmarkIcon.leadingAnchor, constant: -10),
            subTitleLabel.topAnchor.constraint(equalTo: newsTitleLabel.bottomAnchor, constant: 5),
            
            // Bookmark Icon
            bookmarkIcon.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            bookmarkIcon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            bookmarkIcon.widthAnchor.constraint(equalToConstant: 24),
            bookmarkIcon.heightAnchor.constraint(equalToConstant: 24),
        ])
        
        // Add Tap Gesture for Bookmark Icon
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapBookmark))
        bookmarkIcon.addGestureRecognizer(tapGesture)
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    @objc private func didTapBookmark() {
        delegate?.didTapBookmark(for: self)
    }

    func configure(with viewModel: NewsTableViewCellViewModel) {
        newsTitleLabel.text = viewModel.title
        subTitleLabel.text = viewModel.subTitle
        
        if let imageUrl = viewModel.imageURL {
            URLSession.shared.dataTask(with: imageUrl) { [weak self] data, _, _ in
                guard let data = data else { return }
                DispatchQueue.main.async {
                    self?.newsImage.image = UIImage(data: data)
                }
            }.resume()
        }
    }
}
