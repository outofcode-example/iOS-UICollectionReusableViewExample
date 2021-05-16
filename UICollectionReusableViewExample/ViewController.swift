//
//  ViewController.swift
//  UICollectionReusableViewExample
//
//  Created by Donghyuk on 2021/05/16.
//

import UIKit

final class ViewController: UIViewController {
    
    private let headerReusableId = "HeaderReusableView"
    private let cellReusableId = "CollectionViewCell"
    
    private lazy var collectionView: UICollectionView = { [unowned self] in
        let view = UICollectionView(frame: .zero, collectionViewLayout: self.collectionViewFlowLayout)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var collectionViewFlowLayout: UICollectionViewFlowLayout = {
        let layout = StretchableUICollectionViewFlowLayout()
        layout.sectionInset = .init(top: 10, left: 0, bottom: 0, right: 0)
        layout.headerReferenceSize = CGSize(width: UIScreen.main.bounds.width, height: 300)
        return layout
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
    }
}

private extension ViewController {
    func setupCollectionView() {
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        collectionView.register(CollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerReusableId)
        
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: cellReusableId)
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 300
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReusableId, for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerReusableId, for: indexPath)
            return headerView
        default:
            #if DEBUG
            assert(false, "Don't use this kind.")
            #else
            return UICollectionReusableView()
            #endif
            
        }
    }
}
