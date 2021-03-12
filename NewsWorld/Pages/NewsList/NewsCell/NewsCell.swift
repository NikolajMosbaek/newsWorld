//
//  NewsCell.swift
//  NewsWorld
//
//  Created by Nikolaj Nielsen on 09/03/2021.
//

import SDWebImage
import UIKit

class NewsCell: UITableViewCell {

    static let identifier = "NewsCell"
    
    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var publishedLabel: UILabel!
    
    var article: Article?
    
    func setup(article: Article) {
        self.article = article
        
        self.setupView()
        
        self.articleImageView.sd_setImage(with: article.urlToImage, completed: nil)
        self.titleLabel.text = article.title
        if let publishedAt = article.publishedAt {
            self.publishedLabel.text = String(format: Strings.news_cell_publish_date, publishedAt.toText())
        }
    }
    
    private func setupView() {
        self.titleLabel.numberOfLines = 2
        self.titleLabel.textColor = Colors.news_cell_title
        
        self.publishedLabel.font = Fonts.news_cell_publish_date
        self.publishedLabel.textColor = Colors.news_cell_publish_date
        
        self.articleImageView.backgroundColor = Colors.news_cell_image
        self.articleImageView.contentMode = .scaleAspectFill
        self.articleImageView.layer.cornerRadius = 8
        self.articleImageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
    }
}
