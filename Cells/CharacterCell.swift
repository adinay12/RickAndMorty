//
//  CharacterCell.swift
//  RickAndMorty
//
//  Created by Adinay on 17/2/25.
//

import Foundation
import UIKit
import SnapKit

class CharacterCell: UITableViewCell {
    static let identifier = "CharacterCell"
    
    private lazy var avatarImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 30
        return iv
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    
    private lazy var genderLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    private lazy var speciesLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    private lazy var locationLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
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
        contentView.addSubview(avatarImageView)
        let infoStack = UIStackView(arrangedSubviews: [nameLabel, genderLabel, speciesLabel, locationLabel])
        infoStack.axis = .vertical
        infoStack.spacing = 4
        contentView.addSubview(infoStack)
        
        
        avatarImageView.snp.makeConstraints { make in
            make.left.top.equalToSuperview().offset(10)
            make.width.height.equalTo(60)
            make.bottom.lessThanOrEqualToSuperview().offset(-10)
        }
        
        infoStack.snp.makeConstraints { make in
            make.left.equalTo(avatarImageView.snp.right).offset(10)
            make.centerY.equalTo(avatarImageView.snp.centerY)
            make.right.equalToSuperview().offset(-10)
        }
    }
    
    func configure(with character: CharacterModel) {
        nameLabel.text = character.name
        genderLabel.text = "Пол: \(character.gender)"
        speciesLabel.text = "Вид: \(character.species)"
        locationLabel.text = "Локация: \(character.location.name)"
        avatarImageView.loadImage(from: character.image ?? "")
    }
}
