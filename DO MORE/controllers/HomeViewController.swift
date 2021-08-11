//
//  HomeViewController.swift
//  DO MORE
//
//  Created by Oybek To’laboyev on 10/08/21.
//

import UIKit

class HomeViewController: UIViewController , UICollectionViewDataSource,UICollectionViewDelegate {

    
    let numberOfColumns: CGFloat = 2
    var items:Array<Item> = Array()
    @IBOutlet var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

    initViews()
    }
    
    //Mark methods
    
    func initViews(){
        addNavigationBar()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        self.collectionView.register(UINib(nibName: "ItemCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "myCell")
        if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout{
            let screenSize: CGRect  = UIScreen.main.bounds
            let cellWidth = screenSize.width / numberOfColumns - 15
            flowLayout.itemSize = CGSize(width: cellWidth, height: cellWidth)
        }
        items.append(Item(tittle: "Hello", image: "nature1"))
        items.append(Item(tittle: "Hello", image: "nature2"))
        items.append(Item(tittle: "Hello", image: "nature1"))
        items.append(Item(tittle: "Hello", image: "nature2"))
        items.append(Item(tittle: "Hello", image: "nature1"))
        items.append(Item(tittle: "Hello", image: "nature2"))
        items.append(Item(tittle: "Hello", image: "nature1"))
        items.append(Item(tittle: "Hello", image: "nature2"))
        items.append(Item(tittle: "Hello", image: "nature1"))
        items.append(Item(tittle: "Hello", image: "nature2"))
        items.append(Item(tittle: "Hello", image: "nature2"))
        items.append(Item(tittle: "Hello", image: "nature1"))
        items.append(Item(tittle: "Hello", image: "nature2"))
        
    }
    
    func addNavigationBar(){
       let scroll = UIImage(systemName: "text.justifyright")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: scroll, style: .plain, target: self, action: #selector(scrollTapped))
        title = "Collection View"
    }
    func callScrollController(){
        let vc = scrollViewController(nibName: "scrollViewController", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //Actions
    @objc func scrollTapped(){
        callScrollController()
    }
    
    //Mark collectionView
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = items[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! ItemCollectionViewCell
        cell.cellImage.image = UIImage(named: item.image!)
        cell.cellLabel.text = item.tittle
        return cell
    }

}
