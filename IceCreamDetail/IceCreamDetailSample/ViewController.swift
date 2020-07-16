//
//  ViewController.swift
//  IceCreamDetailSample
//
//  Created by Pavel Vaitsikhouski on 7/15/20.
//  Copyright © 2020 vpaveldm. All rights reserved.
//

import UIKit
import IceCreamDetail

class ViewController: UIViewController {
    
    let assembly = IceCreamDetailDI.instance()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func clickMeIsPressed(_ sender: Any) {
        assembly.id = "1"
        assembly.delegate = self
        let view = assembly.view
        navigationController?.pushViewController(view, animated: true)
    }

    
}

extension ViewController: IceCreamDetailViewControllerDelegate {
    func loadIceCream(id: String) {
        DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + .seconds(1)) { [weak self] in
            DispatchQueue.main.async {
                self?.assembly.iceCreamLoaded(.init(name: "IceCream",
                                                    image: UIImage(systemName: "plus")!))
            }
        }
    }
}

