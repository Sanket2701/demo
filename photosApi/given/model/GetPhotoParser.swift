//
//  GetPhotoParser.swift
//  photosApi
//
//  Created by Nimap on 09/03/21.
//  Copyright © 2021 Nimap. All rights reserved.
//

import UIKit

@objc protocol GetPhotoParserDelegate : NSObjectProtocol {
    func didRecievedPhotoData(_ photos : [PhotoModel])
    @objc optional func didRecievedError()
}


class GetPhotoParser: NSObject, URLSessionDelegate, URLSessionDownloadDelegate {
    
    var photoData : Data?
    
    var session : URLSession{
        let defaultConfig = URLSessionConfiguration.default
        defaultConfig.requestCachePolicy = NSURLRequest.CachePolicy.reloadIgnoringLocalAndRemoteCacheData
        let session1 = URLSession(configuration: defaultConfig, delegate: self, delegateQueue: nil
        )
        return session1
    }
    
    weak var delegate : GetPhotoParserDelegate?
    
    func getPhoto() {
        let url = URL(string: "https://jsonplaceholder.typicode.com/photos")
        
        let task = session.downloadTask(with: url!)
        task.resume()
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        
        do {
            photoData = try Data(contentsOf: location)
            
            let responseString = String(data: photoData!, encoding: String.Encoding.utf8)
//            print("Response String \(responseString!)")
            
            let data = try JSONSerialization.jsonObject(with: photoData!, options: JSONSerialization.ReadingOptions.mutableContainers) as! [[String: Any]]
            
            var photos : [PhotoModel] = []
            
            for i in 0..<data.count{
                let photo = PhotoModel(dictionary: data[i])
                
                photos.append(photo)
            }
            DispatchQueue.main.async {
                if self.delegate != nil {
                    self.delegate!.didRecievedPhotoData(photos)
                }
            }
            
        }
        catch {
            DispatchQueue.main.async {
                if self.delegate != nil {
                    if self.delegate!.responds(to: #selector(GetPhotoParserDelegate.didRecievedError)){
                        self.delegate!.didRecievedError!()
                    }
                }
            }
        }
    }

}
