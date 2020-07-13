//
//  IceCreamCell.swift
//  IceCreamListing
//
//  Created by Pavel Vaitsikhouski on 7/13/20.
//  Copyright © 2020 vpaveldm. All rights reserved.
//

import UIKit

class IceCreamCell: UITableViewCell {
    // MARK: - Outlets
    @IBOutlet weak var iceCreamImage: UIImageView!
    @IBOutlet weak var iceCreamName: UILabel!
    
    // MARK: - Setup UI
    func setupUI(_ viewModel: IceCreamListingViewModel) {
        iceCreamImage.image = viewModel.image
        iceCreamName.text = viewModel.name
    }
}
