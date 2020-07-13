//
//  ViewController+IceCreamDetail.swift
//  IceCreamApp
//
//  Created by Pavel Vaitsikhouski on 7/13/20.
//  Copyright © 2020 vpaveldm. All rights reserved.
//

import IceCreamDetail

extension ViewController: IceCreamDetailViewControllerDelegate {
    func loadIceCream(id: String) {
        iceCreamNetwork.loadIceCream(by: id) { [weak self] result in
            switch result {
            case .success(let iceCream):
                let viewModel = IceCreamDetailViewModel(name: iceCream.name,
                                                        image: iceCream.image)
                self?.iceCreamDetailView?.iceCreamLoaded(viewModel)
            case .failure(let error):
                self?.iceCreamDetailView?.showError(error)
            }
        }
    }
}

