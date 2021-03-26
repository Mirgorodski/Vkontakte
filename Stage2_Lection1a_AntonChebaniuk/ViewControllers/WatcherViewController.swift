//
//  WatcherViewController.swift
//  Stage2_Lection1a_AntonChebaniuk
//
//  Created by Anton Chebaniuk on 09.02.2021.
//

import UIKit

class WatcherViewController: UIViewController {

    @IBOutlet weak var watcherName: UILabel!
    @IBOutlet weak var watcherId: UILabel!
    @IBOutlet weak var watcherToken: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let userSession = UserSession.instance
        watcherName.text = userSession.name
        watcherId.text = String(userSession.id)
        watcherToken.text = userSession.token
    }
    
}
