////
////  QuoteDisplayVCViewController.swift
////  Simple Mvvm
////
////  Created by Prachit on 10/05/22.
////
//
//import UIKit
//
//class QuoteDisplayVC: UIViewController {
//
//    let identifier = "cell"
//    
//    var tableview: UITableView  = {
//        let table = UITableView()
//        table.translatesAutoresizingMaskIntoConstraints = false
//        return table
//    }()
//    
//    var quotes = [Quote]()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
////        self.view.backgroundColor = .red
//        view.addSubview(tableview)
//        tableview.frame = view.bounds
//        tableview.dataSource = self
//       
//        let nib = UINib(nibName: "QuoteCell", bundle: nil)
//        tableview.register(nib, forCellReuseIdentifier: identifier)
//    }
//    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        APISource.getQuotes { quotes in
//            print(quotes.count)
//            self.quotes = quotes
//            DispatchQueue.main.async {
//                self.tableview.reloadData()
//            }
//        }
//
//    }
//}
//
//
//extension QuoteDisplayVC: UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return quotes.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! QuoteCell
//        
//        let quote = quotes[indexPath.row]
//        cell.quoteLabel.text = quote.quote
//        cell.authorLabel.text = "--\(quote.author)"
//        
//        return cell
//    }
//    
//    
//}
