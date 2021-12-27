//
//  DetailViewController.swift
//  adding
//
//  Created by Ragulmoorthi on 27/12/21.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var table: UITableView!
    var Table  =  " "
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        // Do any additional setup after loading the view.
    }
    @IBAction func add(_ sender: Any) {
        
        let editVc = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        
    }
    
    }


extension DetailViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Enter the Details")
       
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 16
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell (withIdentifier: "Detailcell",for: indexPath)
        cell.textLabel?.text =  ""
         return cell
    }
    func tableView (_ tableview: UITableView, editingStyleForRowAt indexpath: IndexPath)-> UITableViewCell.EditingStyle{
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
      if editingStyle == .delete {
        print("Deleted")
      }
    }
}
