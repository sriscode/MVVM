//
//  Coordinator.swift
//  BookCatalogMVVM-C
//
//  Created by Sri Adatrao on 11/20/18.
//  Copyright © 2018 Sri Adatrao. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator: class {
    var key: String { get }
    func start()
    func instantiateViewController() -> UIViewController
}

extension Coordinator {
    var key: String {
        return NSStringFromClass(type(of: self))
    }
}
