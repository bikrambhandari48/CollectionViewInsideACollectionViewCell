//
//  Cell2.swift
//  StackOverFlowAnswer
//
//  Created by BIKRAM BHANDARI on 19/6/17.
//  Copyright © 2017 BIKRAM BHANDARI. All rights reserved.
//

import UIKit

class ScheduleListCell: UICollectionViewCell {
    
    var scheduleList : ScheduleList?{
        didSet{
            if let time1 = scheduleList?.FirstHour, let time2 = scheduleList?.LastHour{ //Safely unwrap value and set the label
                practiceTime1Label.text = time1;
                practiceTime2Label.text = time2;
            }
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame);
        
        backgroundColor = UIColor(red: 57 / 255, green: 51 / 255, blue: 24 / 255, alpha: 1);
        setupViews();
    }
    
    func setupViews(){
        addSubview(practiceDateLabel);
        addSubview(practiceTime1Label);
        addSubview(practiceTime2Label);
        
        //Set position of default label
        practiceDateLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true;
        practiceDateLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true;
        practiceDateLabel.widthAnchor.constraint(equalTo: widthAnchor).isActive = true;
        practiceDateLabel.heightAnchor.constraint(equalToConstant:  50).isActive = true;
        
        //set position time label 1
        practiceTime1Label.leftAnchor.constraint(equalTo: leftAnchor).isActive = true;
        practiceTime1Label.topAnchor.constraint(equalTo: practiceDateLabel.bottomAnchor).isActive = true;
        practiceTime1Label.widthAnchor.constraint(equalTo: widthAnchor).isActive = true;
        practiceTime1Label.heightAnchor.constraint(equalToConstant: 20).isActive = true;
        
        //set position of time label 2
        practiceTime2Label.leftAnchor.constraint(equalTo: leftAnchor).isActive = true;
        practiceTime2Label.topAnchor.constraint(equalTo: practiceTime1Label.bottomAnchor).isActive = true;
        practiceTime2Label.widthAnchor.constraint(equalTo: widthAnchor).isActive = true;
        practiceTime2Label.heightAnchor.constraint(equalToConstant: 20).isActive = true;
    }
    
    let practiceDateLabel : UILabel = { //Label to display the text
        let label = UILabel();
        label.textAlignment = .center;
        label.font = UIFont.boldSystemFont(ofSize: 18);
        label.text = "Practice Date";
        label.translatesAutoresizingMaskIntoConstraints = false;
        return label;
    }();
    
    let practiceTime1Label : UILabel = { //Label to display the text
        let label = UILabel();
        label.textColor = UIColor.lightGray;
        label.textAlignment = .center;
        label.font = UIFont.boldSystemFont(ofSize: 16);
        label.translatesAutoresizingMaskIntoConstraints = false;
        return label;
    }();
    
    let practiceTime2Label : UILabel = { //Label to display the text
        let label = UILabel();
        label.textColor = UIColor.lightGray;
        label.textAlignment = .center;
        label.font = UIFont.boldSystemFont(ofSize: 16);
        label.translatesAutoresizingMaskIntoConstraints = false;
        return label;
    }();
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
