//
//  IceCreamDetailViewController.swift
//  IceCreamDetailViewController
//
//  Created by Pavel Vaitsikhouski on 7/13/20.
//  Copyright © 2020 vpaveldm. All rights reserved.
//

import UIKit

public protocol IceCreamDetailViewControllerDelegate: class {
    func loadIceCream(id: String)
}

public class IceCreamDetailViewController: UIViewController {
    // MARK: - Input
    public var id: String?
    public func iceCreamLoaded(_ viewModel: IceCreamDetailViewModel) {
        setupUI(viewModel)
    }
    public func showError(_ error: Error) {
        let alert = UIAlertController(title: "Ошибка",
                                      message: error.localizedDescription,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Понятно", style: .default) { [weak self] _ in
            alert.dismiss(animated: true) {
                if let id = self?.id {
                    self?.delegate?.loadIceCream(id: id)
                }
            }
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    // MARK: - Output
    public weak var delegate: IceCreamDetailViewControllerDelegate?
    // MARK: - Outlets
    @IBOutlet weak var iceCreamImage: UIImageView!
    @IBOutlet weak var iceCreamName: UILabel!
    @IBOutlet weak var buyButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - Actions
    @IBAction func buyButtomIsPressed(_ sender: Any) {
        
    }
    
    // MARK: - Setup UI
    private func setupUI(_ viewModel: IceCreamDetailViewModel) {
        iceCreamName.text = viewModel.name
        iceCreamImage.image = viewModel.image
        showContent()
    }
    
    private func showContent() {
        activityIndicator.stopAnimating()
        UIView.animate(withDuration: 0.5) { [unowned self] in
            self.iceCreamImage.alpha = 1
            self.iceCreamName.alpha = 1
            self.buyButton.alpha = 1
        }
    }
    
    private func hideContent() {
        activityIndicator.startAnimating()
        iceCreamImage.alpha = 0
        iceCreamName.alpha = 0
        buyButton.alpha = 0
    }
    
    // MARK: - Lifecycle
    public override func viewDidLoad() {
        super.viewDidLoad()
        hideContent()
        if let id = id {
            delegate?.loadIceCream(id: id)
        }
    }
}
