//
//  ShoppingData.swift
//  05ShoppingList
//
//  Created by yuhua on 2019/11/1.
//  Copyright © 2019 yh. All rights reserved.
//

import Foundation

struct ShoppingData: Identifiable {
    var id: Int
    var image: String
    var title: String
    var detail: String
    var offer: String
    var sell: Double
    var totalSell: Int
    
    static func demoData() -> [ShoppingData] {
        return [ShoppingData(id: 1, image: "pic1", title: "婴儿连体衣服爬服哈衣", detail: "很缓和的|舒适性不错", offer: "每400减50", sell: 130.5, totalSell: 876),
        ShoppingData(id: 2, image: "pic2", title: "婴儿加绒哈衣", detail: "舒适性不错|超暖和", offer: "每400减50", sell: 89.1, totalSell: 800),
        ShoppingData(id: 3, image: "pic3", title: "童泰夹棉蝴蝶衣", detail: "很缓和的|舒适性不错", offer: "每400减50", sell: 89.1, totalSell: 876),
        ShoppingData(id: 4, image: "pic4", title: "婴儿连体衣服", detail: "很缓和的|舒适性不错", offer: "每400减50", sell: 89.1, totalSell: 876),
        ShoppingData(id: 5, image: "pic1", title: "婴儿连体衣服", detail: "很缓和的|舒适性不错", offer: "每400减50", sell: 89.1, totalSell: 876),
        ShoppingData(id: 6, image: "pic2", title: "婴儿连体衣服", detail: "很缓和的|舒适性不错", offer: "每400减50", sell: 89.1, totalSell: 876),
        ShoppingData(id: 7, image: "pic3", title: "婴儿连体衣服", detail: "很缓和的|舒适性不错", offer: "每400减50", sell: 89.1, totalSell: 876),
        ShoppingData(id: 8, image: "pic4", title: "婴儿连体衣服", detail: "很缓和的|舒适性不错", offer: "每400减50", sell: 89.1, totalSell: 876),
        ShoppingData(id: 9, image: "pic1", title: "婴儿连体衣服", detail: "很缓和的|舒适性不错", offer: "每400减50", sell: 89.1, totalSell: 876),
        ShoppingData(id: 10, image: "pic2", title: "婴儿连体衣服", detail: "很缓和的|舒适性不错", offer: "每400减50", sell: 89.1, totalSell: 876),
        ShoppingData(id: 11, image: "pic3", title: "婴儿连体衣服", detail: "很缓和的|舒适性不错", offer: "每400减50", sell: 89.1, totalSell: 876)]
    }
}
