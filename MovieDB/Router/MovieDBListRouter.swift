//
//  MovieDBRouter.swift
//  MovieDB
//
//  Created by Vicent De Freitason 7/28/19.
//  Copyright © 2019 Vicent De Freitas. All rights reserved.
//

import Foundation
import UIKit

class MovieDBListRouter {
    
    private let navigation: UINavigationController
    
    init(with navigation: UINavigationController) {
        self.navigation = navigation
    }
    
    func showMovieList(_ presenter: MovieDBListPresenter) {
        let storyboard = UIStoryboard.init(name: "MovieDB", bundle: nil)
        storyboard.instantiateViewController(withIdentifier: )
        let viewController = storyboard.instantiateViewController(withIdentifier: "MovieDBListVC") as? MovieDBListVC
        viewController?.presenter = presenter
        navigation.setViewControllers([viewController ?? UIViewController()], animated: true)
    }
}
