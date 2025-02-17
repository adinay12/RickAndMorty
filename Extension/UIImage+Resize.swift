//
//  UIImage+Resize.swift
//  RickAndMorty
//
//  Created by Adinay on 17/2/25.
//

import UIKit

extension UIImage {
    func resized(to size: CGSize) -> UIImage? {
            UIGraphicsBeginImageContextWithOptions(size, false, self.scale)
            self.draw(in: CGRect(origin: .zero, size: size))
            let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return resizedImage
        }
}
