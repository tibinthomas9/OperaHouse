//
//  ImageLoader.swift
//  OperaHouse
//
//  Created by Tibin Thomas on 22/09/23.
//

import SwiftUI

class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    var url: String

    init(url: String) {
        self.url = url
        loadImage(shouldDownload: false)
    }

    func loadImage(shouldDownload: Bool) {
        guard let imageURL = URL(string: url) else {
            return
        }
        let cacheDirectory = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)[0]
        // delete last component to fetch unique fileurl for image
        let lastPathComponent = imageURL.lastPathComponent
        let fileName = imageURL.deletingLastPathComponent().lastPathComponent + lastPathComponent
        let fileURL = cacheDirectory.appendingPathComponent(fileName)
        // check if image is present in disk
        if let cachedImageData = try? Data(contentsOf: fileURL) {
            image = UIImage(data: cachedImageData)
            return
        }
        if shouldDownload {
            downloadImage(from: imageURL, to: fileURL)
        }
    }

    fileprivate func downloadImage(from imageURL: URL, to fileURL: URL) {
        // Download and save to disk
        URLSession.shared.dataTask(with: imageURL) { [weak self] (data, _, error) in
            guard let self = self else {
                return
            }
            if let imageData = data, let downloadedImage = UIImage(data: imageData) {
                DispatchQueue.main.async {
                    self.image = downloadedImage
                    do {
                        try imageData.write(to: fileURL)
                    } catch {
                        print("Error saving image to cache: \(error.localizedDescription)")
                    }
                }
            }
        }.resume()
    }
}
