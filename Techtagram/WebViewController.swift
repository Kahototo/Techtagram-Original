//
//  ViewController.swift
//  ColorPanel
//
//  Created by 小西夏穂 on 2018/02/12.
//  Copyright © 2018年 小西夏穂. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController,WKNavigationDelegate {
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 表示するWEBサイトのURLを設定します。
        let url = URL(string: "https://www.pinterest.jp")
        let urlRequest = URLRequest(url: url!)
        
        // webViewで表示するWEBサイトの読み込みを開始します。
        webView.load(urlRequest)
        
    }
    
    // WEBサイトの読み込みを開始する時に呼ばれる
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        
        // インジケータの表示を開始する
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    // WEBサイトの読み込みを完了した時に呼ばれる
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        // インジケータの表示を終了する
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
