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
    
    
    let photos = ["1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg", "6.jpg", "7.jpg", "8.jpg", "9.jpg", "10.jpg", "11.jpg", "12.jpg"]
    
    
    var timer : Timer!
    var timer_sec: Float = 0
    
    var ImageNo = 0
    
    @IBOutlet var playButton: UIButton!
    
    @IBOutlet var moveOnButton: UIButton!
    
    @IBOutlet var moveBackButton: UIButton!
    
    @IBOutlet var picButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        playButton.layer.cornerRadius = 7
        playButton.setTitleColor(UIColor.white , for: .normal)
        playButton.backgroundColor = UIColor.blue
        playButton.showsTouchWhenHighlighted = true
        
        picButton.showsTouchWhenHighlighted = true
        
        let image : UIImage = UIImage(named: photos[ImageNo])!
        
        
        SlideshowImageView.image = image
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func moveOn(_ sender: Any) {
        ImageNo += 1
        
        if ImageNo > 11 {
            ImageNo = 0
            
            SlideshowImageView.image = UIImage(named: photos[ImageNo])!

        }else{
            SlideshowImageView.image = UIImage(named: photos[ImageNo])!
            
        }
        
    }
    
    
    
    @IBAction func moveBack(_ sender: Any) {
        ImageNo -= 1
        
        if ImageNo < 0{
            ImageNo = 11
        }
        SlideshowImageView.image = UIImage(named: photos[ImageNo])!
        
        
    }
    
    
    
    
    
    func updateTimer(timer : Timer){
        ImageNo += 1
        if ImageNo > 11{
            ImageNo = 0
        }
        
        SlideshowImageView.image = UIImage(named: photos[ImageNo])!
        
    }
    
    
    @IBAction func playSlideshow(_ sender: Any) {
        
        if timer == nil{
        timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateTimer(timer:)), userInfo: nil, repeats: true)
            playButton.setTitle("停止", for: .normal)
            moveOnButton.isEnabled = false
            moveBackButton.isEnabled = false
            
        }else{
            self.timer!.invalidate()
            self.timer = nil
            playButton.setTitle("再生", for: .normal)
            moveOnButton.isEnabled = true
            moveBackButton.isEnabled = true

            
        }
        
        
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        performSegue(withIdentifier: "toPictureViewController", sender: nil)
        
        if timer != nil{
            
            self.timer.invalidate()
            self.timer = nil
            playButton.setTitle("再生", for: .normal)
            moveOnButton.isEnabled = true
            moveBackButton.isEnabled = true
            
        }
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "toPictureViewController"{
            let picVC : PictureViewController = (segue.destination as? PictureViewController)!
            picVC.imageName = photos[ImageNo]
            
        }
        
        
    }

    
    
    
    
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
    }
    
        
    }
    
    

    
    


