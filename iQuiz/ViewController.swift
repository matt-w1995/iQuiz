//
//  ViewController.swift
//  iQuiz
//
//  Created by Matthew Wong on 10/29/18.
//  Copyright © 2018 Matthew Wong. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var table: UITableView!
    
    var appdata = AppData.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getQuizzes()
        table.delegate = self
        table.dataSource = self
        table.tableFooterView = UIView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func getQuizzes() {
        if CheckInternet.Connection() {
            let jsonURL: String =  AppData.shared.url
            guard let url = URL(string: jsonURL) else {return}
            
            URLSession.shared.dataTask(with: (url as URL?)!) { (data, response, err) in
                if (err != nil) {
                    let alert = UIAlertController(title: "Download Error", message: "Could not download the quizes", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Retry", style: .default, handler: {action in self.getQuizzes()}))
                    alert.addAction(UIAlertAction(title: "Use Local", style: .default, handler: nil))
                    self.present(alert, animated: true)
                }
                guard let data: Data = data else {return}        
                do {
                    AppData.shared.quizzes = try JSONDecoder().decode([AppData.Quiz].self, from: data)
                    UserDefaults.standard.set(try? PropertyListEncoder().encode(AppData.shared.quizzes), forKey:"localQuizzes")
                    DispatchQueue.main.async {
                        self.table.reloadData()
                    }
                } catch let jsonErr {
                    print("Error serializing json: ", jsonErr)
                }
            }.resume()
        } else {
            let alert = UIAlertController(title: "No Internet Connection", message: "No internet, please check connection and try again", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Try Again", style: .default, handler: {action in self.getQuizzes()}))
            alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
    
        if let data = UserDefaults.standard.value(forKey:"localQuizzes") as? Data {
            AppData.shared.quizzes = try! PropertyListDecoder().decode(Array<AppData.Quiz>.self, from: data)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AppData.shared.quizzes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "quizCell"
        let quizCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! iQuizTableViewCell
        
        let quiz = AppData.shared.quizzes[indexPath.row]
        
        quizCell.iQuizTitle?.text = quiz.title
        quizCell.iQuizDescription?.text = quiz.desc
        
        return quizCell
    }

    @IBAction func settingsOnClick(_ sender: Any) {
        let jsonURL = AppData.shared.url
        let alert = UIAlertController(title: "Settings", message: "Enter a new url", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.text = jsonURL
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
        alert.addAction(UIAlertAction(title: "Connect", style: .default, handler: {action in
            AppData.shared.url = alert.textFields![0].text!
            self.getQuizzes()
        }))
        self.present(alert, animated: true)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        appdata.topicIndex = indexPath.row
        appdata.questionIndex = 0
        performSegue(withIdentifier: "toQuestions", sender: self)
    }
    
}

import Foundation
import SystemConfiguration

public class CheckInternet {
    class func Connection() -> Bool {
        var zeroAddress = sockaddr_in(sin_len: 0, sin_family: 0, sin_port: 0, sin_addr: in_addr(s_addr: 0), sin_zero: (0, 0, 0, 0, 0, 0, 0, 0))
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) { zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }
        
        var flags: SCNetworkReachabilityFlags = SCNetworkReachabilityFlags(rawValue: 0)
        if SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) == false {
            return false
        }

        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        
        return (isReachable && !needsConnection)
    }
}
    


