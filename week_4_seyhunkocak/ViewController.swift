//
//  ViewController.swift
//  week_4_seyhunkocak
//
//  Created by Seyhun Koçak on 11.06.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private var coinData : [JsonObject] = []


    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchData()
        
    }
    
    private func setupUI(){
            tableView.delegate = self
            tableView.dataSource = self
            
            let cellNib = UINib(nibName: "TableViewCell", bundle: nil)
            tableView.register(cellNib, forCellReuseIdentifier: "myCell")
        }
    private func fetchData(){
            
            if let url = URL.init(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc"){
                let task = URLSession.shared.dataTask(with: url) { [unowned self ]data, response, error in
                    
                    do{
                        guard let data = data else {
                            return
                        }
                        let object = try JSONDecoder().decode([JsonObject].self, from: data)
                        self.coinData = object
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                        
                    } catch {
                        print(error)
                    }
                }
                task.resume()
            }
            
        }
            
        }
    



extension ViewController : UITableViewDelegate{
    
}

extension ViewController : UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coinData.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! TableViewCell
        let rowItem = coinData[indexPath.row]
        
        if rowItem.cryptoChangePercentage24h < 0 {
            cell.coinValueLabel.text = String(format: "%.3f", rowItem.cryptoChangePercentage24h)
            cell.coinValueLabel.textColor = .systemRed
        }else {
            cell.coinValueLabel.text = String(format: "%.3f", rowItem.cryptoChangePercentage24h)
            cell.coinValueLabel.textColor = .systemGreen
        }
    
        cell.coinLabel.text = rowItem.cryptoName
       
        
        cell.coinSymbolView.loadFrom(URLAddress: rowItem.cryptoLogoUrl)
       
        return cell
    }

}
extension UIImageView {
    func loadFrom(URLAddress: String) {
        guard let url = URL(string: URLAddress) else {
            return
        }
        
        DispatchQueue.main.async { [weak self] in
            if let imageData = try? Data(contentsOf: url) {
                if let loadedImage = UIImage(data: imageData) {
                        self?.image = loadedImage
                }
            }
        }
    }
}


