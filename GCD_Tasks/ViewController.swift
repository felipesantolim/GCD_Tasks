//
//  ViewController.swift
//  GCD_Tasks
//
//  Created by Felipe Henrique Santolim on 2/16/17.
//  Copyright © 2017 Felipe Henrique Santolim. All rights reserved.
//

import UIKit

// MARK: - BigImages: String

// Wondering why we only use https connections?
// It's because of a new iOS feature called App Transport Security.
// From now on, Apps can only access resources through a secure
// connection, using https. You can easily change this default
// behavior. Check this article to find out how:
// http://www.neglectedpotential.com/2015/06/working-with-apples-application-transport-security/
// OTOH, if you have no idea what the difference between an http and
// https connection is, fear not! Everything will be explained in the
// networking section.
// At this point it's not relevant.
enum BigImages: String {
    case whale = "https://lh3.googleusercontent.com/16zRJrj3ae3G4kCDO9CeTHj_dyhCvQsUDU0VF0nZqHPGueg9A9ykdXTc6ds0TkgoE1eaNW-SLKlVrwDDZPE=s0#w=4800&h=3567"
    case shark = "https://lh3.googleusercontent.com/BCoVLCGTcWErtKbD9Nx7vNKlQ0R3RDsBpOa8iA70mGW2XcC76jKS09pDX_Rad6rjyXQCxngEYi3Sy3uJgd99=s0#w=4713&h=3846"
    case seaLion = "https://lh3.googleusercontent.com/ibcT9pm_NEdh9jDiKnq0NGuV2yrl5UkVxu-7LbhMjnzhD84mC6hfaNlb-Ht0phXKH4TtLxi12zheyNEezA=s0#w=4626&h=3701"
}

class ViewController: UIViewController {

    /// private properties
    private var mainView: GCDView {
        return self.view as! GCDView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: tasks
    
    /// This method downloads a huge image, blocking the main queue and UI,
    /// this for instructional purpose only, NEVER DO THIS !!!! it's a bad ideia =(
    ///
    /// - Parameter sender: self
    @IBAction func synchornousDownload(_ sender: UIBarButtonItem) {
        
        //steps
        
        // 1 - Get the URL for the image.
        let url = URL(string: BigImages.seaLion.rawValue)
        
        // 2 - Obtain the NSData of image.
        do {
            
            guard let strUrl = url else {
                return
            }
            
            let imgData = try Data(contentsOf: strUrl)
            
            // 3 - Turn it into a UIImage
            let image = UIImage(data: imgData)
            
            // 4 - Display it
            mainView.photoImage.image = image
            
        } catch _ {
            print("invalid url")
        }
    }
    
    /// This method avoids blocking by creating a new queue that runs in background
    /// without blocking the UI. It's better really ?! =)
    ///
    /// - Parameter sender: self
    @IBAction func simpleAsynchronousDownload(_ sender: UIBarButtonItem) {
        
    }
    
    /// This method downloads the huge image in a global queue and uses a completion closure. o.O / =)
    ///
    /// - Parameter sender: self
    @IBAction func asynchronousDownload(_ sender: UIBarButtonItem) {
        
    }
    
    /// Changes the alpha value (transparency of the image). It's only purpose is to show if the
    /// UI is blocking or not.
    ///
    /// - Parameter sender: self
    @IBAction func setTransparencyOfImage(_ sender: UISlider) {
        mainView.photoImage.alpha = CGFloat(sender.value)
    }

}

