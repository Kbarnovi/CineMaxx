//
//  APICategories.swift
//  CineMax
//
//  Created by Ketevan Barnovi on 19.02.25.
//

import UIKit


func MakeRequestKeti() {
    var request = URLRequest(url: URL(string: "https://api.themoviedb.org/3/genre/tv/list?language=en")!,timeoutInterval: Double.infinity)
    request.addValue("Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1ZmQ5OWYwNjA4NDIxYjUyZWVkZDY5ZjFkMTZiNDExOSIsIm5iZiI6MTczOTg4NzY4MS4yNjksInN1YiI6IjY3YjQ5NDQxMmY1ZGUxNTU3M2UwZGIxNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.zXk5HBOV_JEHEQRhXYj7G2uopjrYEZcs5yXu9yjNHoQ", forHTTPHeaderField: "Authorization")
    request.addValue("application/json", forHTTPHeaderField: "accept")
    
    request.httpMethod = "GET"
    
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        guard let data = data else {
            print(String(describing: error))
            return
        }
        print(String(data: data, encoding: .utf8)!)
    }
    
    task.resume()
    
}



func fetchWelcomeMessage() async -> Welcome? {
    var request = URLRequest(url: URL(string: "https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc&with_genres=35")!,timeoutInterval: Double.infinity)
    request.addValue("Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1ZmQ5OWYwNjA4NDIxYjUyZWVkZDY5ZjFkMTZiNDExOSIsIm5iZiI6MTczOTg4NzY4MS4yNjksInN1YiI6IjY3YjQ5NDQxMmY1ZGUxNTU3M2UwZGIxNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.zXk5HBOV_JEHEQRhXYj7G2uopjrYEZcs5yXu9yjNHoQ", forHTTPHeaderField: "Authorization")
    request.addValue("application/json", forHTTPHeaderField: "accept")

    request.httpMethod = "GET"

    do {
        let (data, _) = try await URLSession.shared.data(for: request)
                
        let welcomeMessage = try JSONDecoder().decode(Welcome.self, from: data)
        return welcomeMessage
    } catch {
        print("Decoding error: \(error)")
        return nil
    }
}


