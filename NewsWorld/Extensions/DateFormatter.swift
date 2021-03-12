//
//  DateFormatter.swift
//  NewsWorld
//
//  Created by Nikolaj Nielsen on 09/03/2021.
//

import Foundation

extension DateFormatter {
    static let NewsAPIFormat: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return dateFormatter
    }()
}
