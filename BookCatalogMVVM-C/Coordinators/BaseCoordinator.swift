//
//  BaseCoordinator.swift
//  BookCatalogMVVM-C
//
//  Created by Sri Adatrao on 11/20/18.
//  Copyright © 2018 Sri Adatrao. All rights reserved.
//

import Foundation
import UIKit

class BaseCoordinator: Coordinator {
    
    var router: Router?
    var coordinators = [String: Coordinator]()
    var storyBoard = UIStoryboard(name: "Main", bundle: nil)
    var viewControllerId: String {
        let className = NSStringFromClass(type(of: self))
        return className.replacingOccurrences(of: "Coordinator", with: "ViewController").replacingOccurrences(of: "BookCatalogMVVM_C.", with: "")
    }
    
    init(router: Router?) {
        self.router = router
        coordinators[key] = self
    }
    
    func start() {
        
    }
    
    func instantiateViewController() -> UIViewController {
        return storyBoard.instantiateViewController(withIdentifier: viewControllerId)
    }
    
    func removeCoordinator() {
        coordinators[key] = nil
    }
    
}
