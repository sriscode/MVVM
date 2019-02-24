//
//  BooksCatalogCell.swift
//  BooksCatalogMVC
//
//  Created by Sri Adatrao on 9/17/18.
//  Copyright © 2018 Sri Adatrao. All rights reserved.
//

import UIKit

class BooksCatalogCell: UITableViewCell {
  
    @IBOutlet weak var bookCoverImageView: BookCoverImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorsLabel: UILabel!
    @IBOutlet weak var pageCountLabel: UILabel!
    
    var booksCatalog:  BooksCatalog? {
        didSet {
            configureCell()
        }
    }
    
    func configureCell() {
        guard let booksCatalog = self.booksCatalog else { return }
        if let title = booksCatalog.title {
            let titleAttributedText = NSMutableAttributedString(string: "Title: ", attributes: [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 12)])
            titleAttributedText.append(NSAttributedString(string: title, attributes: [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 10)]))
            titleLabel.attributedText = titleAttributedText
        }
        
        if let authors = booksCatalog.authors {
            let authorsAttributedText = NSMutableAttributedString(string: (authors.count > 1 ? "Authors: ": "Author: "), attributes: [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 12)])
            authorsAttributedText.append(NSAttributedString(string: authors.joined(separator: "\n"), attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 10)]))
            authorsLabel.attributedText = authorsAttributedText
        }
        
        if let _ = booksCatalog.shortDescription, let _ = booksCatalog.longDescription {
            accessoryType = .disclosureIndicator
        } else {
            accessoryType = .none
        }
        
        let pageCountAttributedText = NSMutableAttributedString(string: "Pages: ", attributes: [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 12)])
        pageCountAttributedText.append(NSAttributedString(string: String(booksCatalog.pageCount), attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 10)]))
        pageCountLabel.attributedText = pageCountAttributedText
        
        if let thumbNailUrlString = booksCatalog.thumbnailUrl,
            let url = URL(string: thumbNailUrlString) {
            bookCoverImageView.fetchImageFrom(url: url)
        }
    }
}
