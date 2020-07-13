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
import IceCreamNetwork

class ViewController: UIViewController {
    private var iceCreamDetailView: IceCreamDetailViewController? {
        didSet {
            iceCreamDetailView?.delegate = self
        }
    }
    
    private lazy var iceCreamListingView: IceCreamListingViewController = {
        let view = IceCreamListingDI.instance().view
        view.delegate = self
        return view
    }()
    
    private lazy var iceCreamNetwork: IceCreamNetworkManagerProtocol = {
        IceCreamNetworkDI.instance().manager
    }()
    
    @IBAction func clickMeIsPressed(_ sender: Any) {
        navigationController?.pushViewController(iceCreamListingView, animated: true)
    }
}

extension ViewController: IceCreamDetailViewControllerDelegate {
    func loadIceCream(id: String) {
        iceCreamNetwork.loadIceCream(by: id) { [weak self] result in
            switch result {
            case .success(let iceCream):
                let viewModel = IceCreamDetailViewModel(name: iceCream.name,
                                                        image: iceCream.image)
                self?.iceCreamDetailView?.iceCreamLoaded(viewModel)
            default:
                print("Print error")
                break
            }
        }
    }
}

extension ViewController: IceCreamListingViewControllerDelegate {
    func openIceCream(_ id: String) {
        iceCreamDetailView = IceCreamDetailDI.instance().view
        iceCreamDetailView?.id = id
        navigationController?.pushViewController(iceCreamDetailView!, animated: true)
    }
    
    func loadIceCreams() {
        iceCreamNetwork.loadIceCreams { [weak self] result in
            switch result {
            case .success(let iceCreams):
                let viewModels = iceCreams.map({ iceCream in
                    IceCreamListingViewModel(id: iceCream.id,
                                             name: iceCream.name,
                                             image: iceCream.image)
                })
                self?.iceCreamListingView.iceCreamsLoaded(viewModels)
            default:
                print("Print error")
                break
            }
        }
    }
}
