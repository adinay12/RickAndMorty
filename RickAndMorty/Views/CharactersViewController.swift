//
//  CharactersViewController.swift
//  RickAndMorty
//
//  Created by Adinay on 17/2/25.
//

import UIKit
import SnapKit

class CharactersViewController: UIViewController {
    
    private lazy var searchBar: UISearchBar = {
        let sb = UISearchBar()
        sb.placeholder = "Поиск персонажей"
        sb.delegate = self
        return sb
    }()
    
    private lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.register(CharacterCell.self, forCellReuseIdentifier: CharacterCell.identifier)
        tv.dataSource = self
        return tv
    }()
    
    private let viewModel = CharactersViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Персонажи"
        setupViews()
        setupConstrains()
        setupBindings()
        viewModel.fetchCharacters()
    }
    
    private func  setupViews() {
        view.addSubview(searchBar)
        view.addSubview(tableView)
    }
    
    private func setupConstrains() {
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

extension CharactersViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.searchCharacters(query: searchText)
    }
}

extension CharactersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CharacterCell.identifier, for: indexPath) as! CharacterCell
        let character = viewModel.characters[indexPath.row]
        cell.configure(with: character)
        return cell
    }
}
