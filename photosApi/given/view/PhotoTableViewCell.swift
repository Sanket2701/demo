//
//  PhotoTableViewCell.swift
//  photosApi
//
//  Created by Nimap on 11/03/21.
//  Copyright © 2021 Nimap. All rights reserved.
//

import UIKit

class PhotoTableViewCell: UITableViewCell {
    
    var photoView: UIImageView?
    var titleLabel: UILabel?
    var photoId: UILabel?
    var padding: CGFloat? = 8.0
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        photoView = UIImageView(frame: CGRect(x: padding!, y: padding!, width: 150.0, height: 150.0))
        self.addSubview(photoView!)
        titleLabel = UILabel(frame: CGRect(x: 160.0, y: padding!, width: 200.0, height: 60.0))
        self.addSubview(titleLabel!)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
