//
//  SViewController.swift
//  TestApiYoutube
//
//  Created by Apple on 8/17/19.
//  Copyright © 2019 DuyLiem. All rights reserved.
//

import UIKit
import Alamofire

class HistoryViewController: UIViewController, UITextFieldDelegate {

    //MARK: - Properties
    @IBOutlet private weak var textFieldSearch: UITextField!
    @IBOutlet private weak var tableViewHistorySearch: UITableView!
    
    var historyArray = [String] ()
    var itemsArray = [ItemsModel] ()
    var snippetArray = [SnippetModel]()
    var thumbMediumArray = [MediumModel] ()
    var idArrayRelated = [IdModel] ()
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewHistorySearch.dataSource = self
        tableViewHistorySearch.delegate = self
        tableViewHistorySearch.register(UINib(nibName: HistorySearchTableViewCell.name, bundle: nil), forCellReuseIdentifier: HistorySearchTableViewCell.name)
        self.textFieldSearch.delegate = self
        textFieldSearch.returnKeyType = .search
    }
    
    //MARK: - Function
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if !textFieldSearch.text!.isEmpty {
            historyArray.append(textFieldSearch.text!)
            tableViewHistorySearch.reloadData()
            textField.resignFirstResponder()
            getApiYoutubeSearch(textFieldSearch.text!)
            
        }
        return true
    }
    
    private func getApiYoutubeSearch(_ search: String){
        let searchUrl =       "https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=50&q=\(search)&key=\(API_KEY)"
        
        guard let urlString = searchUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
            let url = URL(string: urlString) else {return}
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { [weak self] (reponse) in
            guard let wSelf = self else {return}
            switch reponse.result {
            case .success:
                wSelf.handleParseDataSearch(result: reponse.value)
            case .failure:
                print("Can't get Data...")
                //                wSelf.handleLoading(indicator: wSelf.indicator, isShow: true)
            }
            
        }
    }
    
    private func handleParseDataSearch (result: Any?) {
        guard let response = result as? [String: Any],
            let items = response["items"] as? [[String: Any]] else {return}
        
        items.forEach { (data) in
            itemsArray.append(ItemsModel(dict: data))
            if let videoId = data["id"] as? [String: Any] {
                idArrayRelated.append(IdModel(dict: videoId))
            }
            if let snippet = data["snippet"] as? [String: Any] {
                snippetArray.append(SnippetModel(dict: snippet))
                //                if let channelId = snippet["channelId"] as? String {
                //                    channelIdArray.append(channelId)
                //                }
                if let thumbnails = snippet["thumbnails"] as? [String: Any] {
                    if let medium = thumbnails["medium"] as? [String: Any] {
                        thumbMediumArray.append(MediumModel(dict: medium))
                    }
                }
            }
        }
    }
    
    //MARK: - Action
    @IBAction func buttonActionDel(_ sender: Any) {
        textFieldSearch.text = ""
    }
    @IBAction func buttonActionBack(_ sender: Any) {
        let userInfo = ["data": historyArray]
        NotificationCenter.default.post(name: kNotify, object: nil, userInfo: userInfo)
        navigationController?.popToRootViewController(animated: true)
    }
}

//MARK: - UITableViewDelegate
extension HistoryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("hi")
        let searchVC = SearchViewController()
        navigationController?.pushViewController(searchVC, animated: true)
    }
}

//MARK: - UITableViewDataSource
extension HistoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return historyArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableViewHistorySearch.dequeueReusableCell(withIdentifier: HistorySearchTableViewCell.name, for: indexPath) as? HistorySearchTableViewCell else {
            return UITableViewCell()
        }
        cell.fillData(data: historyArray[indexPath.row])
        return cell
    }
    
    
}
