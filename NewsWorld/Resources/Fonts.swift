//
//  Fonts.swift
//  NewsWorld
//
//  Created by Nikolaj Nielsen on 10/03/2021.
//

import UIKit

class Fonts {
    
    enum FontSize: CGFloat {
        case small = 11
        case medium = 15
        case large = 18
    }
    
    // MARK: - Generic fonts
    private static func regular(withSize size: FontSize) -> UIFont {
        return UIFont.systemFont(ofSize: size.rawValue, weight: .regular)
    }
    
    private static func bold(withSize size: FontSize) -> UIFont {
        return UIFont.systemFont(ofSize: size.rawValue, weight: .bold)
    }
    
    // MARK: - News cell
    static let news_cell_title = regular(withSize: .medium)
    static let news_cell_publish_date = regular(withSize: .small)
    
    // MARK: - News page
    static let news_page_title = bold(withSize: .large)
    static let news_page_author = regular(withSize: .small)
    static let news_page_source = regular(withSize: .small)
    static let news_page_author_source_seperator = regular(withSize: .small)
    static let news_page_description = regular(withSize: .medium)
    static let news_page_link = regular(withSize: .medium)
}
