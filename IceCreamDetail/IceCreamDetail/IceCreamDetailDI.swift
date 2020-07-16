//
//  IceCreamDetailDI.swift
//  IceCreamDetail
//
//  Created by Pavel Vaitsikhouski on 7/13/20.
//  Copyright © 2020 vpaveldm. All rights reserved.
//

import EasyDi

public class IceCreamDetailDI: Assembly {
    // MARK: - Input
    public var id: String? {
        didSet {
            _view.id = id
        }
    }
    public func iceCreamLoaded(_ viewModel: IceCreamDetailViewModel) {
        _view.iceCreamLoaded(viewModel)
    }
    public func showError(_ error: Error) {
        _view.showError(error)
    }
    // MARK: - Output
    public var view: UIViewController {
        _view
    }
    public var delegate: IceCreamDetailViewControllerDelegate? {
        didSet {
            _view.delegate = delegate
        }
    }
    // MARK: - Properties
    lazy var _view: IceCreamDetailViewController = {
        let storyboard = UIStoryboard(name: "IceCreamDetailViewController",
                                      bundle: Bundle(for: IceCreamDetailDI.self))
        let view = storyboard.instantiateInitialViewController() as! IceCreamDetailViewController
        return define(init: view)
    }()

}
