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
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {        let TodoCell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath)
        //変数の中身を作る
        TodoCell.textLabel!.text = MemoNakami[indexPath.row]
        //戻り値の設定（表示する中身)
        return TodoCell

    }
    
    
    @IBOutlet var table: UITableView!
    
    var ContentArray = [String]()
    var MemoArray = [String]()
    var saveData: UserDefaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UserDefaults.standard.object(forKey: "TodoList") != nil {
            MemoNakami = UserDefaults.standard.object(forKey: "TodoList") as! [String]
        
        // Do any additional setup after loading the view.
        //テーブルビューはviewcontrollerswiftで表示する、という設定
        table.dataSource = self
        table.delegate = self
        
        MemoArray = []
    }
    
        func viewWillAppear(_ animated: Bool) {
        
        //ユーザーデフォルトに保存してあるものを取り出す。
        //配列に取り出したものを入れる。
        if saveData.object(forKey: "title") != nil{
            //配列名.append(追加したいもの)
            MemoArray.append(saveData.object(forKey: "title") as! String)
            ContentArray.append(saveData.object(forKey: "content") as! String)
        }
        
        func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
        }
        
        table.reloadData()
    }
    
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        print("\(MemoArray[indexPath.row])が選ばれました！")
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        performSegue(withIdentifier: "toNextViewController" , sender: nil)
    }

    }
}

