//
//  EpisodeCell.swift
//  RickAndMorty
//
//  Created by Adinay on 17/2/25.
//

import UIKit
import SnapKit

class EpisodeCell: UITableViewCell {
    static let identifier = "EpisodeCell"
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var airDateLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var episodeInfoLabel: UILabel = {
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
        let stack = UIStackView(arrangedSubviews: [nameLabel, airDateLabel, episodeInfoLabel])
        stack.axis = .vertical
        stack.spacing = 4
        contentView.addSubview(stack)
        
        stack.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(10)
        }
    }
    
    func configure(with episode: EpisodeModel) {
        nameLabel.text = episode.name
        airDateLabel.text = "Дата выпуска: \(episode.air_date)"
        episodeInfoLabel.text = "Эпизод: \(episode.episode)"
    }
}
