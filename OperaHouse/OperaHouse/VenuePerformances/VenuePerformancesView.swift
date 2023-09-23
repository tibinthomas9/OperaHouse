//
//  VenuePerformancesView.swift
//  OperaHouse
//
//  Created by Tibin Thomas on 22/09/23.
//

import SwiftUI

struct VenuePerformancesView: View {

    var performance: VenuePerformance
    private var imageUrlString: String {
        return ImageEndPoint.artist(name: performance.artist.name).url()?.absoluteString ?? ""
    }

    var body: some View {
        HStack {
            image
            details
            Spacer()

        }
    }

    var image: some View {
        CircledBorderView(view:
                            CachedImageView(url: imageUrlString)
            .frame(width: 80, height: 80))
    }

    var details: some View {
        VStack(alignment: .leading, spacing: 5) {
            name
            date
        }
    }

    var name: some View {
        Text(performance.artist.name)
            .font(.title2)
            .foregroundColor(.brown)
            .bold()
    }

    var date: some View {
        HStack(alignment: .center) {
            Image(systemName: "calendar.badge.clock")
                .foregroundColor(.accentColor)
                .font(.footnote)
            Text(performance.date.toDate()?.getFullFormat() ?? "")
                .font(.subheadline)
                .foregroundColor(.accentColor)
        }.padding(.vertical)
    }
}

struct VenuePerformancesView_Previews: PreviewProvider {
    static var previews: some View {
        VenuePerformancesView(performance: VenuePerformance(id: 1,
                                                              date: "2020",
                                                            venueId: 2,
                                                            artist: Artist(id: 1, genre: "Genre", name: "Artist")) )
    }
}
