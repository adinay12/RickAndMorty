//
//  BasicMainButton.swift
//  RickAndMorty
//
//  Created by Adinay on 17/2/25.
//

import Foundation
import UIKit
import SnapKit

class BasicMainButton: UIButton {
    
    var action: (() -> Void)?
    
    init(title: String, icon: UIImage? = nil,action: (() -> Void)? = nil) {
        self.action = action
        super.init(frame: .zero)
        setupButton(title: title, icon: icon)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupButton(title: String, icon: UIImage?) {
        setTitle(title, for: .normal)
        setTitleColor(.black, for: .normal)
        backgroundColor = .white
        titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        contentHorizontalAlignment = .left
        layer.cornerRadius = 10
        clipsToBounds = true
        
        if let iconImage = icon {
            setImage(iconImage, for: .normal)
//            setImage(iconImage, for: .highlighted)
            imageView?.tintColor = .orange
            imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 2)
        }
        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        addTarget(self, action: #selector(onTouchDown), for: .touchDown)
        addTarget(self, action: #selector(onTouchUp), for: [.touchUpInside, .touchDragExit])
    }
}

extension BasicMainButton {
    @objc private func buttonTapped() {
        print("Кнопка нажата")
        action?()
    }
    @objc private func onTouchDown() {
        UIView.animate(withDuration: 0.2) {
            self.backgroundColor = UIColor.orange.withAlphaComponent(0.5)
        }
    }
    @objc func onTouchUp() {
        UIView.animate(withDuration: 0.2) {
            self.backgroundColor = .white
        }
    }
}
