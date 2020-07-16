//
//  ViewController+IceCreamListing.swift
//  IceCreamApp
//
//  Created by Pavel Vaitsikhouski on 7/13/20.
//  Copyright © 2020 vpaveldm. All rights reserved.
//

import IceCreamListing
import IceCreamDetail

extension ViewController: IceCreamListingViewControllerDelegate {
    func openIceCream(_ id: String) {
        iceCreamDetail = IceCreamDetailDI.instance()
        iceCreamDetail?.id = id
        navigationController?.pushViewController(iceCreamDetail!.view, animated: true)
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
