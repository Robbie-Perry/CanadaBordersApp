//
//  Crossing.swift
//  Canada Border Times
//
//  Created by Robbie Perry on 2018-04-18.
//  Copyright © 2018 Robbie Perry. All rights reserved.
//

import Foundation

class Crossing {
    
    var port: String?
    var crossing: String?
    var delay: String?
    
    init(port: String, crossing: String?, delay: String) {
        self.port = port
        self.crossing = crossing
        self.delay = delay
    }
}
