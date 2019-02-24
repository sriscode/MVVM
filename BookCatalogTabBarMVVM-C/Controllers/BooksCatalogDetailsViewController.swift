//
//  BooksCatalogDetailsViewController.swift
//  BooksCatalog
//
//  Created by Sri Adatrao on 9/23/18.
//  Copyright © 2018 Sri Adatrao. All rights reserved.
//

import UIKit

class BooksCatalogDetailsViewController: BaseViewController {
    @IBOutlet weak var imageView: BookCoverImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var shortDescriptionLabel: UILabel!
    @IBOutlet weak var longDescriptionLabel: UILabel!
    
    var viewModel: BooksCatalogDetailsViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = viewModel?.pageTitle ?? ""
        showBookDetails()
    }
    
    private func showBookDetails() {
        guard let viewModel = viewModel else { return }
        
        let titleAttributedText = NSMutableAttributedString(string: viewModel.titleKey, attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 14)])
        titleAttributedText.append(NSAttributedString(string: viewModel.title, attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 12)]))
        titleLabel.attributedText = titleAttributedText
        
        let shortDescAttributedText = NSMutableAttributedString(string: viewModel.shortDescriptionKey, attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 14)])
        shortDescAttributedText.append(NSAttributedString(string: viewModel.shortDescription, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12)]))
        shortDescriptionLabel.attributedText = shortDescAttributedText
        
        let longDescAttributedText = NSMutableAttributedString(string: viewModel.longDescriptionKey, attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 14)])
        longDescAttributedText.append(NSAttributedString(string: viewModel.longDescription, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12)]))
        longDescriptionLabel.attributedText = longDescAttributedText
        
        if let thumbNailUrlString = viewModel.thumbnailUrl,
            let url = URL(string: thumbNailUrlString) {
            imageView.fetchImageFrom(url: url)
        }
    }
}
