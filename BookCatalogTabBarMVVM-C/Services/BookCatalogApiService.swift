//
//  BookCatalogApiService.swift
//  BooksCatalogMVC
//
//  Created by Sri Adatrao on 9/17/18.
//  Copyright © 2018 Sri Adatrao. All rights reserved.
//

import Foundation

typealias BooksCatalogCompletionHandler = (ApiStatus, BooksCatalogs?) -> Swift.Void

enum ApiStatus: String {
    case success
    case fail
}

protocol iBookCatalogApiService {
    func fetchBooksCatalogs(completionHandler: BooksCatalogCompletionHandler)
}

class BookCatalogApiService: iBookCatalogApiService {
    func fetchBooksCatalogs(completionHandler: BooksCatalogCompletionHandler) {
        guard let path = Bundle.main.path(forResource: "content", ofType: "json")
            else { return completionHandler(ApiStatus.fail, nil) }
        if let data = try? Data(contentsOf: URL(fileURLWithPath: path)) {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            if let booksCatalogs = try? decoder.decode(BooksCatalogs.self, from: data) {
                completionHandler(ApiStatus.success, booksCatalogs)
            } else {
                completionHandler(ApiStatus.success, nil)
            }
        } else {
            completionHandler(ApiStatus.fail, nil)
        }
    }
}
