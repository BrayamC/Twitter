//
//  TweetViewController.swift
//  Twitter
//
//  Created by Brayam Corral on 2/17/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit
import RSKPlaceholderTextView

class TweetViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var characterCountTextView: UILabel!
    @IBOutlet weak var tweetTextView: UITextView!
    @IBAction func cancel(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tweet(_ sender: Any) {
        if(!tweetTextView.text.isEmpty){
            TwitterAPICaller.client?.postTweet(tweetString: tweetTextView.text, success: {
                self.dismiss(animated: true, completion: nil)
            }, failure: { (error) in
                print("Error posting tweet \(error)")
                self.dismiss(animated: true, completion: nil)
            })
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
       // TODO: Check the proposed new text character count
       // Allow or disallow the new text
        
        // Set the max character limit
        let characterLimit = 280

        // Construct what the new text would be if we allowed the user's latest edit
        let newText = NSString(string: tweetTextView.text!).replacingCharacters(in: range, with: text)

        // TODO: Update Character Count Label
        let charText = String(newText.count)
        self.characterCountTextView.text = "\(charText)/280"
        
        // The new text should be allowed? True/False
        return newText.count <= characterLimit
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tweetTextView.becomeFirstResponder()
        tweetTextView.delegate = self
        
        tweetTextView!.layer.borderWidth = 1
        tweetTextView!.layer.borderColor = UIColor.black.cgColor
        tweetTextView.layer.masksToBounds = true
        tweetTextView.layer.cornerRadius = 10
        
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
