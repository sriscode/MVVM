//
//  MyAccountViewModel.swift
//  BookCatalogTabBarMVVM-C
//
//  Created by Sri Adatrao on 12/7/18.
//  Copyright © 2018 Sri Adatrao. All rights reserved.
//

import Foundation

class MyAccountViewModel: BaseViewModel {
    weak var delegate: MyAccountCoordinatorDelegate?
    func nextButtonTapped() {
        delegate?.nextButtonTapped()
    }
}
