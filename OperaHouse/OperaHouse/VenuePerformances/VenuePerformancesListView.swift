//
//  VenuePerformancesView.swift
//  OperaHouse
//
//  Created by Tibin Thomas on 22/09/23.
//

import SwiftUI

struct VenuePerformancesListView: View {

    @StateObject private var viewModel = VenuePerformancesListViewModel()
    var venue: Venue

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
                    ForEach(viewModel.venuePerformances) { performance in
                        VenuePerformancesView(performance: performance)
                    }
                }
                .refreshable {
                    try? await viewModel.getVenuePerformances(venueId: "\(venue.id)")
                }
            }
        }.navigationTitle("Performances")
            .task {
                try? await viewModel.getVenuePerformances(venueId: "\(venue.id)")
            }
    }
}

struct VenuePerformancesListView_Previews: PreviewProvider {
    static var previews: some View {
        VenuePerformancesListView(venue: Venue(id: 1, name: "Test", sortId: 1))
    }
}
