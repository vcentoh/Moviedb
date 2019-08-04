//
//  moviedetailvc.swift
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
    @IBOutlet weak var TrailerView: UIView!
    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var Sumary: UITextView!
    @IBOutlet weak var ScoreLabel: UILabel!
    
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
        self.rxbind()
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
     TitleLabel.text = movie.originalTitle
     Sumary.text = movie.summary
        ScoreLabel.text = "Score: " + String(describing: movie.averageScore ?? "")
    }
    
    private func setTrailer(with video: VideoList)
    {
        guard let video = video.list?.first else {return}
        self.video = YTPlayerView(frame: self.TrailerView.bounds)
        self.video?.load(withVideoId: video.videoPath ?? "")
        self.TrailerView.addSubview(self.video ??  UIView())
    }
}
