//
//  InfoViewController.swift
//  TestUICodeForOpenLibrary
//
//  Created by Pavel Nesterenko on 19.05.23.
//

import UIKit

class BookInfoViewController: UIViewController {
    let headerLabel = UILabel()
    let descriptionLabel = UILabel()
    let ratingLabel = UILabel()
    let imageViewBook = UIImageView()
    let contentView = UIView()
    let activityIndicatorView = UIActivityIndicatorView(style: .medium)
    let starsStackView = UIStackView()
    let scrollView = UIScrollView()
    

    var viewModel: BookInfoImplementation?
    var stringUrl: String?
    var ratingUrl: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGray2
        setupUI()
        activityIndicator()
        
        viewModel = BookInfoImplementation(self)
        viewModel?.viewDidload(stringUrl ?? "")
        viewModel?.raitingBook(ratingUrl ?? "")

        viewModel?.didUpdateBooksModel = { [weak self] books in
            guard let self = self else { return }
            self.headerLabel.text = "\(books.title)"
            self.descriptionLabel.text = books.description
            let picture = books.covers[0]
            self.imageViewBook.downloadImage(for: "https://covers.openlibrary.org/b/id/\(picture)-M.jpg")
            self.activityIndicatorView.stopAnimating()
        }
        
        viewModel?.didUpdateRaitingBook = { [weak self] book in
            guard let self = self else { return }
            if let sum = book.summary.average {
                self.ratingStars(sum)
                self.ratingLabel.text = " \(String(format: "%.1f", sum))"
            }
        }
    }

    func setupUI() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)

        headerLabel.font = UIFont.boldSystemFont(ofSize: 20)
        headerLabel.text = "Header"
        headerLabel.translatesAutoresizingMaskIntoConstraints = false

        descriptionLabel.font = UIFont.systemFont(ofSize: 20)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false

        imageViewBook.image = UIImage(systemName: "book.fill")
        imageViewBook.contentMode = .scaleAspectFit
        imageViewBook.layer.cornerRadius = 12
        imageViewBook.clipsToBounds = true
        imageViewBook.translatesAutoresizingMaskIntoConstraints = false

        ratingLabel.font = UIFont.systemFont(ofSize: 18)
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        scrollView.addSubview(headerLabel)
        scrollView.addSubview(descriptionLabel)
        scrollView.addSubview(imageViewBook)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            headerLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            headerLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 20),
            
            imageViewBook.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 10),
            imageViewBook.leadingAnchor.constraint(equalTo:scrollView.readableContentGuide.leadingAnchor),
            imageViewBook.trailingAnchor.constraint(equalTo:scrollView.readableContentGuide.trailingAnchor),
            imageViewBook.widthAnchor.constraint(equalToConstant: 130),
            imageViewBook.heightAnchor.constraint(equalToConstant: 180),
            
            descriptionLabel.topAnchor.constraint(equalTo: imageViewBook.bottomAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo:view.leadingAnchor,constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo:view.trailingAnchor, constant: -16)
        ])
    }
    
    func activityIndicator() {
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        activityIndicatorView.startAnimating()
        view.addSubview(activityIndicatorView)

        NSLayoutConstraint.activate([
            activityIndicatorView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicatorView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    func ratingStars(_ averageRating: Float?) {
        let filledStars = Int(averageRating?.rounded() ?? 0)
        let totalStars = 5
        starsStackView.axis = .horizontal
        starsStackView.spacing = 4
        starsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.addSubview(starsStackView)
        scrollView.addSubview(ratingLabel)
        
        starsStackView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10).isActive = true
        starsStackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        starsStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        
        ratingLabel.leadingAnchor.constraint(equalTo: starsStackView.trailingAnchor, constant: 5).isActive = true
        ratingLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10).isActive = true
        
        if filledStars == 5 {

            for _ in 1...filledStars {
                let filledStarImageView = UIImageView(image: UIImage(systemName: "star.fill"))
                filledStarImageView.tintColor = .systemYellow
                starsStackView.addArrangedSubview(filledStarImageView)
            }
    
        } else {
            
            for _ in 1...filledStars {
                let filledStarImageView = UIImageView(image: UIImage(systemName: "star.fill"))
                filledStarImageView.tintColor = .systemYellow
                starsStackView.addArrangedSubview(filledStarImageView)
            }
            
            for _ in filledStars+1...totalStars {
                let emptyStarImageView = UIImageView(image: UIImage(systemName: "star"))
                emptyStarImageView.tintColor = .systemYellow
                starsStackView.addArrangedSubview(emptyStarImageView)
            }
        }
    }

    
}
