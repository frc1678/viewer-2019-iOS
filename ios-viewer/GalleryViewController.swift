//
//  GalleryViewController.swift
//  ios-viewer
//
//  Created by Ludi Wang on 2/7/19.
//  Copyright © 2019 brytonmoeller. All rights reserved.
//

import UIKit

class GalleryViewController: UIViewController, UICollectionViewFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource, UIScrollViewDelegate {
    
    var firebaseFetcher = AppDelegate.getAppDelegate().firebaseFetcher
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func prepare() {
        super.prepare()
        
        guard let collectionView = collectionView else { return }
        
        let availableWidth = collectionView.bounds.inset(by: collectionView.layoutMargins).width
        let maxNumColumns = 2
        let cellWidth = (availableWidth / CGFloat(maxNumColumns)).rounded(.down)
        
        self.itemSize = CGSize(width: cellWidth, height: cellWidth)
        self.sectionInset = UIEdgeInsets(top: self.minimumInteritemSpacing, left: 0.0, bottom: 0.0, right: 0.0)
        self.sectionInsetReference = .fromSafeArea
    }
    
    func collectionView(_collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return imageUrls.count
    }
}
