//
//  TableViewCell.swift
//  UIKitCombine
//
//  Created by Sauvik Dolui on 09/09/20.
//

import UIKit

// MARK: - Collection View Cell Class
class CollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier: String  = "CollectionViewCell"
    @IBOutlet weak var indexPathLabel: UILabel!
}

// MARK: - TableViewCellDelegate
protocol TableViewCellDelegate: AnyObject {
    func tableViewCell(_ : TableViewCell, atIndexPath tableCellIndexPath: IndexPath, didSelectCollectionItem item: CollectionViewCell, atIndexPath collectionCellIndexPath: IndexPath)
}
// MARK: - TableViewCell
class TableViewCell: UITableViewCell {

    static let reuseIdentifier: String  = "TableViewCell"
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var cellIndexLabel: UILabel!
    var indexPath: IndexPath?
    weak var delegate: TableViewCellDelegate?
}
// MARK: - UICollectionViewDataSource
extension TableViewCell: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath:
        IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.reuseIdentifier, for: indexPath) as! CollectionViewCell
        cell.indexPathLabel.text = "(\(indexPath.section), \(indexPath.item))"
        // TODO: more configuration to do?
        return cell
    }
}
// MARK: - UICollectionViewDelegate
extension TableViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let tableViewCellIndexPath = self.indexPath,
            let cell = collectionView.cellForItem(at: indexPath) as? CollectionViewCell else {
            return
        }
        // Message delegate(CollectionViewInTableViewVC) about selection event from collection view cell
        delegate?.tableViewCell(self,
                                atIndexPath: tableViewCellIndexPath,
                                didSelectCollectionItem: cell,
                                atIndexPath: indexPath)
    }
}
