//
//  Net.swift
//  07LegalReport
//
//  Created by yuhua on 2019/11/11.
//  Copyright © 2019 yh. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class Net {
    static let VideoList = "http://media.app.cntvwb.cn/vapi/video/ocvlist.do?mid=17zAVZnq0815"
    
    //page从1开始
    static func getVideoList(page: Int, success: @escaping ([Video])->Void, fail: @escaping ()->Void = {}) -> DataRequest? {
        return Alamofire
            .request(VideoList+"&p=\(page)&n=20")
            .validate()
            .responseData { response in
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    do {
                        let videoData = try json["data"].rawData()
                        do {
                            let video = try JSONDecoder().decode([Video].self, from: videoData)
                            success(video)
                            return
                        } catch {
                            print("decode解析发生错误：\(error.localizedDescription)")
                        }
                    } catch {
                        print("解析json发生错误：\(error.localizedDescription)")
                    }
                    fail()
                case .failure(let error):
                    print("获取发生错误：\(error.localizedDescription)")
                }
        }
    }
}
