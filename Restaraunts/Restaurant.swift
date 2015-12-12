//
//  Restaurant.swift
//  Restaraunts
//
//  Created by Игорь on 29.11.15.
//  Copyright © 2015 Ihor Malovanyi. All rights reserved.
//

import Foundation

class Restaurant {
    var name = ""
    var type = ""
    var location = ""
    var image = ""
    var phoneNumber = ""
    var isVisited = false
    
    init(name: String, type: String, location: String, phoneNumber: String,image: String, isVisited: Bool) {
        self.name = name
        self.type = type
        self.location = location
        self.phoneNumber = phoneNumber
        self.image = image
        self.isVisited = isVisited
    }
}

