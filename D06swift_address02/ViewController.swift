//
//  ViewController.swift
//  D06swift_address02
//
//  Created by 20141105043dj on 16/7/4.
//  Copyright © 2016年 20141105043dj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var db:SQLiteDB!

    @IBOutlet weak var txtUname: UITextField!
    @IBOutlet weak var txtMobile: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        db = SQLiteDB.sharedInstance()
        
        db.execute("create table if not exists t_user(uid integer primary key,unamevarchar(20),mobile varchar(20))")
        
        initUser ()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    
    @IBAction func saveClicked(sender: AnyObject) {
        
        saveUser ()
    }
    
    func initUser () {
        let data = db.query("select * from t_user")
        if data.count > 0 {
            let user = data[data.count - 1]
            txtUname.text = user["uname"] as? String
            txtMobile.text = user["mobile"] as? String
        }
    }
    
    func saveUser () {
        let uname = self.txtUname.text!
        let mobile = self.txtMobile.text!
        let sql = "insert into t_user(uname,mobile) values('\(uname)','\(mobile)')"
        print("sql: \(sql)")
        let result = db.execute(sql)
        print(result)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

