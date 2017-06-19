//
//  Cell1.swift
//  StackOverFlowAnswer
//
//  Created by BIKRAM BHANDARI on 19/6/17.
//  Copyright © 2017 BIKRAM BHANDARI. All rights reserved.
//

import UIKit

// first UICollectionViewCell
class Cell1: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    let cellId = "CellId"; // same as above unique id
    var moreOptions = [MoreOptions]();
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        
        setupViews();
        
        getData();
        
        collectionView.register(Cell2.self, forCellWithReuseIdentifier: cellId); //register custom UICollectionViewCell class named Cell2
        
        
    }
    
    func getData(){
        
        // ********************* Read json from url **************************
//        URLSession.shared.dataTask(with: "some url") { (data, response, error) in
//            if error != nil{ //If error has some value then return
//                print(error);
//                return;
//            }
//            
//            do{
//                let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! [String:Any];
//                
//                for data in json["MoreOptions"] as! [[String: Any]]{
//                    let moreOption = MoreOptions();
//                    moreOption.setValuesForKeys(data); //Be careful. If the model has different attributes than that in JSON file then you will get error.
//                    
//                    moreOptions.append(moreOption) //Append in an array of moreOptions so that we can find number of items.
//                    
//                    DispatchQueue.main.async {
//                        self.collectionView.reloadData();
//                        print("Data reloaded");
//                    }
//                }
//            }
//        }
        
        
        
        // ******************** Read from offline json file *************************
        do{
            let file = Bundle.main.url(forResource: "JsonFile", withExtension: "json"); //Get file
            let data = try Data(contentsOf: file!); //Get content of file
            
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! [String:Any]; // Get data as json object
            
            for data in json["MoreOptions"] as! [[String: Any]]{ //Loop through all the array of objects
                let moreOption = MoreOptions();
                moreOption.setValuesForKeys(data); //Set value from json data. Be careful of potential error if name doesn't matches
                
                moreOptions.append(moreOption)
            }
            
        }catch let err{
            print(err);
        }
    }
    
    func setupViews(){
        addSubview(collectionView);
        
        collectionView.delegate = self;
        collectionView.dataSource = self;
        
        collectionView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true;
        collectionView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true;
        collectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true;
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true;
    }
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout();
        layout.scrollDirection = .horizontal; //set scroll direction to horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout);
        cv.backgroundColor = .blue; //testing
        cv.translatesAutoresizingMaskIntoConstraints = false;
        return cv;
    }();
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! Cell2 ;
        cell.backgroundColor = .red;
        cell.moreOption = moreOptions[indexPath.item];
        return cell;
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return moreOptions.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 100);
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
