//
//  BooksCatalogDetailsCoordinator.swift
//  BookCatalogMVVM-C
//
//  Created by Sri Adatrao on 11/20/18.
//  Copyright © 2018 Sri Adatrao. All rights reserved.
//

import Foundation
import  UIKit

class BooksCatalogDetailsCoordinator: BaseCoordinator {
    var booksCatalogDetailsViewModel: BooksCatalogDetailsViewModel?
    
    init(router: Router?, booksCatalogDetailsViewModel: BooksCatalogDetailsViewModel) {
        super.init(router: router)
        self.booksCatalogDetailsViewModel = booksCatalogDetailsViewModel
    }
    
    override func start() {
        super.start()
        if let viewController = self.instantiateViewController() as? BooksCatalogDetailsViewController {
            viewController.viewModel = self.booksCatalogDetailsViewModel
            router?.pushViewController(viewController: viewController)
        }
    }
    
}
