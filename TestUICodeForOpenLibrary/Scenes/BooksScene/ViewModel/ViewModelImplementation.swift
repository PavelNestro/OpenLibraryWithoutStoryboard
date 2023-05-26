//
//  ViewModelImplementation.swift
//  TestUICodeForOpenLibrary
//
//  Created by Pavel Nesterenko on 19.05.23.
//

import Foundation

import UIKit

class ViewModelImplementation: ViewModel {
    
    var openLibraryModel: OpenLibraryModel? {
        didSet {
            if let openLibraryModel = openLibraryModel {
                DispatchQueue.main.async {
                    self.didUpdateBooksModel?(openLibraryModel)
                }
            }
        }
    }
    

    var didUpdateBooksModel: ((OpenLibraryModel) -> Void)?
    
    weak var viewController: MyTableTableViewController?

    func viewDidload() {
        let url = "https://openlibrary.org/people/angeliki39/lists/OL151774L/Books_I_want_to_read/export?format=json"
                    guard let url = URL(string: url) else {
                        print("invalid url")
                        return
                    }
                    let request = URLRequest(url: url)
                    let task = URLSession.shared.dataTask(with: request) { data, _, error in
                        if let error = error {
                            print(error.localizedDescription)
                        }
                        guard let data = data else {
                            print("no data in response")
                            return
                        }
                        
                        do {
                             let books = try JSONDecoder().decode(OpenLibraryModel.self, from: data)
                                DispatchQueue.main.async {
                                    self.openLibraryModel = books
                                }
                            let theList = books.editions.map({$0.title})
                            print(theList)
                        } catch {
                            print(error.localizedDescription)
                        }
                    }
                    task.resume()
    }
 

    init(_ viewController: MyTableTableViewController) {
        self.viewController = viewController
    }

    
    
}
