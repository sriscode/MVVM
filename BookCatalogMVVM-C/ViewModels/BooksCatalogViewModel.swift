//
//  BooksCatalogViewModel.swift
//  BooksCatalog
//
//  Created by Sri Adatrao on 9/23/18.
//  Copyright © 2018 Sri Adatrao. All rights reserved.
//

import Foundation

class BooksCatalogViewModel: BaseViewModel {
    weak var bookCatalogCoordinateDelegate: BookCatalogCoordinateDelegate?
    private var bookCatalogService: iBookCatalogApiService?
    var pageTitle = "Books Catalog"
    private var booksCatalogs = [BooksCatalog]() {
        didSet {
            self.loadBooksViewModels()
            self.reloadTableViewClosure?()
        }
    }
    var fetchFailed = false {
        didSet {
            if fetchFailed {
                self.showAlert?()
            }
        }
    }
    
    var numberOfBooks: Int {
        return booksCatalogs.count
    }
    
    private var booksViewModels = [BookViewModel]()
    var reloadTableViewClosure: (() -> ())?
    var showAlert: (() -> ())?
    var gotoDetails: ((BooksCatalogDetailsViewModel) -> ())?
    var retryLoad: Bool = false {
        didSet {
            if retryLoad {
               self.fetchBooksCatalogs()
            }
        }
    }
    
    var selectedIndexPathForBookDetails: IndexPath? {
        didSet {
            guard let row =  selectedIndexPathForBookDetails?.row,
            booksViewModels[row].isBookDetailsAvailable else { return }
            self.bookCatalogCoordinateDelegate?.gotoDetail(detailsViewModel: BooksCatalogDetailsViewModel(bookCatalog: booksCatalogs[row]))
        }
    }

    init(bookCatalogService: iBookCatalogApiService = BookCatalogApiService()) {
        self.bookCatalogService = bookCatalogService
    }
    
    func fetchBooksCatalogs() {
        bookCatalogService?.fetchBooksCatalogs(completionHandler: {[weak self] (apiStatus, booksCatalogs) in
            if ApiStatus.fail == apiStatus {
                self?.fetchFailed = true
            } else if let booksCatalogs = booksCatalogs {
                self?.fetchFailed = false
                self?.booksCatalogs = booksCatalogs.booksCatalogs
            }
        })
    }
    // ViewModel for each tableView cell
    private func loadBooksViewModels() {
        booksViewModels = booksCatalogs.map { (bookCatalog) -> BookViewModel in
            BookViewModel(bookCatalog: bookCatalog)
        }
    }
    
    func getBookViewModel( at indexPath: IndexPath ) -> BookViewModel {
        return booksViewModels[indexPath.row]
    }

}
