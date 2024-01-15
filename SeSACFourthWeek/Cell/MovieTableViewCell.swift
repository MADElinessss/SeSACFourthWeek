//
//  MovieTableViewCell.swift
//  SeSACFourthWeek
//
//  Created by 신정연 on 1/11/24.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    // MARK: static: 인스턴스를 생성하지 않아도 접근할 수 있음!
//    static let identifier = "MovieTableViewCell"// -> 프로토콜

    @IBOutlet var posterImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var overviewLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setBackground()
        
        posterImageView.clipsToBounds = true
        posterImageView.contentMode = .scaleAspectFit
        
        titleLabel.font = .boldSystemFont(ofSize: 15)
        titleLabel.textColor = .white
        titleLabel.backgroundColor = .clear
        
        overviewLabel.font = .systemFont(ofSize: 13)
        overviewLabel.textColor = .white
        overviewLabel.numberOfLines = 0 // 무한대
        
        backgroundColor = .gray
    }
    
    func configureCell(row: Movie) {
        titleLabel.text = row.description
        overviewLabel.text = row.overview
        
    }
}
