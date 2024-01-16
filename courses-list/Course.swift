//
//  Course.swift
//  courses-list
//
//  Created by Jorge on 15/01/24.
//

import Foundation

struct Course: Identifiable, Codable {
    var id: Int
    var image: String
    var title: String
    var subtitle: String
}
