//
//  LocationsViewController.swift
//  RickAndMorty
//
//  Created by Adinay on 17/2/25.
//

import UIKit
import SnapKit

class LocationsViewController: UIViewController {
    
    private lazy var searchBar: UISearchBar = {
        let sb = UISearchBar()
        sb.placeholder = "Поиск локаций"
        sb.delegate = self
        return sb
    }()
    
    private lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.register(LocationCell.self, forCellReuseIdentifier: LocationCell.identifier)
        tv.dataSource = self
        return tv
    }()
    
    private let viewModel = LocationsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Локации"
        setupViews()
        setupConstrains()
        setupBindings()
        viewModel.fetchLocations()
    }
    
    private func setupViews() {
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

extension LocationsViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.searchLocations(query: searchText)
    }
}

extension LocationsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return viewModel.locations.count
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: LocationCell.identifier, for: indexPath) as! LocationCell
            let location = viewModel.locations[indexPath.row]
            cell.configure(with: location)
            return cell
        }
}
