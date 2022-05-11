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
        vm.getQuotes()
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
        return vm.quotesCellVM.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! QuoteCell
        
        let quote = vm.quotesCellVM[indexPath.row]
        cell.setupCell(quote)
        
        return cell
    }
}
