//
//  MovieList.swift
//  Movie Tracker
//
//  Created by Sarowar H. Mishkat on 10/3/20.
//  Copyright © 2020 Sarowar H. Mishkat. All rights reserved.
//

import SwiftUI

struct MovieList: View {
    
    @EnvironmentObject var movieStorage: MovieStorage
    
    var body: some View {
        
        NavigationView{
            List(movieStorage.movies) { currentMovie in
                NavigationLink(destination: MovieDetail(movie: currentMovie, movieStorage: self._movieStorage,newMovie: false)){
                    Text(currentMovie.title)
                }
                    }.navigationBarTitle("Movies").navigationBarItems(trailing:
                        NavigationLink(destination: MovieDetail(movie: Movie(), movieStorage: _movieStorage,newMovie: true)){
                            
                            VStack {
                                Image(systemName: "plus").resizable().frame(width:20, height:20)
                                Text("Add Movies").font(.caption)
                            }
                }
            )
        }
        
    }
}

struct MovieList_Previews: PreviewProvider {
    static var previews: some View {
        MovieList()
    }
}
