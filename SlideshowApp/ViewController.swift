//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Yuto Yoshihara on 2017/02/16.
//  Copyright © 2017年 yuto.yoshihara. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var SlideshowImageView: UIImageView!
    
    let photos = ["1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg", "6.jpg", "7.jpg", "8.jpg", "9.jpg", "10.jpg", "11.jpg", "12.jpg", ]
    
    
    var timer: Timer!
    var timer_sec: Float = 0.0
    
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let myImage : UIImage = UIImage(named: photos[0])!
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

