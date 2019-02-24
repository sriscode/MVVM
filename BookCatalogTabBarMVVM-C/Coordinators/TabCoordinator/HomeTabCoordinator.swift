//
//  MyAccountTabCoordinator.swift
//  BookCatalogTabBarMVVM-C
//
//  Created by Sri Adatrao on 12/6/18.
//  Copyright © 2018 Sri Adatrao. All rights reserved.
//

import Foundation
import UIKit


class HomeTabCoordinator: BaseCoordinator {
    var tabController: UITabBarController
    var tabs: [AnyTabCoordinator]
    
    override init(router: Router?) {
        tabController = UITabBarController()
        let myAccountCoordinator = MyAccountHomeCoordinator(tabRouter: MyAccountRouter(navigationController: UINavigationController()))
        let myProfileCoordinator = MyProfileHomeCoordinator(tabRouter: MyProfileRouter(navigationController: UINavigationController()))
        tabs = [myAccountCoordinator.specificCoordinator, myProfileCoordinator.specificCoordinator]
        super.init(router: router)
    }

    override func start() {
        super.start()
        tabController.viewControllers = tabs.map { $0.tabRouter.navigationController!}
        router?.pushViewController(viewController: tabController)
        router?.showNavigation(show: false)
    }
}
