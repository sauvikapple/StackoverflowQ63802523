//
//  CollectionViewInTableViewVC.swift
//  UIKitCombine
//
//  Created by Sauvik Dolui on 09/09/20.
//

import UIKit

class CollectionViewInTableViewVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

// MARK: UITableViewDataSource
extension CollectionViewInTableViewVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.reuseIdentifier, for: indexPath) as! TableViewCell
        cell.indexPath = indexPath
        cell.delegate = self
        cell.cellIndexLabel.text = "[\(indexPath.section),\(indexPath.row)]"
        
        
        return cell
    }
    
    
}

// MARK:
extension CollectionViewInTableViewVC: TableViewCellDelegate {
    func tableViewCell(_ : TableViewCell, atIndexPath tableCellIndexPath: IndexPath, didSelectCollectionItem item: CollectionViewCell, atIndexPath collectionCellIndexPath: IndexPath) {
        print("Table Cell IndexPath: \(tableCellIndexPath)")
        print("Collection Cell IndexPath: \(collectionCellIndexPath)")
    }
    
    
}
