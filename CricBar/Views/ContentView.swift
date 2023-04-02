//
//  ContentView.swift
//  CricBar
//
//  Created by Parshva Shah on 2/18/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = CricketViewModel()
    
    var body: some View {
        List {
            if let liveMatches = viewModel.liveMatchesData?.typeMatches.first?.seriesAdWrapper.compactMap({ $0.seriesMatches?.matches }).flatMap({ $0 }) {
                ForEach(liveMatches, id: \.matchInfo.matchID) { match in
                    MatchView(match: match)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
