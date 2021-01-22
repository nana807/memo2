//
//  toNextViewController.swift
//  memo2
//
//  Created by 藤沢七葉 on 2020/12/28.
//

import UIKit

class toNextViewController: UIViewController {
    
    @IBOutlet var  content2TextView: UITextView!
    
    var MemoArray = [String]()
    var saveData: UserDefaults = UserDefaults.standard
    
     override func viewDidLoad() {
        content2TextView.text = saveData.object(forKey: "content") as? String
        
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
