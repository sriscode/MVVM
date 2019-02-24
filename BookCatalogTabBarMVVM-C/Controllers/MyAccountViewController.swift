//
//  MyAccountViewController.swift
//  BookCatalogTabBarMVVM-C
//
//  Created by Sri Adatrao on 12/6/18.
//  Copyright © 2018 Sri Adatrao. All rights reserved.
//

import UIKit

class MyAccountViewController: UIViewController {
    lazy var viewModel: MyAccountViewModel = {
        return MyAccountViewModel()
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        viewModel.nextButtonTapped()
    }
}
