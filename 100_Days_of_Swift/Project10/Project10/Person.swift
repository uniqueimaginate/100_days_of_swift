//
//  Person.swift
//  Project10
//
//  Created by Peter on 2022/03/06.
//

import UIKit

class Person: NSObject {
    var name: String
    var image: String
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
}
