//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Stefan on 29.12.15.
//  Copyright © 2015 Stefan Billeb. All rights reserved.
//

import UIKit

class RatingControl: UIView {

    // MARK: Properties
    var rating = 0 {
        didSet {
            setNeedsLayout()
        }
    }
    var ratingButtons = [UIButton]()
    
    
    // MARK: Initialization
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let filledStarImage = UIImage(named: "filledStar")
        let emptyStarImage = UIImage(named: "emptyStar")
        
        for _ in 0..<5 {
            let button = UIButton()
            button.setImage(emptyStarImage, forState: .Normal)
            button.setImage(filledStarImage, forState: .Selected)
            button.setImage(filledStarImage, forState: [.Highlighted, .Selected])
            
            button.adjustsImageWhenHighlighted = false
            
            button.addTarget(self, action: "ratingButtonTapped:", forControlEvents: .TouchDown)
            ratingButtons += [button]
            addSubview(button)
        }
        
        
        
    }
    
    override func intrinsicContentSize() -> CGSize {
        let buttonsize = Int(frame.size.height)
        let spacing = 4
        let stars = 5
        let width = (buttonsize + spacing) * stars
        
        
        return CGSize(width: width, height: buttonsize)
    }
    
    // MARK: Action Button
    func ratingButtonTapped(button: UIButton) {
        print("Button pressed!")
        rating = ratingButtons.indexOf(button)! + 1
        
        updateButtonSelectionStates()
    }
    
    override func layoutSubviews() {
        let buttonsize = Int(frame.size.height)

        
        
        var buttonFrame = CGRect(x: 0, y: 0, width: buttonsize, height: buttonsize)
        
        // Offset the buttons for alignment
        for(index, button) in ratingButtons.enumerate() {
            buttonFrame.origin.x = CGFloat(index * (buttonsize + 5))
            button.frame = buttonFrame
        }
        
        updateButtonSelectionStates()
    }
    
    func updateButtonSelectionStates() {
        for(index, button) in ratingButtons.enumerate() {
            button.selected = index < rating;
        }
    }
    

}
