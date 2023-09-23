//
//  ArtistPerformancesView.swift
//  OperaHouse
//
//  Created by Tibin Thomas on 22/09/23.
//

import SwiftUI

struct ArtistPerformancesListView: View {

    @StateObject private var viewModel = ArtistPerformancesListViewModel()
    var artist: Artist

    var body: some View {
        VStack {
            switch viewModel.state {
            case .loading:
                LoadingView()
            case .error(let error):
                ErrorView(errorText: error.localizedDescription)
            case .empty:
                EmptyView(text: "No data available")
            case .loaded:
                List {
                    ForEach(viewModel.artistPerformances) { performance in
                        ArtistPerformancesView(performance: performance)
                    }
                }
                .refreshable {
                    try? await viewModel.getArtistPerformances(artistId: "\(artist.id)")
                }
            }
        }.navigationTitle("Performances")
            .task {
                try? await viewModel.getArtistPerformances(artistId: "\(artist.id)")
            }
    }
}

struct ArtistPerformancesListView_Previews: PreviewProvider {
    static var previews: some View {
        ArtistPerformancesListView(artist: Artist(id: 1, genre: "test", name: "Singer"))
    }
}
