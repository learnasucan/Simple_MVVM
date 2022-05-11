//
//  QuoteVC.swift
//  Simple Mvvm
//
//  Created by Prachit on 11/05/22.
//

import UIKit

class QuoteVC: UIViewController {

    let identifier = "cell"
    
    var tableview: UITableView  = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    var vm: QuoteViewModelService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableview)
        tableview.frame = view.bounds
        tableview.dataSource = self
       
        let nib = UINib(nibName: "QuoteCell", bundle: nil)
        tableview.register(nib, forCellReuseIdentifier: identifier)
        
        vm = QuoteViewModel()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        vm.loadSuccess = {
            DispatchQueue.main.async {
                self.tableview.reloadData()
            }
        }
    }
}


extension QuoteVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.quotes?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! QuoteCell
        guard let quotes = vm.quotes else { return  UITableViewCell() }
        let quote = quotes[indexPath.row]
        cell.quoteLabel.text = quote.quote
        cell.authorLabel.text = "--\(quote.author)"
        
        return cell
    }
    
    
}
