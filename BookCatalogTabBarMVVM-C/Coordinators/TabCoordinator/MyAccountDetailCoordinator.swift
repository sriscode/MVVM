//
//  MyAccountDetailCoordinator.swift
//  BookCatalogTabBarMVVM-C
//
//  Created by Sri Adatrao on 12/7/18.
//  Copyright © 2018 Sri Adatrao. All rights reserved.
//

import Foundation
import UIKit

class MyAccountDetailCoordinator: BaseCoordinator {
    
    override func start() {
        super.start()
        
        if let viewController = self.instantiateViewController() as? MyAccountDetailViewController {
            viewController.viewModel = MyAccountDetailViewModel()
            router?.pushViewController(viewController: viewController)
        }
    }
}
