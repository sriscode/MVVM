//
//  MyAccountCoordinator.swift
//  BookCatalogTabBarMVVM-C
//
//  Created by Sri Adatrao on 12/6/18.
//  Copyright © 2018 Sri Adatrao. All rights reserved.
//

import Foundation
import UIKit

class MyAccountHomeCoordinator: TabCoordinator {
    var tabRouter: MyAccountRouter
    var tabBarItem: UITabBarItem = UITabBarItem(title: "MyAccount", image: nil, selectedImage: nil)
    
    init(tabRouter: MyAccountRouter) {
        self.tabRouter = tabRouter
        self.tabRouter.navigationController?.tabBarItem = tabBarItem
        let myAccountCoordinator = MyAccountCoordinator(router: tabRouter)
        myAccountCoordinator.start()
    }
    
    func start() {
        let myAccountCoordinator = MyAccountCoordinator(router: tabRouter)
        myAccountCoordinator.start()
    }
    
}
