//
//  ViewController.swift
//  BooksCatalogMVVM
//
//  Created by Sri Adatrao on 9/23/18.
//  Copyright © 2018 Sri Adatrao. All rights reserved.
//

import UIKit

class BooksCatalogViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    lazy var viewModel: BooksCatalogViewModel = {
        return BooksCatalogViewModel()
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
    private func initialize() {
        navigationItem.title = viewModel.pageTitle
        viewModel.reloadTableViewClosure = { [weak self] () in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        viewModel.showAlert = {[weak self] () in
            DispatchQueue.main.async {
                self?.showAlert()
            }
        }
        
        viewModel.gotoDetails = { [weak self] (detailsViewModel: BookCatalogDetailsViewModel) in
            DispatchQueue.main.async {
                self?.gotoDetails(detailsViewModel)
            }
        }
        
        viewModel.fetchBooksCatalogs()
    }
    
    private func showAlert() {
        let alertController = UIAlertController(title: "Books Catalog", message: "Sorry, failed to load...", preferredStyle: .alert)
        let retryAction = UIAlertAction(title: "Retry", style: UIAlertAction.Style.default) { (action) in
            self.viewModel.retryLoad = true
        }
        let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default) { (action) in
            
        }
        alertController.addAction(retryAction)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    // This is not a preferred way to implement navigation. The other alternative is to let Coordinator take care of navigation which can be implemente in MVVM - C architectural pattern
    private func gotoDetails(_ detailsViewModel: BookCatalogDetailsViewModel) {
        if let bookDetailsViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BooksCatalogDetailsViewController") as? BooksCatalogDetailsViewController {
            bookDetailsViewController.viewModel = detailsViewModel
            self.navigationController?.pushViewController(bookDetailsViewController, animated: true)
        }
    }
}

extension BooksCatalogViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return viewModel.numberOfBooks
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: BooksCatalogCell.cellIdentifier, for: indexPath) as? BooksCatalogCell {
            cell.bookViewModel = viewModel.getBookViewModel(at: indexPath)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.selectedIndexPathForBookDetails = indexPath
    }
}


