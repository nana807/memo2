//
//  ViewController.swift
//  memo2
//
//  Created by 藤沢七葉 on 2020/12/27.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource, UITableViewDelegate{
    
    var MemoNakami = [String]()

    let userDefaults = UserDefaults.standard

    @IBOutlet weak var TableView: UITableView!
    
    var observer: NSKeyValueObservation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewDidAppear(_ animated: Bool) {
        print(MemoNakami)
        if UserDefaults.standard.object(forKey: "TodoList") != nil {
            MemoNakami = UserDefaults.standard.object(forKey: "TodoList") as! [String]
        
//            observer = userDefaults.observe(\.todo, options: [.initial, .new]) { (_, change) in
//                        // クロージャーの中ではselfが必須になる
//                        self.MemoNakami = change.newValue ?? []
//                      //  self.tableView.reloadData()
//                    }
        
    }
    
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



    
    override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
        
        }
}

//extension UserDefaults {
//    @objc dynamic var todo: [String] {
//        return array(forKey: "todo") as? [String] ?? []
//    }
//}

}

