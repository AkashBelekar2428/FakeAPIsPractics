//
//  UserViewController.swift
//  UserApi
//
//  Created by Akash Belekar on 16/03/23.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

class UserViewController: UIViewController {
    @IBOutlet weak var userTbl:UITableView!

    
    var userModel:[UserResponse] = []
    var userDataModel:[UserData] = []
    var emptyArr = [Int]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.userTbl.register(UINib(nibName: "UserTVC", bundle: nil), forCellReuseIdentifier: "UserTVC")
        userTbl.dataSource = self
        userTbl.delegate = self
        getUserApi()

    }
    private func getUserApi(){
        let url = "https://dummyjson.com/comments"
        Alamofire.request(url).responseJSON { response in
            print("response",response)
            switch response.result{
            case .success(_):
                if let result = response.result.value{
                    print("result",result)
                    
                 let jSON = result as! NSDictionary
                    print("jSON",jSON)
                    
                    let str = String(data: response.data!, encoding: String.Encoding.utf8)!
                    print("str",str)
                    
                    var objData = Mapper<UserDataResponse>().map(JSONString: str)?.comments?.sorted(by: {$0.postId! < $1.postId!})
                    print("objData",objData?.toJSON())
                    
                    self.userModel = (objData!)
                //    var sort = self.userModel.sorted(by: {$0.postId! < $1.postId!})
                    DispatchQueue.main.async {
                        self.userTbl.reloadData()
                    }
                    
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }
    }
    
    @IBAction func tapped(_ sender: Any) {
        var userArr = userModel.map({$0.postId!})
        print("userArr",userArr)
        
        //sorting userArr
        
        //var sortuserArr = Set(userModel.map({$0.postId!}))
        //print("sortuserArr",sortuserArr)
        for arr in userArr{
            if emptyArr.count == 0{
                self.emptyArr.append(arr)
            }else{
                if emptyArr.contains(arr) == false{
                    self.emptyArr.append(arr)
                }
            }
        }
        print("emptyArr",emptyArr)
        
        for ar in emptyArr{
            var data = UserData()
            var userDataArr = userModel.filter({$0.postId == ar})
            data.poId = ar
            data.list = userDataArr
            userDataModel.append(data)
        }
        var dataUser = userDataModel.filter({$0.poId == 100})
        self.userModel = dataUser[0].list!
        self.userTbl.reloadData()
    }
    
    
}
extension UserViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserTVC", for: indexPath) as! UserTVC
        cell.selectionStyle = .none
        cell.bodyLbl.text = "Body: \(userModel[indexPath.row].body ?? "")"
        cell.postIdLbl.text = "PostID: \(String("\(userModel[indexPath.row].postId ?? 0)"))"
        cell.idLbl.text = "Id: \(String("\(userModel[indexPath.row].id ?? 0)"))"
        cell.usernameLbl.text = "UserName: \(userModel[indexPath.row].user!)"
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
}
