//
//  BookCell.swift
//  BookCollection
//
//  Created by Benjamin Dumont on 29/08/2017.
//  Copyright © 2017 BCFactory. All rights reserved.
//

import UIKit

class BookCell : UITableViewCell {
    @IBOutlet weak var coverImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var eanLabel: UILabel!
    @IBOutlet weak var authorsLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    
    func initWithBook(book: Book) {
        self.titleLabel.text = book.title ?? ""
        self.eanLabel.text = book.ean ?? ""
        self.authorsLabel.text = ""
        self.quantityLabel.text = String(book.quantity)
    }
}
