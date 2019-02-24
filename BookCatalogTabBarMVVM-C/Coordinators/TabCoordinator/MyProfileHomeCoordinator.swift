//
//  MyProfileCoordinator.swift
//  BookCatalogTabBarMVVM-C
//
//  Created by Sri Adatrao on 12/6/18.
//  Copyright © 2018 Sri Adatrao. All rights reserved.
//

import Foundation
import UIKit

class MyProfileHomeCoordinator: TabCoordinator {
   var tabRouter: MyProfileRouter
    var tabBarItem: UITabBarItem = UITabBarItem(title: "MyProfile", image: nil, selectedImage: nil)
    
    init(tabRouter: MyProfileRouter) {
        self.tabRouter = tabRouter
        self.tabRouter.navigationController?.tabBarItem = tabBarItem
        let myProfileCoordinator = MyProfileCoordinator(router: tabRouter)
        myProfileCoordinator.start()    
    }
    
    func start() {
        let myProfileCoordinator = MyProfileCoordinator(router: tabRouter)
        myProfileCoordinator.start()        
    }
}
