//
//  ViewController.swift
//  memo2
//
//  Created by 藤沢七葉 on 2020/12/27.
//

import UIKit

import RealmSwift

class TodoItem: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var time: Double = 0.0
}

class ViewController: UIViewController,UITableViewDataSource, UITableViewDelegate{

    
    let realm = try! Realm()
    
    var todoArray = [TodoItem]()

    let userDefaults = UserDefaults.standard

    @IBOutlet weak var TableView: UITableView!
    
    var observer: NSKeyValueObservation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TableView.dataSource = self
        TableView.delegate = self
        TableView.reloadData()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        todoArray = realm.objects(TodoItem.self).map({ $0 })
        TableView.register(UINib(nibName: "TodoTableViewCell", bundle: nil), forCellReuseIdentifier: "TodoCell")
        TableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
       
        if UserDefaults.standard.object(forKey: "TodoList") != nil {
            todoArray = UserDefaults.standard.object(forKey: "TodoList") as! [TodoItem]
        
//            observer = userDefaults.observe(\.todo, options: [.initial, .new]) { (_, change) in
//                        // クロージャーの中ではselfが必須になる
//                        self.MemoNakami = change.newValue ?? []
//                      //  self.tableView.reloadData()
//                    }
        
    }
    
   
}
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath) as! TodoTableViewCell
        cell.titleLabel.text = todoArray[indexPath.row].title
        cell.durationLabel.text = String(Int((todoArray[indexPath.row].time)/60)) + "min"
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        todoArray.count
            }

   func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            todoArray.remove(at: indexPath.row)
            try! realm.write{
              realm.delete(self.todoArray[indexPath.row])
                            }
            
                            tableView.deleteRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.automatic)
               
            
                
        
        }

}
    
}

