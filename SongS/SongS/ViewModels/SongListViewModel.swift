//
//  SongListViewModel.swift
//  SongS
//
//  Created by fulin on 23/1/22.
//

import SwiftUI

class SongListViewModel: ObservableObject {
    
    @Published var songs = [Song]()
    
    func fetchSongs() async throws {
        let urlString = Constants.baseURL + Endpoints.songs
        
        guard let url = URL(string: urlString) else {
            throw HttpError.badURL
        }
        
        let songResponse: [Song] = try await HttpClient.shared.fetch(url: url)
        
        DispatchQueue.main.async {
            self.songs = songResponse
        }
    }
}

