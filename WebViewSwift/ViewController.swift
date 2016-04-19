//
//  ViewController.swift
//  WebViewSwift
//
//  Created by Mohaiminul Islam on 4/19/16.
//  Copyright © 2016 infancyit. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate, UIScrollViewDelegate {

    @IBOutlet weak var webView: UIWebView!
    
    let url = "https://alwayscreative.net/"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let requestUrl = NSURL(string: url)
        let request = NSURLRequest(URL: requestUrl!)
        
        //delegates
        webView.delegate = self
        webView.scrollView.delegate = self
        
        //load request
        webView.dataDetectorTypes = UIDataDetectorTypes.All
        webView.loadRequest(request)
    }

    //Delegates: webView delegates
    func webViewDidFinishLoad(webView: UIWebView) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
    }
    
    func webViewDidStartLoad(webView: UIWebView) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
    }
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
        
        //error viewing code
        let alert = UIAlertController(title: "Alert", message: "\(error)", preferredStyle: UIAlertControllerStyle.Alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        return true
    }
    
    //Delegates: scrollView delegates
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return nil
    }


}

