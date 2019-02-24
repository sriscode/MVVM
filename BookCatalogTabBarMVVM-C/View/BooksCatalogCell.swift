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
    
    static let cellIdentifier = "BooksCatalogCell"
    var bookViewModel: BookViewModel? {
        didSet {
           configureCell()
        }
    }
    
    func configureCell() {
        guard let bookViewModel = self.bookViewModel else { return }
        
        let titleAttributedText = NSMutableAttributedString(string: bookViewModel.titleKey, attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 12)])
        titleAttributedText.append(NSAttributedString(string: bookViewModel.title, attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 10)]))
        titleLabel.attributedText = titleAttributedText
        
        let authorsAttributedText = NSMutableAttributedString(string: bookViewModel.authorsKey, attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 12)])
        authorsAttributedText.append(NSAttributedString(string: bookViewModel.authors, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 10)]))
        authorsLabel.attributedText = authorsAttributedText
        
        accessoryType = bookViewModel.isBookDetailsAvailable ? .disclosureIndicator : .none
        
        let pageCountAttributedText = NSMutableAttributedString(string: bookViewModel.pagesKey, attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 12)])
        pageCountAttributedText.append(NSAttributedString(string: bookViewModel.pageCount, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 10)]))
        pageCountLabel.attributedText = pageCountAttributedText
        
        if let thumbNailUrlString = bookViewModel.thumbnailUrl,
            let url = URL(string: thumbNailUrlString) {
            bookCoverImageView.fetchImageFrom(url: url)
        }
    }
}
