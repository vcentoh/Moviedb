//
//  MovieDetailVC.swift
//  MovieDB
//
//  Created by Vicent de Freitas on 8/4/19.
//  Copyright © 2019 Vicent De Freitas. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import youtube_ios_player_helper

class MovieDetailVC: UIViewController {
    @IBOutlet weak var trailerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var sumary: UITextView!
    @IBOutlet weak var scoreLabel: UILabel!
    
    private var video: YTPlayerView?
    private let presenter: MovieDetailPresenter
    private let movie: Movie
    private var disposeBag = DisposeBag()
    
    init (with presenter:MovieDetailPresenter, movie: Movie){
        self.presenter = presenter
        self.movie = movie
        super.init(nibName: "MovieDetailVC", bundle: nil)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear( animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUI()
        self.rxbind()
    }
    
    private func setUI() {
        titleLabel.font = .boldSystemFont(ofSize: 16)
        titleLabel.text = ""
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 2
        titleLabel.lineBreakMode = .byWordWrapping
        sumary.font = .italicSystemFont(ofSize: 14)
        sumary.isEditable = false
        sumary.textAlignment = .left
        sumary.text = ""
        sumary.scrollRangeToVisible(NSMakeRange(0, 0))
        
        scoreLabel.font = .italicSystemFont(ofSize: 12)
        scoreLabel.textColor = .gray
        scoreLabel.text = ""
        scoreLabel.textAlignment = .right
    }
    
    private func rxbind()
    {
        guard let id = movie.id else {return }
        presenter.getMovieDetail(with: String(id))
            .subscribe(onNext: { [weak self] movie in
                self?.setUI(with: movie)}).disposed(by: disposeBag)
        
        presenter.getMovieTrailer(with: String(id))
            .subscribe(onNext: { [weak self] Trailer in
                self?.setTrailer(with: Trailer)
            }).disposed(by: disposeBag)
        
    }
    
    private func setUI(with movie:Movie)
    {
        titleLabel.text = movie.originalTitle
        sumary.text = movie.summary
        sumary.contentOffset = .zero
        scoreLabel.text = "Relase date: " + String(describing: movie.dateRelease ?? "")
    }
    
    private func setTrailer(with video: VideoList)
    {
        guard let video = video.list?.first else {return}
        self.video = YTPlayerView(frame: self.trailerView.bounds)
        self.video?.load(withVideoId: video.videoPath ?? "")
        self.trailerView.addSubview(self.video ??  UIView())
    }
}
