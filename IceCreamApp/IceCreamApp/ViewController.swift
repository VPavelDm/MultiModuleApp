//
//  ViewController.swift
//  IceCreamApp
//
//  Created by Pavel Vaitsikhouski on 7/13/20.
//  Copyright © 2020 vpaveldm. All rights reserved.
//

import UIKit
import IceCreamDetail

class ViewController: UIViewController {
    private var iceCreamView: IceCreamDetailViewController!
    
    @IBAction func clickMeIsPressed(_ sender: Any) {
        let assembly = IceCreamDetailDI.instance()
        iceCreamView = assembly.view
        iceCreamView.id = "123"
        iceCreamView.delegate = self
        navigationController?.pushViewController(iceCreamView, animated: true)
    }
}

extension ViewController: IceCreamDetailViewControllerDelegate {
    func loadIceCream(id: String) {
        DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + .seconds(2)) { [weak self] in
            DispatchQueue.main.async {
                let viewModel = IceCreamViewModel(name: "Морожено",
                                                  image: UIImage(named: "icecream")!)
                self?.iceCreamView.iceCreamLoaded(viewModel)
            }
        }
    }
}
