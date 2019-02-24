//
//  Router.swift
//  BookCatalogMVVM-C
//
//  Created by Sri Adatrao on 11/27/18.
//  Copyright © 2018 Sri Adatrao. All rights reserved.
//

import Foundation
import UIKit

class Router {
    var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func pushViewController(viewController: UIViewController) {
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func popViewController(viewController:UIViewController) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func showNavigation(show: Bool) {
        self.navigationController?.isNavigationBarHidden = !show
    }
}
