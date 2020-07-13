//
//  IceCreamListingDI.swift
//  IceCreamListing
//
//  Created by Pavel Vaitsikhouski on 7/13/20.
//  Copyright © 2020 vpaveldm. All rights reserved.
//

import EasyDi

public class IceCreamListingDI: Assembly {
    public var view: IceCreamListingViewController {
        let storyboard = UIStoryboard(name: "IceCreamListingViewController",
                                      bundle: Bundle(for: IceCreamListingDI.self))
        let view = storyboard.instantiateInitialViewController() as! IceCreamListingViewController
        return define(init: view)
    }
}
