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
    var doctorsList : [DoctorList]?; //Create array of DoctorList
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white;
        collectionView.register(DoctorListCell.self, forCellWithReuseIdentifier: cellId) //register collection view cell class
        setupViews(); //setup all views
        
        //        doctorsList = DoctorList.getDoctorList();
        
        DoctorList.doctorList { (doctorsList) in //Call the completion hanler
            self.doctorsList = doctorsList; //set the above defined doctorsArray with the returned doctorsArray from Model Class
        }
        
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
        cv.backgroundColor = .white;
        cv.translatesAutoresizingMaskIntoConstraints = false; //set it to false so that we can suppy constraints
        return cv;
    }();
    
    //deque cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! DoctorListCell; //Downcast the collection view as DoctorListCell
        cell.doctorList = doctorsList?[indexPath.item] //Set value of DoctorList on DoctorListCell
        return cell;
    }
    
    // number of rows
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = doctorsList?.count { //Count number of doctors
            return count; //return the value
        }
        return 0;
    }
    
    //size of each CollecionViewCell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 300); // Size of each cell
    }
}

