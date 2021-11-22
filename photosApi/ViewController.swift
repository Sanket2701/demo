//
//  ViewController.swift
//  photosApi
//
//  Created by Nimap on 09/03/21.
//  Copyright © 2021 Nimap. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController, UITextFieldDelegate {
    
    var nextButton : UIButton?
    var textFieldNew :  UITextField?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        self.edgesForExtendedLayout = UIRectEdge()
        // Do any additional setup after loading the view, typically from a nib.
        
        nextButton = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
        nextButton?.backgroundColor = UIColor.blue
        nextButton?.setTitle("Next Screen", for: .normal)
        nextButton?.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        self.view.addSubview(nextButton!)
        
        textFieldNew = UITextField(frame: CGRect(x: 50, y: 200, width: 300, height: 40))
        textFieldNew!.font = UIFont.boldSystemFont(ofSize: 16.0)
        textFieldNew!.delegate = self
        textFieldNew!.layer.borderColor = UIColor.black.cgColor
        self.view.addSubview(textFieldNew!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func buttonAction(sender: UIButton!){
        let nextScreen = PhotoViewController()
        navigationController?.pushViewController(nextScreen, animated: true)

    }
    
}

