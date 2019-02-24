//
//  ViewController.swift
//  BooksCatalogMVC
//
//  Created by Sri Adatrao on 9/17/18.
//  Copyright © 2018 Sri Adatrao. All rights reserved.
//

import UIKit

class BooksCatalogViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    let cellIdentifier = "BooksCatalogCell"
    private var booksCatalogs: [BooksCatalog] = [BooksCatalog]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchBooksCatalogs()
    }
    
    private func setupUI() {
        self.navigationItem.title = "Books Catalog"
    }
    
    private func fetchBooksCatalogs() {
        BookCatalogApiService().fetchBooksCatalogs { [weak self] (apiStatus, booksCatalogs) in
            if apiStatus == ApiStatus.fail {
                return
            } else if let booksCatalogs = booksCatalogs {
                if let weakSelf = self {
                    DispatchQueue.main.async {
                        weakSelf.booksCatalogs = booksCatalogs.booksCatalogs
                        weakSelf.tableView.reloadData()
                    }
                }
            }
        }
    }

    private func showFailAlert() {
        let alertController = UIAlertController(title: "Books Catalog", message: "Sorry, failed to load...", preferredStyle: .alert)
        let retryAction = UIAlertAction(title: "Retry", style: UIAlertActionStyle.default) { (action) in
            self.fetchBooksCatalogs()
        }
        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default) { (action) in
            
        }
        alertController.addAction(retryAction)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    private func showBookDetails(bookCatalog: BooksCatalog) {
        if let detailsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BooksCatalogDetailsViewController") as? BooksCatalogDetailsViewController {
            detailsVC.booksCatalog = bookCatalog
            navigationController?.pushViewController(detailsVC, animated: true)
        }
    }
}

extension BooksCatalogViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return booksCatalogs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? BooksCatalogCell {
            cell.booksCatalog = booksCatalogs[indexPath.row]
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let bookCatalog = booksCatalogs[indexPath.row]
        if let _ = bookCatalog.shortDescription, let _ = bookCatalog.longDescription {
            showBookDetails(bookCatalog: bookCatalog)
        }
    }
}
