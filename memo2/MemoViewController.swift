//
//  MemoViewController.swift
//  memo2
//
//  Created by 藤沢七葉 on 2020/12/27.
//

import UIKit

var MemoNakami = [String]()


class MemoViewController: UIViewController {

    @IBOutlet var TodoTextField: UITextField!
    
        
    @IBAction func TodoAddButton(_ sender: Any) {
        
        MemoNakami.append(TodoTextField.text!)
        TodoTextField.text = ""
        UserDefaults.standard.set( MemoNakami, forKey: "TodoList" )
        
    }
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
        }
    
    }
  
        
        
    let alert: UIAlertController = UIAlertController(title: "保存", message: "メモの保存が完了しました。",preferredStyle: .alert)
 

    
    
   
    
    
        
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


