//
//  BookCatalogCoordinator.swift
//  BookCatalogMVVM-C
//
//  Created by Sri Adatrao on 11/20/18.
//  Copyright © 2018 Sri Adatrao. All rights reserved.
//

import Foundation
import  UIKit

protocol BookCatalogCoordinateDelegate: class {
    func gotoDetail(detailsViewModel: BooksCatalogDetailsViewModel)
    func loginTapped()
}

class BooksCatalogCoordinator: BaseCoordinator {
    override func start() {
        super.start()
        
        if let viewController = self.instantiateViewController() as? BooksCatalogViewController {
            let viewModel = BooksCatalogViewModel()
            viewModel.bookCatalogCoordinateDelegate = self
            viewController.viewModel = viewModel
            router?.pushViewController(viewController: viewController)
        }
        
    }
}

extension BooksCatalogCoordinator: BookCatalogCoordinateDelegate {
    func gotoDetail(detailsViewModel: BooksCatalogDetailsViewModel) {
        let booksDetailsCoordinator = BooksCatalogDetailsCoordinator(router: router, booksCatalogDetailsViewModel: detailsViewModel)
        booksDetailsCoordinator.start()
    }
    
    func loginTapped() {
        let homeTabCoordinator = HomeTabCoordinator(router: router)
        homeTabCoordinator.start()
    }
}
