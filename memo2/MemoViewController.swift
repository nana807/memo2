//
//  MemoViewController.swift
//  memo2
//
//  Created by 藤沢七葉 on 2020/12/27.
//

import UIKit

var MemoNakami = [String]()


class MemoViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var contentTextView: UITextView!
    
    var saveData: UserDefaults = UserDefaults.standard
    
        
    override func viewDidLoad() {
        super.viewDidLoad()

        titleTextField.text = saveData.object(forKey: "title") as? String
        contentTextView.text = saveData.object(forKey: "content") as? String
        titleTextField.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func TodoAddButton(_ sender: Any) {
    }
  
        
        
        titleTextField.text = ""
        contentTextView.text = ""
        
        
        
    let alert: UIAlertController = UIAlertController(title: "保存", message: "メモの保存が完了しました。",preferredStyle: .alert)
    
    alert.addAction(
    UIAlertAction(
    title: "OK",
    style: .default,
    handler: { action in
        self.navigationController?.popViewController(animated: true)
        print("OKボタンが押されました")
        
    }
    )
    )
    present(alert, animated: true, completion: nil)
        
        
    }
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


