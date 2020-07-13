//
//  IceCreamNetworkDI.swift
//  IceCreamNetwork
//
//  Created by Pavel Vaitsikhouski on 7/13/20.
//  Copyright © 2020 vpaveldm. All rights reserved.
//

import EasyDi

public class IceCreamNetworkDI: Assembly {
    public var manager: IceCreamNetworkManagerProtocol {
        define(init: IceCreamNetworkManager())
    }
}
