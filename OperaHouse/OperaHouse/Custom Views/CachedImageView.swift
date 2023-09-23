//
//  CachedImageView.swift
//  OperaHouse
//
//  Created by Tibin Thomas on 22/09/23.
//

import SwiftUI

struct CachedImageView: View {
    @ObservedObject private var imageLoader: ImageLoader
    init(url: String) {
        imageLoader = ImageLoader(url: url)
    }
    var body: some View {
        Image(uiImage: ((imageLoader.image ?? UIImage(systemName: "photo.fill")) ?? UIImage(named: "placeholder"))!)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .task {
                imageLoader.loadImage(shouldDownload: true)
            }
    }
}
