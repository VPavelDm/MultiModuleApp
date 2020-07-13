//
//  ViewController.swift
//  IceCreamApp
//
//  Created by Pavel Vaitsikhouski on 7/13/20.
//  Copyright © 2020 vpaveldm. All rights reserved.
//

import UIKit
import IceCreamListing
import IceCreamDetail

class ViewController: UIViewController {
    private lazy var iceCreamDetailView: IceCreamDetailViewController = {
        let view = IceCreamDetailDI.instance().view
        view.delegate = self
        return view
    }()
    
    private lazy var iceCreamListingView: IceCreamListingViewController = {
        let view = IceCreamListingDI.instance().view
        view.delegate = self
        return view
    }()
    
    @IBAction func clickMeIsPressed(_ sender: Any) {
        navigationController?.pushViewController(iceCreamListingView, animated: true)
    }
}

extension ViewController: IceCreamDetailViewControllerDelegate {
    func loadIceCream(id: String) {
    }
}

extension ViewController: IceCreamListingViewControllerDelegate {
    func openIceCream(at index: Int) {
        navigationController?.pushViewController(iceCreamDetailView, animated: true)
    }
    
    func loadIceCreams() {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) { [weak self] in
            let viewModel1 = IceCreamListingViewModel(name: "Вкусное мороженое",
                                                      image: UIImage(named: "icecream")!)
            let viewModel2 = IceCreamListingViewModel(name: "Мороженое в стаканчике",
                                                      image: UIImage(named: "icecream1")!)
            let viewModel3 = IceCreamListingViewModel(name: "Мороженое с лимоном",
                                                      image: UIImage(named: "icecream2")!)
            let viewModel4 = IceCreamListingViewModel(name: "Трипл мороженое",
                                                      image: UIImage(named: "icecream3")!)
            let viewModel5 = IceCreamListingViewModel(name: "Шоколадное мороженое",
                                                      image: UIImage(named: "icecream4")!)
            let viewModel6 = IceCreamListingViewModel(name: "Ванильное мороженое",
                                                      image: UIImage(named: "icecream5")!)
            
            self?.iceCreamListingView.iceCreamsLoaded([viewModel1,
                                                 viewModel2,
                                                 viewModel3,
                                                 viewModel4,
                                                 viewModel5, viewModel6])
        }
    }
}
