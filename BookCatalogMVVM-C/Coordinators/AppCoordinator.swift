//
//  AppCoordinator.swift
//  BookCatalogMVVM-C
//
//  Created by Sri Adatrao on 11/20/18.
//  Copyright © 2018 Sri Adatrao. All rights reserved.
//

import Foundation
import UIKit

class AppCoordinator: BaseCoordinator {
    var window: UIWindow!
    
    init(window: UIWindow) {
        self.window = window
        let navigationController = UINavigationController()
        window.rootViewController = navigationController
        let router = Router(navigationController: navigationController)
        super.init(router: router)
    }
    
    override func start() {
        let bookCatalogCoordinator = BooksCatalogCoordinator(router: self.router)
        bookCatalogCoordinator.start()
    }
}
