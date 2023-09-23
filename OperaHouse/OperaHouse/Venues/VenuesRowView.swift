//
//  VenuesRowView.swift
//  OperaHouse
//
//  Created by Tibin Thomas on 22/09/23.
//

import SwiftUI

struct VenuesRowView: View {

    var venue: Venue
    private var imageUrlString: String {
        return ImageEndPoint.venue(name: venue.name).url()?.absoluteString ?? ""
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
        VStack(alignment: .leading, spacing: 5) {
            name
        }
    }

    var name: some View {
        Text(venue.name)
            .font(.title2)
            .foregroundColor(.primary)
            .bold()
    }

}

struct VenuesRowView_Previews: PreviewProvider {
    static var previews: some View {
        VenuesRowView(venue: Venue(id: 1, name: "Singer", sortId: 1) )
    }
}
