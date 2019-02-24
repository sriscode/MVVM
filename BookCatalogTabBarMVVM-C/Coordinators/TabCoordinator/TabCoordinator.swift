//
//  TabCoordinator.swift
//  BookCatalogTabBarMVVM-C
//
//  Created by Sri Adatrao on 12/6/18.
//  Copyright © 2018 Sri Adatrao. All rights reserved.
//

import Foundation
import UIKit

protocol TabCoordinator {
    associatedtype RootType: Router
    var tabRouter: RootType { get }
    var tabBarItem: UITabBarItem { get }
    func start()
}

extension TabCoordinator {
    var specificCoordinator: AnyTabCoordinator {
        return AnyTabCoordinator(tabCoordinator: self)
    }
}

class BaseTabCoordinator {
    
}

class AnyTabCoordinator {
    var tabRouter: Router
    var tabBarItem: UITabBarItem
    
    init<T: TabCoordinator>(tabCoordinator: T) {
        tabRouter = tabCoordinator.tabRouter
        tabBarItem = tabCoordinator.tabBarItem
    }
}

