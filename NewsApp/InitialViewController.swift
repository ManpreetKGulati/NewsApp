//
//  InitialViewController.swift
//  NewsApp
//
//  Created by Manpreet Gulati on 10/12/24.
//

import UIKit

class InitialViewController: UIViewController {
    
    // Title Label
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Times of Canada"
        label.font = .boldSystemFont(ofSize: 40)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .systemRed
        return label
    }()
    
    // Button
    private let newsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("News of the Day", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemRed
        button.layer.cornerRadius = 10
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        button.addTarget(self, action: #selector(didTapNewsButton), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // Add subviews
        view.addSubview(titleLabel)
        view.addSubview(newsButton)
        
        // Enable AutoLayout
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        newsButton.translatesAutoresizingMaskIntoConstraints = false
        
        // Add constraints
        NSLayoutConstraint.activate([
            // Title Label Constraints
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            
            // Button Constraints
            newsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            newsButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50),
            newsButton.widthAnchor.constraint(equalToConstant: 200),
            newsButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc private func didTapNewsButton() {
        // Navigate to ViewController
        let vc = ViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
