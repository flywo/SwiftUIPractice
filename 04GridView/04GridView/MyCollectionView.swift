//
//  MyCollectionView.swift
//  04GridView
//
//  Created by yuhua on 2019/10/31.
//  Copyright © 2019 yh. All rights reserved.
//

import SwiftUI

struct Model: Hashable {
    let id: Int
    static func == (lhs: Model, rhs: Model) -> Bool {
        return lhs.id == rhs.id
    }
}

struct MyCollectionView: UIViewRepresentable {
    
    typealias UIViewType = UICollectionView
    
    @Binding var shapshot: NSDiffableDataSourceSnapshot<Int, Model>
    @Binding var showDelete: Bool
    var selected: (Int)->Void
    
    func makeUIView(context: UIViewRepresentableContext<MyCollectionView>) -> UICollectionView {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumLineSpacing = 10
        flowLayout.minimumInteritemSpacing = 10
        let width = (UIScreen.main.bounds.width-44)/3
        flowLayout.itemSize = CGSize(width: width, height: width)
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .white
        collectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        let dataSource = UICollectionViewDiffableDataSource<Int, Model>(collectionView: collectionView) { (collectionView, indexPath, object) -> MyCollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! MyCollectionViewCell
            cell.iv.image = UIImage(systemName: "\(indexPath.row+1).circle")?.withTintColor(.orange, renderingMode: .alwaysOriginal)
            return cell
        }
        collectionView.delegate = context.coordinator
        context.coordinator.dataSorce = dataSource
        dataSource.apply(shapshot, animatingDifferences: true) {
            print("数据加载完成")
        }
        return collectionView
    }
    
    func updateUIView(_ uiView: UICollectionView, context: UIViewRepresentableContext<MyCollectionView>) {
        context.coordinator.dataSorce?.apply(shapshot, animatingDifferences: true) {
            print("刷新数据完成")
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    class Coordinator: NSObject, UICollectionViewDelegate {
        var parent: MyCollectionView
        
        var dataSorce: UICollectionViewDiffableDataSource<Int, Model>?
        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            print("点击")
            parent.selected(indexPath.row)
            parent.showDelete = true
        }
        
        init(parent: MyCollectionView) {
            self.parent = parent
        }
    }
}
