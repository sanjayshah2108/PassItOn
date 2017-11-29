//
//  MyPostsTableViewController.swift
//  ItsFree
//
//  Created by Sanjay Shah on 2017-11-28.
//  Copyright © 2017 Sanjay Shah. All rights reserved.
//

import UIKit
import FirebaseStorage
import FirebaseDatabase

class MyPostsTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    
    @IBOutlet weak var myPostsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        myPostsTableView.delegate = self
        myPostsTableView.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 1:
            return (AppData.sharedInstance.currentUser?.offeredItems.count)!
        case 2:
            return (AppData.sharedInstance.currentUser?.requestedItems.count)!
        default:
            return 0
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "myPostsTableViewCell")
        
        return cell!
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
