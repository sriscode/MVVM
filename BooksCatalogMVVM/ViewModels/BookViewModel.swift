//
//  BookViewModel.swift
//  BooksCatalog
//
//  Created by Sri Adatrao on 9/23/18.
//  Copyright © 2018 Sri Adatrao. All rights reserved.
//

import Foundation

class BookViewModel {
    private var bookCatalog: BooksCatalog?
    
    var titleKey: String = "Title: "
    var title: String {
        return bookCatalog?.title ?? ""
    }
    
    var pagesKey = "Pages: "
    var pageCount: String {
        return String(bookCatalog?.pageCount ?? 0)
    }
    
    var thumbnailUrl: String? {
        return bookCatalog?.thumbnailUrl
    }
    
    var authors: String {
        return bookCatalog?.authors?.joined(separator: "\n") ?? "unknown"
    }
    
    var authorsKey: String {
        return (bookCatalog?.authors?.count ?? 0) > 1 ? "Authors: " : "Author: "
    }
    
    var isBookDetailsAvailable: Bool {
        return  bookCatalog?.shortDescription != nil && bookCatalog?.longDescription != nil
    }

    var shortDescription: String {
        return bookCatalog?.shortDescription ?? ""
    }
    
    var longDescription: String {
        return bookCatalog?.longDescription ?? ""
    }

    init(bookCatalog: BooksCatalog) {
        self.bookCatalog = bookCatalog
    }

}
