//
//  VenuesListView.swift
//  OperaHouse
//
//  Created by Tibin Thomas on 22/09/23.
//

import SwiftUI

struct VenuesListView: View {
    @StateObject private var viewModel = VenuesListViewModel()

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
                    ListView(venues: $viewModel.venues)
                        .refreshable {
                            try? await viewModel.getVenues()
                        }
                }
            }.navigationTitle("Venues")
                .task {
                    try? await viewModel.getVenues()
                }
        }
    }

    struct ListView: View {
        @Binding var venues: [Venue]

        var body: some View {
            List {
                ForEach(venues) { venue in
                    NavigationLink {
                        Text("Coming")
                       // VenuePerformancesListView(Venue: Venue)
                    } label: {
                        VenuesRowView(venue: venue)
                    }
                }
            }
        }
    }
}

struct VenuesListView_Previews: PreviewProvider {
    static var previews: some View {
        VenuesListView()
    }
}
