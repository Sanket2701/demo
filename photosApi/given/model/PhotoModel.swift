//
//  PhotoModel.swift
//  photosApi
//
//  Created by Nimap on 09/03/21.
//  Copyright © 2021 Nimap. All rights reserved.
//

import UIKit

class PhotoModel: NSObject {
    
    var albumId : Int?
    var id : Int?
    var title : String?
    var url : String?
    var thumbnailUrl : String?
    
    override init() {
        super.init()
    }
    
    init(dictionary: [String: Any]) {
        super.init()
        albumId = dictionary["albumId"] as? Int
        id = dictionary["id"] as? Int
        title = dictionary["title"] as? String
        url = dictionary["url"] as? String
        thumbnailUrl = dictionary["thumbnailUrl"] as? String
    }
}
