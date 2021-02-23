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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
