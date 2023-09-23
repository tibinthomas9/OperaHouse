//
//  ArtistsRowView.swift
//  OperaHouse
//
//  Created by Tibin Thomas on 22/09/23.
//

import SwiftUI

struct ArtistsRowView: View {

    var artist: Artist
    private var imageUrlString: String {
        return ImageEndPoint.artist(name: artist.name).url()?.absoluteString ?? ""
    }

    var body: some View {
        HStack {
            image
            details
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
            genre
        }
    }

    var name: some View {
        Text(artist.name)
            .font(.title2)
            .foregroundColor(.brown)
            .bold()
    }

    var genre: some View {
        HStack(alignment: .center) {
            Image(systemName: "music.quarternote.3")
                .foregroundColor(.secondary)
                .font(.footnote)
            Text(artist.genre)
                .font(.body)
                .foregroundColor(.secondary)
        }
    }
}

struct ArtistsRowView_Previews: PreviewProvider {
    static var previews: some View {
        ArtistsRowView(artist: Artist(id: 1, genre: "test", name: "Singer") )
    }
}
