//
//  CropController.swift
//  QuotesApp
//
//  Created by Bojan Savic on 9/26/19.
//  Copyright © 2019 Bojan Savic. All rights reserved.
//

import IGRPhotoTweaks
import UIKit
import HorizontalDial

class CropController: IGRPhotoTweakViewController {

    @IBOutlet weak var angleSlider: UISlider!
    @IBOutlet weak var angleLabel: UILabel!
    @IBOutlet weak var horizontalDial: HorizontalDial? {
        didSet {
            self.horizontalDial?.migneticOption = .none
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupSlider()
    }
    
    fileprivate func setupSlider() {
        self.angleSlider?.minimumValue = -Float(IGRRadianAngle.toRadians(90))
        self.angleSlider?.maximumValue = Float(IGRRadianAngle.toRadians(90))
        self.angleSlider?.value = 0.0
        
        setupAngleLabelValue(radians: CGFloat((self.angleSlider?.value)!))
    }

    fileprivate func setupAngleLabelValue(radians: CGFloat) {
        let intDegrees: Int = Int(IGRRadianAngle.toDegrees(radians))
        self.angleLabel?.text = "\(intDegrees)°"
    }
    
    // MARK: - Rotation
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        super.willTransition(to: newCollection, with: coordinator)
        
        coordinator.animate(alongsideTransition: { (context) in
            self.view.layoutIfNeeded()
        }) { (context) in
            //
        }
    }
    
    @IBAction func onChandeAngleSliderValue(_ sender: UISlider) {
        let radians: CGFloat = CGFloat(sender.value)
        setupAngleLabelValue(radians: radians)
        self.changeAngle(radians: radians)
    }
    
    @IBAction func onEndTouchAngleControl(_ sender: UISlider) {
        self.stopChangeAngle()
    }
    
    @IBAction func onTouchResetButton(_ sender: UIBarButtonItem) {
        self.angleSlider?.value = 0.0
        self.horizontalDial?.value = 0.0
        setupAngleLabelValue(radians: 0.0)
        
        self.resetView()
    }
    
    @IBAction func onTouchCancelButton(_ sender: UIBarButtonItem) {
        self.dismissAction()
    }
    
    @IBAction func onTouchCropButton(_ sender: UIBarButtonItem) {
        cropAction()
    }
    
    @IBAction func onTouchAspectButton(_ sender: UIBarButtonItem) {
        let actionSheet = UIAlertController(title: nil,
                                            message: nil,
                                            preferredStyle: .actionSheet)
        
        
        actionSheet.addAction(UIAlertAction(title: "Original", style: .default) { (action) in
            self.resetAspectRect()
        })
        
        actionSheet.addAction(UIAlertAction(title: "Squere", style: .default) { (action) in
            self.setCropAspectRect(aspect: "1:1")
        })
        
        actionSheet.addAction(UIAlertAction(title: "2:3", style: .default) { (action) in
            self.setCropAspectRect(aspect: "2:3")
        })
        
        actionSheet.addAction(UIAlertAction(title: "3:5", style: .default) { (action) in
            self.setCropAspectRect(aspect: "3:5")
        })
        
        actionSheet.addAction(UIAlertAction(title: "3:4", style: .default) { (action) in
            self.setCropAspectRect(aspect: "3:4")
        })
        
        actionSheet.addAction(UIAlertAction(title: "5:7", style: .default) { (action) in
            self.setCropAspectRect(aspect: "5:7")
        })
        
        actionSheet.addAction(UIAlertAction(title: "9:16", style: .default) { (action) in
            self.setCropAspectRect(aspect: "9:16")
        })
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        present(actionSheet, animated: true, completion: nil)
    }
    
    @IBAction func onTouchLockAspectRatioButton(_ sender: UISwitch) {
        self.lockAspectRatio(sender.isOn)
    }
    
//    override open func customCanvasInsets() -> UIEdgeInsets {
//        return UIEdgeInsets(top: UIDevice.current.orientation.isLandscape ? 40.0 : 100.0,
//                            left: 0,
//                            bottom: 0,
//                            right: 0)
//    }
}

extension CropController: HorizontalDialDelegate {
    func horizontalDialDidValueChanged(_ horizontalDial: HorizontalDial) {
        let degrees = horizontalDial.value
        let radians = IGRRadianAngle.toRadians(CGFloat(degrees))
        
        self.setupAngleLabelValue(radians: radians)
        self.changeAngle(radians: radians)
    }
    
    func horizontalDialDidEndScroll(_ horizontalDial: HorizontalDial) {
        self.stopChangeAngle()
    }
}
