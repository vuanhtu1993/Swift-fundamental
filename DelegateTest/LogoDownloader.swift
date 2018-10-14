//
//  LogoDownloader.swift
//  DelegateTest
//
//  Created by Nguyen Kieu Oanh on 10/14/18.
//  Copyright © 2018 Anh Tus. All rights reserved.
//

import UIKit

class LogoDownloader {
    var logoURL: String
    var image: UIImage?
    
    var delegate: LogoDownloaderDelegate?
    
    init(logoURL: String) {
        self.logoURL = logoURL
    }
    
    func downloadLogo() {
        // Start the image download task asynchronously by submitting
        // it to the default background queue; this task is submitted
        // and DispatchQueue.global returns immediately.
        DispatchQueue.global(qos: DispatchQoS.QoSClass.default).async {
            
            // I'm PURPOSEFULLY downloading the image using a synchronous call
            // (NSData), but I'm doing so in the BACKGROUND.
            let imageURL = URL(string: self.logoURL)
            let imageData = NSData(contentsOf: imageURL!)
            self.image = UIImage(data: imageData! as Data)
            print("image downloaded")
            
            // Once the image finishes downloading, I jump onto the MAIN
            // THREAD TO UPDATE THE UI.
            DispatchQueue.main.async {
                // Tell the delegate that the image
                // has downloaded so the delegate can
                // display the image.
                self.didDownloadImage()
            }
            
        } // end DispatchQueue.global
    }
        
        func didDownloadImage() {
            delegate?.didFinishDownloading(self)
        }
}
