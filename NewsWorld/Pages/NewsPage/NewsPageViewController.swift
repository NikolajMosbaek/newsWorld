//
//  NewsPageViewController.swift
//  NewsWorld
//
//  Created by Nikolaj Nielsen on 11/03/2021.
//

import SDWebImage
import UIKit

class NewsPageViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var seperatorLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var sourceLabel: UILabel!
    @IBOutlet weak var linkTextView: UITextView!
    
    var article: Article!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let urlToImage = article.urlToImage {
            self.imageView.sd_setImage(with: urlToImage, completed: nil)
        } else {
            self.imageView.backgroundColor = Colors.news_page_image
        }
        
        self.titleLabel.text = article.title
        self.titleLabel.textColor = Colors.news_page_title
        self.titleLabel.font = Fonts.news_page_title
        self.titleLabel.numberOfLines = 0
        
        self.authorLabel.text = String(format: Strings.news_page_author, article.author ?? Strings.news_page_author_default)
        self.authorLabel.textColor = Colors.news_page_author
        self.authorLabel.font = Fonts.news_page_author
        
        self.descriptionLabel.text = article.description
        self.descriptionLabel.textColor = Colors.news_page_description
        self.descriptionLabel.font = Fonts.news_page_description
        self.descriptionLabel.numberOfLines = 0
        
        self.sourceLabel.text = article.source?.name ?? ""
        self.sourceLabel.textColor = Colors.news_page_source
        self.sourceLabel.font = Fonts.news_page_source
        
        if let url = article.url {
            let attributedLinkString = NSAttributedString(string: Strings.news_page_link, attributes: [NSAttributedString.Key.link : url])
            self.linkTextView.attributedText = attributedLinkString
            self.linkTextView.textColor = Colors.news_page_link
            self.linkTextView.font = Fonts.news_page_link
        }
        
        self.seperatorLabel.text = Strings.news_page_author_source_seperator
        self.seperatorLabel.textColor = Colors.news_page_author_source_seperator
        self.seperatorLabel.font = Fonts.news_page_author_source_seperator
    }
    
    class func push(from: UIViewController, article: Article) {
        let newsPageViewController = UIStoryboard(name: "NewsPage", bundle: nil).instantiateInitialViewController() as! NewsPageViewController
        newsPageViewController.article = article
        
        from.navigationController?.pushViewController(newsPageViewController, animated: true)
    }
}
