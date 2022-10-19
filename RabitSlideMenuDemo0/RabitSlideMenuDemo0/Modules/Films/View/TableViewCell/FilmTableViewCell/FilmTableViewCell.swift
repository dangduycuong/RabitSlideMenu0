//
//  FilmTableViewCell.swift
//  RabitSlideMenuDemo0
//
//  Created by cuongdd on 19/10/2022.
//  Copyright © 2022 duycuong. All rights reserved.
//

import UIKit
import Kingfisher

class FilmTableViewCell: UITableViewCell {
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var lLabel: UILabel!
    @IBOutlet weak var yrLabel: UILabel!
    @IBOutlet weak var sLabel: UILabel!
    @IBOutlet weak var rankLabel: UILabel!
    
    @IBOutlet weak var avatarImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setupUI() {
        containerView.layer.masksToBounds = true
        containerView.cornerRadius = 8
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        containerView.shadowRadius = 3
    }
    
    func fillData(d: D) {
        lLabel.text = d.l
        if let y = d.y {
            yrLabel.text = "\(y)"
        }
        if let yr = d.yr {
            yrLabel.text = yr
        }
        if let rank = d.rank {
            rankLabel.text = "Rank \(rank)"
        }
        
        sLabel.text = d.s
        if let imageURL = d.i?.imageURL, let url = URL(string: imageURL) {
            loadImage(url: url)
        }
    }
    
    private func loadImage(url: URL) {
        let processor = DownsamplingImageProcessor(size: avatarImageView.bounds.size)
        |> RoundCornerImageProcessor(cornerRadius: 16)
        avatarImageView.kf.indicatorType = .activity
        avatarImageView.kf.setImage(
            with: url,
            placeholder: UIImage(named: "placeholderImage"),
            options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
        {
            result in
            switch result {
            case .success(let value):
                print("Task done for: \(value.source.url?.absoluteString ?? "")")
            case .failure(let error):
                print("Job failed: \(error.localizedDescription)")
            }
        }
    }
}
