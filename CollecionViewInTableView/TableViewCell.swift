//
//  TableViewCell.swift
//  UIKitCombine
//
//  Created by Sauvik Dolui on 09/09/20.
//

import UIKit


class CollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier: String  = "CollectionViewCell"
    @IBOutlet weak var indexPathLabel: UILabel!
    
}

protocol TableViewCellDelegate: AnyObject {
    func tableViewCell(_ : TableViewCell, atIndexPath tableCellIndexPath: IndexPath, didSelectCollectionItem item: CollectionViewCell, atIndexPath collectionCellIndexPath: IndexPath)
}
class TableViewCell: UITableViewCell {

    static let reuseIdentifier: String  = "TableViewCell"
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var cellIndexLabel: UILabel!
    var indexPath: IndexPath?
    weak var delegate: TableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

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

        return cell
    }


}
extension TableViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let tableViewCellIndexPath = self.indexPath,
            let cell = collectionView.cellForItem(at: indexPath) as? CollectionViewCell else {
            return
        }
        delegate?.tableViewCell(self,
                                atIndexPath: tableViewCellIndexPath,
                                didSelectCollectionItem: cell,
                                atIndexPath: indexPath)
    }
}
