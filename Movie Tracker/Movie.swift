//
//  Movie.swift
//  Movie Tracker
//
//  Created by Sarowar H. Mishkat on 9/3/20.
//  Copyright © 2020 Sarowar H. Mishkat. All rights reserved.
//

import Foundation

struct Movie: Identifiable {
    
    var id = UUID()
    var title = ""
    var rating = 3.0
    var seen = false
    
}

class MovieStorage: ObservableObject{
    
    @Published var movies = [Movie]()
    
}
