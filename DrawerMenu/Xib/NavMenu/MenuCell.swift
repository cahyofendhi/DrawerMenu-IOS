//
//  MenuCell.swift
//  E-Service
//
//  Created by Rumah Ulya on 03/09/18.
//  Copyright © 2018 Rumah Ulya. All rights reserved.
//

import UIKit

open class MenuCell: UITableViewCell {

    
    @IBOutlet weak var labelName: UILabel!
    
    fileprivate var vibrancyView:UIVisualEffectView = UIVisualEffectView()
    fileprivate var vibrancySelectedBackgroundView:UIVisualEffectView = UIVisualEffectView()
    fileprivate var defaultSelectedBackgroundView:UIView?
    open var blurEffectStyle: UIBlurEffectStyle? {
        didSet {
            updateBlur()
        }
    }
    
    // For registering with UITableView without subclassing otherwise dequeuing instance of the cell causes an exception
    public override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        vibrancyView.frame = bounds
        vibrancyView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        for view in subviews {
            vibrancyView.contentView.addSubview(view)
        }
        addSubview(vibrancyView)
        
        let blurSelectionEffect = UIBlurEffect(style: .light)
        vibrancySelectedBackgroundView.effect = blurSelectionEffect
        defaultSelectedBackgroundView = selectedBackgroundView
        
        updateBlur()
    }
    
    internal func updateBlur() {
        // shouldn't be needed but backgroundColor is set to white on iPad:
        backgroundColor = UIColor.clear
        
        if let blurEffectStyle = blurEffectStyle, !UIAccessibilityIsReduceTransparencyEnabled() {
            let blurEffect = UIBlurEffect(style: blurEffectStyle)
            vibrancyView.effect = UIVibrancyEffect(blurEffect: blurEffect)
            
            if selectedBackgroundView != nil && selectedBackgroundView != vibrancySelectedBackgroundView {
                vibrancySelectedBackgroundView.contentView.addSubview(selectedBackgroundView!)
                selectedBackgroundView = vibrancySelectedBackgroundView
            }
        } else {
            vibrancyView.effect = nil
            selectedBackgroundView = defaultSelectedBackgroundView
        }
    }
}
