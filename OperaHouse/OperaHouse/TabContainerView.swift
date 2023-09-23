//
//  TabContainerView.swift
//  OperaHouse
//
//  Created by Tibin Thomas on 22/09/23.
//

import SwiftUI

struct TabContainerView: View {
    var body: some View {
        TabView {
            ArtistsListView()
                .tabItem {
                    Label(LocalizedStringKey(Tab.artists.title),
                          systemImage: "party.popper")
                }
            VenuesListView()
                .tabItem {
                    Label(LocalizedStringKey(Tab.venues.title),
                          systemImage: "globe.americas")
                }
        }
    }
}

struct TabContainerView_Previews: PreviewProvider {
    static var previews: some View {
        TabContainerView()
            .preferredColorScheme(.dark)
            .environment(\.locale, .init(identifier: "fr-CA"))
    }
}

enum Tab {
    case artists
    case venues
}

extension Tab {
    var title: String {
        switch self {
        case .artists:
            return "Artists"
        case .venues:
            return "Venues"
        }
    }
}
