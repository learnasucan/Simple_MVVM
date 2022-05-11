//
//  QuoteCell.swift
//  Simple Mvvm
//
//  Created by Prachit on 11/05/22.
//

import UIKit

class QuoteCell: UITableViewCell {

    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupCell(_ quote: QuoteCellVM){
        quoteLabel.text = quote.quoteText
        authorLabel.text = "--\(quote.authorText)"
    }
    
}
