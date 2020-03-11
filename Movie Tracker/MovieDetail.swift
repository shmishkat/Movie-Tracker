//
//  MovieDetail.swift
//  Movie Tracker
//
//  Created by Sarowar H. Mishkat on 28/2/20.
//  Copyright © 2020 Sarowar H. Mishkat. All rights reserved.
//

import SwiftUI

struct MovieDetail: View {
    
    @State var movie: Movie
    @Environment (\.presentationMode) var presentationMode
    
    //@ObservedObject var movieStorage: MovieStorage
    @EnvironmentObject var movieStorage: MovieStorage
    
    let newMovie: Bool
    
    var body: some View {
        List{
            Section{
                
                VStack(alignment: .leading) {
                    sectionTitle(title: "Movie Title")
                    
                    TextField("Movie Title...",text: $movie.title)
                }
            }
            Section{
                sectionTitle(title: "Rating")
                
                VStack {
                    Text(String(repeating: "⭐️", count: Int(movie.rating)))
                    Slider(value: $movie.rating, in: 1...5, step: 1)
                }
            }
            Section{
                sectionTitle(title: "Seen")
                
                Toggle(isOn: $movie.seen){
                    if movie.title == ""{
                        Text("I've seen the movie")
                    }else{
                        Text("I have seen \(movie.title)")
                        
                    }
                }
                
            }
            Section{
                Button(action:{
                    if self.newMovie{
                        self.movieStorage.movies.append(self.movie)
                    }else{
                        for x in 1..<self.movieStorage.movies.count{
                            if self.movieStorage.movies[x].id == self.movie.id{
                                self.movieStorage.movies[x] = self.movie
                                
                            }
                            
                        }
                    }
                    self.presentationMode.wrappedValue.dismiss()
                }){
                    
                    HStack {
                        Spacer()
                        Text("Save").foregroundColor(.blue)
                        Spacer()
                    }
                }.disabled(movie.title.isEmpty)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetail(movie: Movie(),newMovie: true)
    }
}

struct sectionTitle: View {
    var title: String
    
    var body: some View {
        Text(title)
            .font(.caption)
            .foregroundColor(.gray)
    }
}
