//
//  ViewModel.swift
//  TestUICodeForOpenLibrary
//
//  Created by Pavel Nesterenko on 19.05.23.
//

import Foundation

protocol ViewModel {

    var openLibraryModel: OpenLibraryModel? { get set }

    var didUpdateBooksModel: ((OpenLibraryModel) -> Void)? { get set }

    func viewDidload()
}
