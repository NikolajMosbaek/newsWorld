//
//  Date.swift
//  NewsWorld
//
//  Created by Nikolaj Nielsen on 09/03/2021.
//

import Foundation

extension Date {
    func toApiFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: self)
    }
    
    func toText() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM-yy"
        return dateFormatter.string(from: self)
    }
}
