//
//  ArtistsListView.swift
//  OperaHouse
//
//  Created by Tibin Thomas on 22/09/23.
//

import SwiftUI

struct ArtistsListView: View {
    @StateObject private var viewModel = ArtistsListViewModel()

    var body: some View {
        NavigationStack {
            VStack {
                switch viewModel.state {
                case .loading:
                    LoadingView()
                case .error(let error):
                    ErrorView(errorText: error.localizedDescription)
                case .empty:
                    EmptyView(text: "No data available")
                case .loaded:
                    ListView(artists: $viewModel.artists)
                        .refreshable {
                            try? await viewModel.getArtists()
                        }
                }
            }.navigationTitle("Artists")
                .task {
                    try? await viewModel.getArtists()
                }
        }
    }

    struct ListView: View {
        @Binding var artists: [Artist]

        var body: some View {
            List {
                ForEach(artists) { artist in
                    NavigationLink {
                        ArtistPerformancesListView(artist: artist)
                    } label: {
                        ArtistsRowView(artist: artist)
                    }
                }
            }
        }
    }
}

struct ArtistsListView_Previews: PreviewProvider {
    static var previews: some View {
        ArtistsListView()
    }
}
