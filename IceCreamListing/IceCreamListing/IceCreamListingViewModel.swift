//
//  IceCreamViewModel.swift
//  IceCreamListing
//
//  Created by Pavel Vaitsikhouski on 7/13/20.
//  Copyright © 2020 vpaveldm. All rights reserved.
//

import UIKit

public struct IceCreamListingViewModel {
    public let name: String
    public let image: UIImage
    
    public init(name: String, image: UIImage) {
        self.name = name
        self.image = image
    }
}
