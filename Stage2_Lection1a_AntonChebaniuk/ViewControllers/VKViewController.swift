//
//  VKViewController.swift
//  Stage2_Lection1a_AntonChebaniuk
//
//  Created by Anton Chebaniuk on 14.02.2021.
//

import UIKit
import WebKit
import RealmSwift

class VkLoginViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidAppear(_ animated: Bool) {
        performSegue(withIdentifier: "toTabBarController", sender: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        retreiveData()

        // Do any additional setup after loading the view.
        webView.navigationDelegate = self
        var components = URLComponents()
        components.scheme = "https"
        components.host = "oauth.vk.com"
        components.path = "/authorize"
        components.queryItems = [
            URLQueryItem(name: "client_id", value: "7761576"), //7172257
            URLQueryItem(name: "scope", value: "262150"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "v", value: "5.92")
        ]
        
        let request = URLRequest(url: components.url!)
        webView.load(request)
    }
    
    func retreiveData() {
        do {
            let realm = try Realm()
            let friends = realm.objects(UserData.self)
            print(friends)
        } catch {
            print(error)
        }
    }
}

extension VkLoginViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        guard let url = navigationResponse.response.url,
              url.path == "/blank.html",
              let fragment = url.fragment else {
            decisionHandler(.allow)
            return
        }
        
        let params = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=") }
            .reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                
                return dict
            }
        
        print(params)
        
        guard let token = params["access_token"],
              let userIdString = params["user_id"],
              let _ = Int(userIdString) else {
            decisionHandler(.allow)
            return
        }
        
        VKSession.shared.token = token
        print("Token saved \(token)")
        decisionHandler(.allow)
//        NetworkManager.shared.loadPhotos()
        NetworkManager.shared.loadFriends()
//        NetworkManager.shared.loadGroups()
        
    }
}
