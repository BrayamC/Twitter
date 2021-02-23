//
//  profileViewController.swift
//  Twitter
//
//  Created by Brayam Corral on 2/21/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit

class profileViewController: UIViewController {

    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var tagLine: UITextField!
    @IBOutlet weak var numberTweets: UITextField!
    @IBOutlet weak var numberFollowing: UITextField!
    @IBOutlet weak var numberFollowers: UITextField!
    @IBOutlet weak var backgroundPicture: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var screenName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("***********-------****************")
        getUserInfo()
        print("***********-------****************")
 
    }
    
    
    @objc func getUserInfo(){
        
     let myUrl = "https://api.twitter.com/1.1/account/verify_credentials.json"
    
        TwitterAPICaller.client?.getDictionaryRequest(url: myUrl, parameters: [String: String](), success: { (userInfo: NSDictionary) in
         
            print(userInfo)
            
            self.numberTweets.text = String(userInfo["statuses_count"] as! Int)
            self.numberFollowing.text = String(userInfo["friends_count"] as! Int)
            self.numberFollowers.text = String(userInfo["followers_count"] as! Int)
            self.tagLine.text = userInfo["description"] as! String
            self.name.text = userInfo["name"] as! String
            
            let name1 = userInfo["screen_name"] as! String
            self.screenName.text = "@\(name1)"
            
            // Set image
            var imageUrl = URL(string: (userInfo["profile_image_url_https"] as? String)!)
            var data = try? Data(contentsOf: imageUrl!)
            
            if let imageData = data {
                self.profilePicture.image = UIImage(data: imageData)
            }
            
            // Set image
            imageUrl = URL(string: (userInfo["profile_banner_url"] as? String)!)
            data = try? Data(contentsOf: imageUrl!)
            
            if let imageData = data {
                self.backgroundPicture.image = UIImage(data: imageData)
            }

            
     }, failure: { (Error) in
         print("Could not recieve user info")
     })
        
    }
    
    
 
}
