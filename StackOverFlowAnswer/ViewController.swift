//
//  ViewController.swift
//  StackOverFlowAnswer
//
//  Created by BIKRAM BHANDARI on 18/6/17.
//  Copyright © 2017 BIKRAM BHANDARI. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let cellId = "CellId"; //Unique cell id
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red; //just to test
        
        collectionView.register(Cell1.self, forCellWithReuseIdentifier: cellId) //register collection view cell class
        setupViews(); //setup all views
    }
    
    func setupViews() {
        
        view.addSubview(collectionView); // add collection view to view controller
        collectionView.delegate = self; // set delegate
        collectionView.dataSource = self; //set data source
        
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true; //set the location of collection view
        collectionView.rightAnchor.constraint(equalTo:  view.rightAnchor).isActive = true; // top anchor of collection view
        collectionView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true; // height
        collectionView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true; // width
        
    }
    
    let collectionView: UICollectionView = { // collection view to be added to view controller
        let cv = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()); //zero size with flow layout
        cv.translatesAutoresizingMaskIntoConstraints = false; //set it to false so that we can suppy constraints
        cv.backgroundColor = .yellow; // test
        return cv;
    }();
    
    //deque cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath);
        //        cell.backgroundColor = .blue;
        return cell;
    }
    
    // number of rows
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1;
    }
    
    //size of each CollecionViewCell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 200);
    }
}

