//
//  BooksCatalogDetailsViewController.swift
//  BooksCatalogMVC
//
//  Created by Sri Adatrao on 9/23/18.
//  Copyright © 2018 Sri Adatrao. All rights reserved.
//

import UIKit

class BooksCatalogDetailsViewController: UIViewController {
    @IBOutlet weak var imageView: BookCoverImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var shortDescriptionLabel: UILabel!
    @IBOutlet weak var longDescriptionLabel: UILabel!
    var booksCatalog: BooksCatalog?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Book Details"
        showBookDetails()
    }
    
    private func showBookDetails() {
        guard let booksCatalog = booksCatalog else { return }
        
        if let title = booksCatalog.title {
            let titleAttributedText = NSMutableAttributedString(string: "Title: ", attributes: [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 14)])
            titleAttributedText.append(NSAttributedString(string: title, attributes: [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 12)]))
            titleLabel.attributedText = titleAttributedText
            titleLabel.textAlignment = .center
        }
        
        if let shortDescription = booksCatalog.shortDescription {
            let titleAttributedText = NSMutableAttributedString(string: "Short Description: ", attributes: [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 14)])
            titleAttributedText.append(NSAttributedString(string: shortDescription, attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 12)]))
            shortDescriptionLabel.attributedText = titleAttributedText
        }
        
        if let longDescription = booksCatalog.longDescription {
            let titleAttributedText = NSMutableAttributedString(string: "Long Description: ", attributes: [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 14)])
            titleAttributedText.append(NSAttributedString(string: longDescription, attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 12)]))
            longDescriptionLabel.attributedText = titleAttributedText
        }
        
        if let thumbNailUrlString = booksCatalog.thumbnailUrl,
            let url = URL(string: thumbNailUrlString) {
            imageView.fetchImageFrom(url: url)
        }
    }
}
