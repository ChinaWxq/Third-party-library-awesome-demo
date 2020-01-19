//
//  ViewController.swift
//  UICollectionViewTest
//
//  Created by Ryan on 2020/1/19.
//  Copyright © 2020 Ryan. All rights reserved.
//

import UIKit
import CollectionViewSlantedLayout

let frame = UIScreen.main.bounds
let ScreenWidth = frame.width
let ScreenHeight = frame.height

class ViewController: UIViewController {
    
    fileprivate var data = ["1","2","3","4","5","6","7","8","9"]
    
    fileprivate let id = "reusedCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
    }

    lazy var collectionView: UICollectionView = {
        let layout = CollectionViewSlantedLayout()
        layout.isFirstCellExcluded = true //禁用第一个单元格倾斜，默认false
        layout.isLastCellExcluded = true //禁用最后一个单元格倾斜，默认false
        layout.scrollDirection = .vertical//设置滚动方向，默认vertical
        layout.slantingDirection = .upward//设置倾斜方向，默认upward
        layout.slantingSize = 60//设置倾斜大小，默认75
        //layout.zIndexOrder = .descending
        
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 40, width: ScreenWidth, height: ScreenHeight - 80), collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CustomerCell.classForCoder(), forCellWithReuseIdentifier: id)
        return collectionView
    }()
    
    func setupView() {
        self.view.addSubview(collectionView)
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: id, for: indexPath) as? CustomerCell else {
            fatalError()
        }
        cell.imageView.image = UIImage(named: data[indexPath.row])
        return cell
    }
    
}

extension ViewController: CollectionViewDelegateSlantedLayout {
    //set the size of items 制定单元格大小
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: CollectionViewSlantedLayout, sizeForItemAt indexPath: IndexPath) -> CGFloat {
        return collectionViewLayout.scrollDirection == .vertical ? 225 : 325
    }
}
