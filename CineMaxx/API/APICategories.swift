//
//  APICategories.swift
//  CineMax
//
//  Created by Ketevan Barnovi on 19.02.25.
//

import UIKit


func getMoviesByGenre(genreID: Int) async -> GetMoviesResponse? {
    var request = URLRequest(url: URL(string: "https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc&with_genres=\(genreID)")!,timeoutInterval: Double.infinity)
    request.addValue("Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1ZmQ5OWYwNjA4NDIxYjUyZWVkZDY5ZjFkMTZiNDExOSIsIm5iZiI6MTczOTg4NzY4MS4yNjksInN1YiI6IjY3YjQ5NDQxMmY1ZGUxNTU3M2UwZGIxNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.zXk5HBOV_JEHEQRhXYj7G2uopjrYEZcs5yXu9yjNHoQ", forHTTPHeaderField: "Authorization")
    request.addValue("application/json", forHTTPHeaderField: "accept")

    request.httpMethod = "GET"

    do {
        let (data, _) = try await URLSession.shared.data(for: request)
                
        let response = try JSONDecoder().decode(GetMoviesResponse.self, from: data)
        return response
    } catch {
        print("Decoding error: \(error)")
        return nil
    }
}



func GetCredits(movieID: Int) async -> CastResponse? {
    var request = URLRequest(url: URL(string: "https://api.themoviedb.org/3/movie/\(movieID)/credits")!,timeoutInterval: Double.infinity)
    request.addValue("Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1ZmQ5OWYwNjA4NDIxYjUyZWVkZDY5ZjFkMTZiNDExOSIsIm5iZiI6MTczOTg4NzY4MS4yNjksInN1YiI6IjY3YjQ5NDQxMmY1ZGUxNTU3M2UwZGIxNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.zXk5HBOV_JEHEQRhXYj7G2uopjrYEZcs5yXu9yjNHoQ", forHTTPHeaderField: "Authorization")
    request.addValue("application/json", forHTTPHeaderField: "accept")

    request.httpMethod = "GET"

    do {
        let (data, _) = try await URLSession.shared.data(for: request)
                
        let response = try JSONDecoder().decode(CastResponse.self, from: data)
        return response
    } catch {
        print("Decoding error: \(error)")
        return nil
    }
}


