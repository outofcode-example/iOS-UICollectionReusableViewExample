//
//  CollectionViewCell.swift
//  UICollectionReusableViewExample
//
//  Created by Donghyuk on 2021/05/16.
//

import UIKit

final class CollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
    }
}

extension CollectionViewCell {
    
    private func setUp() {
        backgroundColor = .darkGray
    }
}
