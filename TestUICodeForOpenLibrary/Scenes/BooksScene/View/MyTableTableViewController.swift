//
//  MyTableTableViewController.swift
//  TestUICodeForOpenLibrary
//
//  Created by Pavel Nesterenko on 15.05.23.
//

import UIKit

class MyTableTableViewController: UITableViewController {

    var viewModel: ViewModelImplementation?
    let cellIndentifier = "Cell"

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "CustomTableViewCell")
        tableView.backgroundColor = .black

        viewModel = ViewModelImplementation(self)
        viewModel?.viewDidload()
        viewModel?.didUpdateBooksModel = { books in
            self.tableView.reloadData()
        }

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.openLibraryModel?.editions.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = CustomTableViewCell(style: .default, reuseIdentifier: String(describing: CustomTableViewCell.self))

        guard let array = viewModel?.openLibraryModel?.editions else {
            return UITableViewCell()
        }

        let arrayPicture = array.map({$0.covers[0]})[indexPath.row]
        let arrayTitle = array.map({$0.title})[indexPath.row]
        let arrayPublishDate = array.map({$0.publishDate})[indexPath.row]

        cell.imageViewCell.downloadImage(for:"https://covers.openlibrary.org/b/id/\(arrayPicture)-M.jpg")
        cell.publishDateLabel.text = "Publication date: \(arrayPublishDate)"
        cell.headerLabel.text = "\(arrayTitle)"
        cell.configure(with: cell.headerLabel.text ?? "")
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = ViewControllerFactory.sheard.createInfoViewController()
        navigationController?.pushViewController(viewController, animated: true)
        if let array = viewModel?.openLibraryModel?.editions {
            let workUrl = array.map({$0.works[0]})
            viewController.stringUrl = "https://openlibrary.org\(workUrl.map({$0.key})[indexPath.row]).json"
            viewController.ratingUrl = "https://openlibrary.org\(workUrl.map({$0.key})[indexPath.row])/ratings.json"
        }
        
    }


}
