//
//  Rocket.swift
//  ModernRockets
//
//  Created by Miroslav Hnát on 15.03.2021.
//

import Foundation


struct Rocket: Decodable {
    let id: Int
    let rocketName: String
    let flickrImages: [String]
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case rocketName = "rocket_name"
        case flickrImages = "flickr_images"
        case description = "description"
    }
}
