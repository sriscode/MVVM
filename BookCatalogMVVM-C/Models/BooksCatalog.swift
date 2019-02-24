//
//  BooksCatalog.swift
//  BooksCatalogMVC
//
//  Created by Sri Adatrao on 9/17/18.
//  Copyright © 2018 Sri Adatrao. All rights reserved.
//

import Foundation

struct BooksCatalogs: Codable {
    let booksCatalogs: [BooksCatalog]
}

struct BooksCatalog: Codable {
    let isbn: String?
    let title: String?
    let pageCount: Int
    let thumbnailUrl: String?
    let shortDescription: String?
    let longDescription: String?
    let authors: [String]?
    let categories: [String]?
}
