//
//  ViewController.swift
//  MovieDB
//
//  Created by Vicent de Freitas on 7/21/19.
//  Copyright © 2019 Vicent De Freitas. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class MovieDBListVC: UIViewController, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UITabBarDelegate {
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var moviesSelectionTabBar: UITabBar!
    @IBOutlet weak var movieListCollectionView: UICollectionView!
    @IBOutlet weak var moviesTabBar: UITabBar!
    
    var presenter: MovieDBListPresenter?
    private var movies: MovieList = MovieList()
    private var disposeBag = DisposeBag()
    private var searchType: SearchType = .popular
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
        searchTextField.text = ""
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        rxBind()
    }
    
    private func rxBind() {
        getMovies(with: .popular)
        
        searchTextField.rx.controlEvent([.editingChanged])
            .subscribe(onNext: { [weak self] _ in
                guard let self = self,
                     let query = self.searchTextField.text else { return }
                if query.count >= 3 {
                    self.getSearchedMovies(by: query)
                }
            }).disposed(by: disposeBag)
    }
    
    
    private func getMovies(with type: SearchType) {
        
        presenter?.getMovies(with: type)
            .debug()
            .subscribe(onNext: { [weak self] movies in
                self?.movies = movies
                self?.movieListCollectionView.reloadData()
            }).disposed(by: disposeBag)
    }
    
    private func setUI() {
        
        moviesTabBar.selectedItem = moviesTabBar.items?[0]
        moviesTabBar.delegate = self
        movieListCollectionView.delegate = self
        movieListCollectionView.dataSource = self
        movieListCollectionView.showsVerticalScrollIndicator = false
        movieListCollectionView.showsHorizontalScrollIndicator = false
        movieListCollectionView.register(UINib(nibName: "MovieDBListCell", bundle: nil), forCellWithReuseIdentifier:"MovieDBListCell")
        
        searchTextField.placeholder = "Search for a movie: "
        searchTextField.autocorrectionType = .no
        searchTextField.clearButtonMode = .whileEditing
        searchTextField.returnKeyType = .search
    }
    
    private func getSearchedMovies(by query: String) {
          presenter?.getMovies(by: query)
            .subscribe(onNext: { [weak self] movies in
                self?.movies = movies
                self?.movieListCollectionView.reloadData()
            }).disposed(by: disposeBag)
    }
    
    // Delegates
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        switch item {
        case moviesTabBar.items?[0]:
            getMovies(with: .popular)
        case moviesTabBar.items?[1]:
            getMovies(with: .topRated)
        case moviesTabBar.items?[2]:
            getMovies(with: .upcoming)
        default:
            return
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.list?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieDBListCell", for: indexPath) as? MovieDBListCell else {
            return UICollectionViewCell()
        }
        cell.setCell(with: movies.list?[indexPath.row] ?? Movie())
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.contentSize.width, height: 150)
        
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 5.0, left: 0, bottom:5.0 , right:0)
    }
    

    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie = movies.list?[indexPath.row]
        presenter?.showMovieDetail (with: movie, navigation:self.navigationController ??  UINavigationController())
    }
}

