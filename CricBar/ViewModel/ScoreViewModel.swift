//
//  ScoreViewModel.swift
//  CricBar
//
//  Created by Parshva Shah on 3/30/23.
//

import Foundation

class CricketViewModel: ObservableObject {
    @Published var liveMatchesData: LiveMatchesData?
    
    init() {
        Task {
            do {
                let liveMatches = try await NetworkManager.shared.getLiveMatches()
                DispatchQueue.main.async {
                    self.liveMatchesData = liveMatches
                }
            } catch {
                print("Error fetching data: \(error)")
            }
        }
    }
}
