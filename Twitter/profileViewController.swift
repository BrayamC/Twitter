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
    
    var userId: Int = -1
    var screenName: Int = -1
    
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
         
     }, failure: { (Error) in
         print("Could not recieve user info")
     })
        
    }
    
    
 
}
