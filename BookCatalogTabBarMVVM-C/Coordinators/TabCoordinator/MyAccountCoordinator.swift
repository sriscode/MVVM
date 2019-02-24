//
//  MyAccountCoordinator.swift
//  BookCatalogTabBarMVVM-C
//
//  Created by Sri Adatrao on 12/7/18.
//  Copyright © 2018 Sri Adatrao. All rights reserved.
//

import Foundation
import UIKit

protocol MyAccountCoordinatorDelegate: class {
    func nextButtonTapped()
}

class MyAccountCoordinator: BaseCoordinator {
    
    override func start() {
        super.start()
        
        if let viewController = self.instantiateViewController() as? MyAccountViewController {
            let myAccountViewModel = MyAccountViewModel()
            myAccountViewModel.delegate = self
            viewController.viewModel = myAccountViewModel
            router?.pushViewController(viewController: viewController)
        }
    }
}

extension MyAccountCoordinator:  MyAccountCoordinatorDelegate{
    func nextButtonTapped() {
        let myAccountDetailCoordinator = MyAccountDetailCoordinator(router: router)
        myAccountDetailCoordinator.start()
    }
}
