//
//  BusyActivityView.swift
//  ItsFree
//
//  Created by Sanjay Shah on 2018-07-26.
//  Copyright © 2018 Sanjay Shah. All rights reserved.
//

import UIKit

class BusyActivityView: NSObject {

    static var activityIndicatorOverlayView: UIView!
    static var activityIndicatorView: UIActivityIndicatorView!
    static var timer: Timer!
    
    class func show(inpVc: UIViewController)
    {
        //need this for the loginVC, where UIApplication.shared.keyWindow is still nil
        var frame: CGRect
        
//        if let window = UIApplication.shared.keyWindow {
//            frame = window.bounds
//        }
//        else {
//            frame = inpVc.view.bounds
//        }
        
        activityIndicatorOverlayView = UIView()
        activityIndicatorOverlayView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        activityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
        activityIndicatorView.hidesWhenStopped  = true
        
        //activityIndicatorView.frame = activityIndicatorOverlayView.frame
        
        if let navigationController = inpVc.navigationController {
            
            activityIndicatorOverlayView.frame = navigationController.view.bounds
            navigationController.view.addSubview(activityIndicatorOverlayView)
            navigationController.view.bringSubview(toFront: activityIndicatorOverlayView)
            
            
        }
        else {
            
            if let window = UIApplication.shared.keyWindow {
                
                activityIndicatorOverlayView.frame = window.bounds
                window.addSubview(activityIndicatorOverlayView)
                window.bringSubview(toFront: activityIndicatorOverlayView)
            }
            else {
                activityIndicatorOverlayView.frame = inpVc.view.bounds
                inpVc.view.addSubview(activityIndicatorOverlayView)
                
            }
        }
        
        
        activityIndicatorOverlayView.addSubview(activityIndicatorView)
        activityIndicatorView.center = activityIndicatorOverlayView.center
        
        
        activityIndicatorView.startAnimating()
        
        timer = Timer.scheduledTimer(withTimeInterval: 60.0,
                                     repeats: false)
        { (myTimer) in
            activityIndicatorOverlayView.removeFromSuperview();
            
            Alert.Show(inpVc: inpVc,
                       customAlert: nil,
                       inpTitle: "Hmmmm..",
                       inpMessage: "This is taking too long, there might be an issue with the network. Please try again in a while",
                       inpOkTitle: "Ok");
        }
    }
    
    
    class func hide() -> Void
    {
        timer.invalidate();
        
        if (activityIndicatorView != nil){
        
        activityIndicatorView.stopAnimating()
        
        activityIndicatorView.removeFromSuperview()
        activityIndicatorOverlayView.removeFromSuperview();
        
        activityIndicatorView = nil
        activityIndicatorOverlayView = nil
        }
    }
    
    
    
    
    
    
    
}
