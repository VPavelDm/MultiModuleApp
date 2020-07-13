//
//  IceCreamDetailDI.swift
//  IceCreamDetail
//
//  Created by Pavel Vaitsikhouski on 7/13/20.
//  Copyright © 2020 vpaveldm. All rights reserved.
//

import EasyDi

public class IceCreamDetailDI: Assembly {
    public var view: IceCreamDetailViewController {
        let storyboard = UIStoryboard(name: "IceCreamDetailViewController",
                                      bundle: Bundle(for: IceCreamDetailDI.self))
        let view = storyboard.instantiateInitialViewController() as! IceCreamDetailViewController
        return define(init: view)
    }
}
