//
//  UIImageExtensions.swift
//  CVEduardoFonseca
//
//  Created by Eduardo Fonseca on 29/10/19.
//  Copyright © 2019 Eduardo Fonseca. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func getImage(from url: String) {
        image = #imageLiteral(resourceName: "placeholder_image")
        if let imageBase64 = UserDefaults.standard.value(forKey: url) as? String,
            let data = Data(base64Encoded: imageBase64),
            let image = UIImage(data: data) {
            DispatchQueue.main.async {
                self.image = image
                
            }
        } else {
            let activityView = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.medium)
            guard let url = URL(string: url) else { return }
            DispatchQueue.main.async {
                self.addSubview(activityView)
                activityView.center = self.center
                activityView.startAnimating()
                activityView.color = .white
                
            }
            let task = URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
                if let data = data, let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.image = image
                        UserDefaults.standard.set(image.base64, forKey: url.absoluteString)
                        activityView.stopAnimating()
                        activityView.removeFromSuperview()
                        
                    }
                } else {
                    DispatchQueue.main.async {
                        activityView.stopAnimating()
                        activityView.removeFromSuperview()
                        self.image = #imageLiteral(resourceName: "placeholder_image")
                        
                    }
                }
            })
            task.resume()
        }
    }
    
    class func deleteImage(from url: String) {
        UserDefaults.standard.setValue(nil, forKey: url)
        
    }
}

extension UIImage {
    
    var base64: String {
        guard let data: Data = self.pngData() as Data? else { return "" }
        return data.base64EncodedString()

    }
    
    func resized(withPercentage percentage: CGFloat) -> UIImage? {
        let canvasSize = CGSize(width: size.width * percentage, height: size.height * percentage)
        UIGraphicsBeginImageContextWithOptions(canvasSize, false, scale)
        defer { UIGraphicsEndImageContext() }
        draw(in: CGRect(origin: .zero, size: canvasSize))
        return UIGraphicsGetImageFromCurrentImageContext()
        
    }
    
}
