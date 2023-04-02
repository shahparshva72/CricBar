//
//  MatchView.swift
//  CricBar
//
//  Created by Parshva Shah on 4/2/23.
//

import SwiftUI

struct MatchView: View {
    let match: Match
    
    var body: some View {
        VStack(alignment: .center, spacing: 8) {
            Text(match.matchInfo.status)
                .font(.headline)
                .foregroundColor(.primary)
            
            HStack {
                VStack(alignment: .leading) {
                    Text(match.matchInfo.team1.teamName)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                    Text("\(match.matchScore?.team1Score?.inngs1.runs ?? 0) / \(match.matchScore?.team1Score?.inngs1.wickets ?? 0)")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.primary)
                }
                Spacer()
                
                VStack(alignment: .leading) {
                    Text(match.matchInfo.team2.teamName)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                    Text("\(match.matchScore?.team2Score?.inngs1.runs ?? 0) / \(match.matchScore?.team2Score?.inngs1.wickets ?? 0)")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.primary)
                }
            }
        }
        .padding()
    }
}
