//
//  IceCreamTO.swift
//  IceCreamNetwork
//
//  Created by Pavel Vaitsikhouski on 7/13/20.
//  Copyright © 2020 vpaveldm. All rights reserved.
//

import UIKit

public struct IceCreamTO {
    public let id: String
    public let name: String
    public let image: UIImage
    
    public init(id: String, name: String, image: UIImage) {
        self.id = id
        self.name = name
        self.image = image
    }
}
