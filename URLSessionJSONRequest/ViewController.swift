//
//  ViewController.swift
//  URLSessionJSONRequest
//
//  Created by YILDIRAY HAZIR on 8/21/17.
//  Copyright © 2017 thunder. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBAction func onGetTapped(_ sender: Any) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {return}
    //let session = URLSession.shared
        let session = URLSession.shared.dataTask(with: url) {(data, response, error) in
            if let response = response{
                print(response)
            }
            if let data = data {
              print(data)
            }
            do{  let json = try JSONSerialization.jsonObject(with: data!, options: [])
                print(json)
            }catch{
                print(error)
            }
        }
        session.resume()
    }


    @IBAction func onPostTapped(_ sender: Any) {
        let parameter = ["username" : "yildiray", "tweet" : "Selam"]
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {return}
        var request = URLRequest(url:url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameter, options: []) else{return}
        request.httpBody = httpBody
        let session = URLSession.shared.dataTask(with: request) {(data, responce, error) in
            if let response = responce{
                print(response)
                
            }
            if let data = data{
                do{
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                }catch{
                    print(error)
                }
            }
    }
        session.resume()
}
}
