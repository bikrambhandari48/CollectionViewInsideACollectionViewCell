//
//  Cell2.swift
//  StackOverFlowAnswer
//
//  Created by BIKRAM BHANDARI on 19/6/17.
//  Copyright © 2017 BIKRAM BHANDARI. All rights reserved.
//

import UIKit

class Cell2: UICollectionViewCell {
    
    var moreOption: MoreOptions?{
        didSet{
            if let name = moreOption?.name{
                label.text = name;
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        
        setupViews();
    }
    
    func setupViews(){
        addSubview(label);
        
        label.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true;
        label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true;
        label.widthAnchor.constraint(equalTo: widthAnchor, constant: -20).isActive = true;
        label.heightAnchor.constraint(equalToConstant: 50).isActive = true;
    }
    
    let label : UILabel = { //Label to display the text
        let label = UILabel();
        label.translatesAutoresizingMaskIntoConstraints = false;
        return label;
    }();
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
