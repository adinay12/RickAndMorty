//
//  UIImageView+Extensions.swift
//  RickAndMorty
//
//  Created by Adinay on 17/2/25.
//

import UIKit
import Alamofire

extension UIImageView {
    func loadImage(from url: String) {
        AF.request(url).responseData { response in
            if let data = response.data {
                DispatchQueue.main.async {
                    self.image = UIImage(data: data)
                }
            }
        }
    }
}
