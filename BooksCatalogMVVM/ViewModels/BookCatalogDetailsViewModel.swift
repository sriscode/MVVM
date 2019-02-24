//
//  BookCatalogDetailsViewModel.swift
//  BooksCatalog
//
//  Created by Sri Adatrao on 9/24/18.
//  Copyright © 2018 Sri Adatrao. All rights reserved.
//

import Foundation

class BookCatalogDetailsViewModel: BookViewModel {
    var pageTitle = "Book Details"
    var shortDescriptionKey: String = "Short Description: "
    var longDescriptionKey: String = "Long Description: "
    
    override init(bookCatalog: BooksCatalog) {
        super.init(bookCatalog: bookCatalog)
    }
}
