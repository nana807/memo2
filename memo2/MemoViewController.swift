//
//  MemoViewController.swift
//  memo2
//
//  Created by 藤沢七葉 on 2020/12/27.
//

import UIKit

import RealmSwift


class MemoViewController: UIViewController {

    var MemoNakami = [String]()

    let userDefaults = UserDefaults.standard

    let realm = try! Realm()
    
    var todo: TodoItem?
    
    @IBOutlet var TodoTextField: UITextField!
    
    @IBOutlet weak var TodoTimePicker: UIDatePicker!
    
    @IBAction func TodoAddButton(_ sender: Any) {
        guard let title = TodoTextField.text else {
            return
            
        }
        
 
        
    
        
        let alert: UIAlertController = UIAlertController(title: "TODO", message: "Todoを追加します", preferredStyle: .alert)
        
        alert.addAction(
            UIAlertAction(
            title: "OK",
                style: .default,
                handler: { action in
                    
                    let updataTodo: TodoItem
                    if let todo = self.todo {
                        updataTodo = todo
                    }else {
                        updataTodo = TodoItem()
                    }
                   
                    try! self.realm.write{
                        updataTodo.title = title
                        updataTodo.time = self.TodoTimePicker.countDownDuration
                        self.realm.add(updataTodo)
                        
                    }
                    
                    self.dismiss(animated: true, completion: nil)
                    print("保存しました")
                }
                )
        )
        
        alert.addAction(
            UIAlertAction(
                title: "Cancel",
                style: .cancel,
                handler: { action in
                    print("保存をキャンセルしました")
                
                }))
        present(alert, animated: true, completion: nil)
    }
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let todo = todo{
            TodoTextField.text = todo.title
            TodoTimePicker.countDownDuration = todo.time
            
        }
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


