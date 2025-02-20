//
//  EpisodesViewController.swift
//  RickAndMorty
//
//  Created by Adinay on 17/2/25.
//

import UIKit
import SnapKit

class EpisodesViewController: UIViewController {
    
    private lazy var searchBar: UISearchBar = {
        let sb = UISearchBar()
        sb.placeholder = "Поиск эпизодов"
        sb.delegate = self
        return sb
    }()
    
    private lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.register(EpisodeCell.self, forCellReuseIdentifier: EpisodeCell.identifier)
        tv.dataSource = self
        return tv
    }()
    
    private let viewModel = EpisodesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Эпизоды"
        setupViews()
        setupConstrains()
        setupBindings()
        viewModel.fetchEpisodes()
    }
    
    private func setupViews() {
        view.addSubview(searchBar)
        view.addSubview(tableView)
    }
    
    private func  setupConstrains() {
        searchBar.snp.makeConstraints { 
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.left.right.equalToSuperview()
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom)
            $0.left.right.bottom.equalToSuperview()
        }
    }
    
    private func setupBindings() {
        viewModel.onDataUpdated = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
}

extension EpisodesViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.searchEpisodes(query: searchText)
    }
}

extension EpisodesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.episodes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EpisodeCell.identifier, for: indexPath) as! EpisodeCell
        let episode = viewModel.episodes[indexPath.row]
        cell.configure(with: episode)
        return cell
    }
}
