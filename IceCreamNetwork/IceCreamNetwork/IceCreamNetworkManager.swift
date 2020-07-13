//
//  IceCreamNetworkManager.swift
//  IceCreamNetwork
//
//  Created by Pavel Vaitsikhouski on 7/13/20.
//  Copyright © 2020 vpaveldm. All rights reserved.
//

import UIKit

public protocol IceCreamNetworkManagerProtocol {
    func loadIceCreams(completion: @escaping (Result<[IceCreamTO], IceCreamLoadingError>) -> Void)
    func loadIceCream(by id: String, completion: @escaping (Result<IceCreamTO, IceCreamLoadingError>) -> Void)
}

class IceCreamNetworkManager: IceCreamNetworkManagerProtocol {
    
    func loadIceCreams(completion: @escaping (Result<[IceCreamTO], IceCreamLoadingError>) -> Void) {
        DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + .seconds(2)) { [iceCreams] in
            DispatchQueue.main.async {
                completion(.success(iceCreams))
            }
        }
    }
    
    func loadIceCream(by id: String, completion: @escaping (Result<IceCreamTO, IceCreamLoadingError>) -> Void) {
        DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + .seconds(2)) { [iceCreams] in
            DispatchQueue.main.async {
                if let iceCream = iceCreams.first(where: { $0.id == id }) {
                    completion(.success(iceCream))
                }
            }
        }
    }
    
    
}

extension IceCreamNetworkManager {
    var iceCreams: [IceCreamTO] {
        let bundle = Bundle(identifier: "com.vpaveldm.icecream.IceCreamApp")
        let iceCream = IceCreamTO(id: "1",
                                  name: "Вкусное мороженое",
                                  image: UIImage(named: "icecream",
                                                 in: bundle,
                                                 with: .none)!)
        let iceCream2 = IceCreamTO(id: "2",
                                   name: "Мороженое в стаканчике",
                                   image: UIImage(named: "icecream1",
                                                  in: bundle,
                                                  with: .none)!)
        let iceCream3 = IceCreamTO(id: "3",
                                   name: "Мороженое с лимоном",
                                   image: UIImage(named: "icecream2",
                                                  in: bundle,
                                                  with: .none)!)
        let iceCream4 = IceCreamTO(id: "4",
                                   name: "Трипл мороженое",
                                   image: UIImage(named: "icecream3",
                                                  in: bundle,
                                                  with: .none)!)
        let iceCream5 = IceCreamTO(id: "5",
                                   name: "Шоколадное мороженое",
                                   image: UIImage(named: "icecream4",
                                                  in: bundle,
                                                  with: .none)!)
        let iceCream6 = IceCreamTO(id: "6",
                                   name: "Ванильное мороженое",
                                   image: UIImage(named: "icecream5",
                                                  in: bundle,
                                                  with: .none)!)
        return [iceCream, iceCream2, iceCream3, iceCream4, iceCream5, iceCream6]
        
    }
}
