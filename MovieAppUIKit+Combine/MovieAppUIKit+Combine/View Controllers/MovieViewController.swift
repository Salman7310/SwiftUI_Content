//
//  MovieViewController.swift
//  MovieAppUIKit+Combine
//
//  Created by Salman_Macbook on 19/06/24.
//

import Foundation
import UIKit
import Combine
import SwiftUI

class MovieViewController: UIViewController {
    
    private let viewModel: MovieListViewModel
    private var cancellables: Set<AnyCancellable> = []
    
    init(viewModel: MovieListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.placeholder = "Search like Batman etc..."
        searchBar.delegate = self
        return searchBar
    }()
    
    lazy var moviesTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupUI()
        
        viewModel.$loadingCompleted
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completed in
                if completed {
                    // reload the tableview
                    self?.moviesTableView.reloadData()
                }
            }.store(in: &cancellables)
    }
    
    private func setupUI() {
        
        view.backgroundColor = .white
        
        // register cells
        moviesTableView.register(UITableViewCell.self, forCellReuseIdentifier: "MovieTableViewCell")
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stackView)
        
        stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
        stackView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        stackView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        stackView.addArrangedSubview(searchBar)
        stackView.addArrangedSubview(moviesTableView)
        
        searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
    }
}

extension MovieViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movie = viewModel.movies[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = movie.title
        cell.contentConfiguration = content
        return cell
    }
    
}

extension MovieViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.setSearchText(searchString: searchText)
    }
}

struct MoviesViewControllerRepresentable: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = MovieViewController
    
    func updateUIViewController(_ uiViewController: MovieViewController, context: Context) {
        
    }
    
    func makeUIViewController(context: Context) -> MovieViewController {
        MovieViewController(viewModel: MovieListViewModel(httpClient: HTTPClient()))
    }
}

#Preview {
    MoviesViewControllerRepresentable()
}
