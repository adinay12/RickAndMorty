//
//  ViewController.swift
//  RickAndMorty
//
//  Created by Adinay on 16/2/25.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "The Rick and Morty"
        label.font = UIFont.boldSystemFont(ofSize: 28)
        return label
    }()
    
    private lazy var charactersButton = BasicMainButton(
            title: "Персонажи",
            icon: UIImage(named: "characters")?.resized(to: CGSize(width: 24, height: 24)),
            action: { [weak self] in self?.openCharacters() }
        )

        private lazy var locationsButton = BasicMainButton(
            title: "Локации",
            icon: UIImage(named: "location")?.resized(to: CGSize(width: 24, height: 24)),
            action: { [weak self] in self?.openLocations() }
        )

        private lazy var episodesButton = BasicMainButton(
            title: "Эпизоды",
            icon: UIImage(named: "еpisodes")?.resized(to: CGSize(width: 24, height: 24)),
            action: { [weak self] in self?.openEpisodes() }
        )
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [charactersButton, locationsButton, episodesButton])
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.alignment = .leading
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        setupConstrains()
    }
    
    private func setupViews()  {
        view.addSubview(titleLabel)
        view.addSubview(mainStackView)
    }
    
    private func setupConstrains() {
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.centerX.equalToSuperview()
        }
        
        mainStackView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(30)
            $0.centerX.equalToSuperview()
        }
    }
}

extension ViewController {
    @objc private func openCharacters() {
        let vc = CharactersViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    @objc private func openLocations() {
        let vc = LocationsViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    @objc private func openEpisodes() {
        let vc = EpisodesViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}


