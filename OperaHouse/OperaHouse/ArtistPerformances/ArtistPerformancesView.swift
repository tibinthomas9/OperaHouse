//
//  ArtistPerformancesView.swift
//  OperaHouse
//
//  Created by Tibin Thomas on 22/09/23.
//

import SwiftUI

struct ArtistPerformancesView: View {

    var performance: ArtistPerformance
    private var imageUrlString: String {
        return ImageEndPoint.venue(name: performance.venue.name).url()?.absoluteString ?? ""
    }

    var body: some View {
        HStack {
            details
            Spacer()
            image
        }
    }

    var image: some View {
        CircledBorderView(view:
                            CachedImageView(url: imageUrlString)
            .frame(width: 80, height: 80))
    }

    var details: some View {
        VStack(alignment: .leading) {
            Spacer()
            name
            date
            Spacer()
        }
    }

    var name: some View {
        Text(performance.venue.name)
            .font(.title3)
            .foregroundColor(.teal)
            .bold()
    }

    var date: some View {
        HStack(alignment: .center) {
            Image(systemName: "calendar.badge.clock")
                .foregroundColor(.accentColor)
                .font(.footnote)
            Text(performance.date.toDate()?.getFullFormat() ?? "")
                .font(.body)
                .foregroundColor(.accentColor)
        }.padding(.vertical)
    }
}

struct ArtistPerformancesView_Previews: PreviewProvider {
    static var previews: some View {
        ArtistPerformancesView(performance: ArtistPerformance(id: 1,
                                                              date: "2020",
                                                              artistId: 2,
                                                              venue: Venue(id: 1, name: "Test", sortId: 1)) )
    }
}
