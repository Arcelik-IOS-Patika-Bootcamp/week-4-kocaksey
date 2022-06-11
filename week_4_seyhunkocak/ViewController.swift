//
//  ViewController.swift
//  week_4_seyhunkocak
//
//  Created by Seyhun Koçak on 11.06.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        
        // Do any additional setup after loading the view.
    }
    
    private func setupUI(){
            tableView.delegate = self
            tableView.dataSource = self
            
            let cellNib = UINib(nibName: "TableViewCell", bundle: nil)
            tableView.register(cellNib, forCellReuseIdentifier: "myCell")
        }
    



}
extension ViewController : UITableViewDelegate{
    
}

extension ViewController : UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! TableViewCell
        return cell
    }

}


