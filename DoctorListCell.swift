//
//  Cell1.swift
//  StackOverFlowAnswer
//
//  Created by BIKRAM BHANDARI on 19/6/17.
//  Copyright © 2017 BIKRAM BHANDARI. All rights reserved.
//

import UIKit

// first UICollectionViewCell
class DoctorListCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    let cellId = "CellId"; // same as above unique id
    
    var doctorList : DoctorList?{ //DoctorList gets set from ViewController Class from
        //cell.doctorList = doctorsList?[indexPath.item]
        didSet{
            if let doctorName = doctorList?.DoctorName{ //Safely unwrap the value and set it to label
                doctorNameLabel.text = doctorName;
            }
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame);
        
        setupViews();
        
        collectionView.register(ScheduleListCell.self, forCellWithReuseIdentifier: cellId); //register custom UICollectionViewCell class named Cell2
    }
    
    func setupViews(){
        
        addSubview(doctorImageView);
        addSubview(doctorNameLabel);
        addSubview(collectionView); // Add collection view to collection view cell
        
        // set doctorImageView's anchor properites
        doctorImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true;
        doctorImageView.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true;
        doctorImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true;
        doctorImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true;
        
        //set doctorNameLabel size and position
        doctorNameLabel.leftAnchor.constraint(equalTo: doctorImageView.rightAnchor, constant: 10).isActive = true;
        doctorNameLabel.centerYAnchor.constraint(equalTo: doctorImageView.centerYAnchor).isActive = true;
        doctorNameLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true;
        doctorNameLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true;
        
        
        collectionView.delegate = self; //make delegate and data source to self
        collectionView.dataSource = self;
        
        //Since we are inside a collection view cell. leftAnchor means collectionViewCell.left anchor and same as this to other anchors
        collectionView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true; //Define size and position of collection vie
        collectionView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true;
        collectionView.topAnchor.constraint(equalTo: doctorImageView.bottomAnchor, constant: 20).isActive = true;
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true;
    }
    
    let collectionView: UICollectionView = { //Collection view
        let layout = UICollectionViewFlowLayout();
        layout.scrollDirection = .horizontal; //set scroll direction to horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout);
        cv.backgroundColor = UIColor.blue
        cv.translatesAutoresizingMaskIntoConstraints = false;
        return cv;
    }();
    
    let doctorImageView: UIImageView = {
        let iv = UIImageView();
        iv.image = UIImage(named: "Doctor") //Use default image. You can use the Image from json file and set it. You must set it on didSet method above.
        iv.translatesAutoresizingMaskIntoConstraints = false;
        return iv;
        
    }();
    
    let doctorNameLabel: UILabel = { //Label to hold doctor name. See the screen shot
        let label = UILabel();
        label.text = "Doctor name";
        label.textAlignment = .center;
        label.font = UIFont.systemFont(ofSize: 18);
        label.translatesAutoresizingMaskIntoConstraints = false;
        return label;
    }();
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ScheduleListCell ; //Cast cell as ScheduleListCell so that we can set each doctor's schedule
        cell.scheduleList = doctorList?.Schedule?[indexPath.item]; //Set the scheduleList in ScheduleListCell. Same as we did in ViewController class
        return cell;
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = doctorList?.Schedule?.count{
            return count; //Count the number of schedules for a doctor and return it
        }
        return 0;
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 150); //set the size of each cell
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
