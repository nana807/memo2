//
//  ViewController.swift
//  memo2
//
//  Created by 藤沢七葉 on 2020/12/27.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MemoNakami.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let TodoCell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath)
        //変数の中身を作る
        TodoCell.textLabel!.text = MemoNakami[indexPath.row]
        //戻り値の設定（表示する中身)
        return TodoCell

    }

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UserDefaults.standard.object(forKey: "TodoList") != nil {
            MemoNakami = UserDefaults.standard.object(forKey: "TodoList") as! [String]
        
            
            func didReceiveMemoryWarning() {
                    super.didReceiveMemoryWarning()
                }
        // Do any additional setup after loading the view.
        //テーブルビューはviewcontrollerswiftで表示する、という設定
         
    
    
    
        }
    }

}
