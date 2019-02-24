//
//  BookCoverImageView.swift
//  BooksCatalogMVC
//
//  Created by Sri Adatrao on 9/17/18.
//  Copyright © 2018 Sri Adatrao. All rights reserved.
//

import UIKit

let cache = NSCache<AnyObject,UIImage>()
class BookCoverImageView: UIImageView {
    var imageUrl: URL?
    
    func fetchImageFrom(url: URL) {
        image = nil
        imageUrl = url
        if let cachedImage = cache.object(forKey: url as AnyObject) {
            image = cachedImage
            return
        }
        URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            guard let httpResponse = response as? HTTPURLResponse,
                httpResponse.statusCode == 200, let data = data else { return }
            if self?.imageUrl == url {
                DispatchQueue.main.async {
                    if let image = UIImage(data: data) {
                        self?.image = image
                        cache.setObject(image, forKey: url as AnyObject)
                    }
                }
            }
        }.resume()
    }
}
