//
//  MyAccountDetailViewController.swift
//  BookCatalogTabBarMVVM-C
//
//  Created by Sri Adatrao on 12/7/18.
//  Copyright © 2018 Sri Adatrao. All rights reserved.
//

import UIKit

class MyAccountDetailViewController: UIViewController {
    
    lazy var viewModel: MyAccountDetailViewModel = {
        return MyAccountDetailViewModel()
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
