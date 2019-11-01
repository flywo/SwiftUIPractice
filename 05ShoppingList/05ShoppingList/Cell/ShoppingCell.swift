//
//  ShoppingCell.swift
//  05ShoppingList
//
//  Created by yuhua on 2019/11/1.
//  Copyright © 2019 yh. All rights reserved.
//

import SwiftUI

struct ShoppingCell: View {
    var data: ShoppingData
    var body: some View {
        HStack {
            Spacer()
                .frame(width: 10)
            Image(data.image)
                .resizable()
                .frame(width: 120, height: 120)
            Spacer()
                .frame(width: 20)
            VStack(alignment: .leading) {
                HStack {
                    Text(data.title)
                        .font(.system(size: 20, weight: .bold))
                    Spacer()
                }
                Text(data.detail)
                    //ultraLight非常亮 thin瘦体 light高亮 regular整齐 medium中间的 semibold半粗 bold粗体 heavy字重 black黑
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.orange)
                Text(data.offer)
                    .font(.system(size: 14, weight: .regular))
                    .foregroundColor(.pink)
                Text("￥")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.red)
                +
                    Text("\(data.sell, specifier: "%0.2f")")
                    .font(.system(size: 22, weight: .bold))
                    .foregroundColor(.red)
                SellTotal(total: data.totalSell)
            }
                .frame(width: UIScreen.main.bounds.width-190)
            Spacer()
        }
        .frame(height: 140)
        .background(Color.white)
        .cornerRadius(10)
    }
}

struct SellTotal: View {
    var total: Int
    var body: some View {
        let t1 = Text("月销").font(.system(size: 16, weight: .bold)).foregroundColor(.white)
        let t2 = Text("\(total)").font(.system(size: 22, weight: .bold)).foregroundColor(.white)
        let t3 = Text("件").font(.system(size: 16, weight: .bold)).foregroundColor(.white)
        return (t1 + t2 + t3).background(Color.red)
    }
}

struct ShoppingCell_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingCell(data: ShoppingData(id: 1,
                                        image: "pic1",
                                        title: "婴儿连体衣服",
                                        detail: "很缓和的|舒适性不错",
                                        offer: "每400减50",
                                        sell: 89.1,
                                        totalSell: 876))
    }
}
