//
//  LocationCell.swift
//  RickAndMorty
//
//  Created by Adinay on 17/2/25.
//

import UIKit
import SnapKit

class LocationCell: UITableViewCell {
    static let identifier = "LocationCell"
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var typeLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var dimensionLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        let stack = UIStackView(arrangedSubviews: [nameLabel, typeLabel, dimensionLabel])
        stack.axis = .vertical
        stack.spacing = 4
        contentView.addSubview(stack)
        
        stack.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(10)
        }
    }
    
    func configure(with location: LocationModel) {
        nameLabel.text = location.name
        typeLabel.text = "Тип: \(location.type)"
        dimensionLabel.text = "Измерение: \(location.dimension)"
    }
}
