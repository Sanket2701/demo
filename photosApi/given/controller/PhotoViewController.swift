//
//  PhotoViewController.swift
//  photosApi
//
//  Created by Nimap on 09/03/21.
//  Copyright © 2021 Nimap. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, GetPhotoParserDelegate, UITableViewDelegate, UITableViewDataSource {
    
    var parser : GetPhotoParser?
    var photos : [PhotoModel]?
    var photoTable :  UITableView?
    var padding : CGFloat? = 8.0
    var limit = 50
    var sample : [PhotoModel] = Array()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        edgesForExtendedLayout = UIRectEdge()
        title = "Rest Screen"
        // Do any additional setup after loading the view.
        parser = GetPhotoParser()
        parser!.delegate = self
        parser!.getPhoto()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func didRecievedPhotoData(_ photos: [PhotoModel]) {
        self.photos = photos
        loadPhotos()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    func loadPhotos() {
        photoTable = UITableView(frame: CGRect(x: 0.0, y: 10.0, width: self.view.frame.size.width - (padding!*2.0), height: self.view.frame.size.height))
        photoTable!.delegate = self
        photoTable!.dataSource = self
        
        var index = 0
        while index < limit {
            sample.append(PhotoModel())
            index = index + 1
            print(index)
        }
        self.view.addSubview(photoTable!)
    }
    // Mark:- UITableViewMethods
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return sample.count
        
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        var myCell : UITableViewCell?
        
        myCell = photoTable!.dequeueReusableCell(withIdentifier: "photo")
        
        if myCell == nil {
            myCell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "photo")
        }
        
        let photo = photos![indexPath.row]
        
        myCell!.textLabel!.text = "\(photo.id!)"
        myCell!.detailTextLabel!.text = photo.title
        return myCell!
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == sample.count - 1 {
            // we are on last cell
            if sample.count < 5000 {
                var index = sample.count
                limit = index + 50
                while index < limit {
                    sample.append(PhotoModel())
                    index = index + 1
                    print(index)
                }
                self.perform(#selector(reloadTable), with: nil, afterDelay: 1.0)
            }
        }
    }
    @objc func reloadTable() {
        self.photoTable?.reloadData()
    }
}
