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
    var iceCreamDetail: IceCreamDetailDI? {
        didSet {
            iceCreamDetail?.delegate = self
        }
    }
    lazy var iceCreamListingView: IceCreamListingViewController = {
        let view = IceCreamListingDI.instance().view
        view.delegate = self
        return view
    }()
    
    lazy var iceCreamNetwork: IceCreamNetworkManagerProtocol = {
        IceCreamNetworkDI.instance().manager
    }()
    
    @IBAction func clickMeIsPressed(_ sender: Any) {
        navigationController?.pushViewController(iceCreamListingView, animated: true)
    }
}
