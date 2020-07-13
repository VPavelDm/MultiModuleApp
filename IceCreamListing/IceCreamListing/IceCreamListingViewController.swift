//
//  IceCreamListingViewController.swift
//  IceCreamListing
//
//  Created by Pavel Vaitsikhouski on 7/13/20.
//  Copyright © 2020 vpaveldm. All rights reserved.
//

import UIKit

public protocol IceCreamListingViewControllerDelegate: class {
    func loadIceCreams()
    func openIceCream(_ id: String)
}

public class IceCreamListingViewController: UIViewController {
    // MARK: - Input
    public func iceCreamsLoaded(_ viewModels: [IceCreamListingViewModel]) {
        self.viewModels = viewModels
        tableView.reloadData()
        showContent()
    }
    // MARK: - Outputs
    public weak var delegate: IceCreamListingViewControllerDelegate?
    // MARK: - Properties
    private var viewModels: [IceCreamListingViewModel] = []
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - Lifecycle
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        hideContent()
        delegate?.loadIceCreams()
    }
    
    private func showContent() {
        activityIndicator.stopAnimating()
        UIView.animate(withDuration: 0.5) { [unowned self] in
            self.tableView.alpha = 1
        }
    }
    
    private func hideContent() {
        activityIndicator.startAnimating()
        tableView.alpha = 0
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension IceCreamListingViewController: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModels.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IceCreamCell") as! IceCreamCell
        cell.setupUI(viewModels[indexPath.row])
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.openIceCream(viewModels[indexPath.row].id)
    }
}
