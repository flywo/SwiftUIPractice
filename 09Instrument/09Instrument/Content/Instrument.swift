//
//  Back.swift
//  09Instrument
//
//  Created by yuhua on 2019/11/14.
//  Copyright © 2019 yh. All rights reserved.
//

import SwiftUI

struct Instrument: View {
    let lowLocations: [Double] = [-22.5, 0, 22.5, 45, 67.5, 90, 112.5, 135, 157.5, 180, 202.5]
    let longLocations: [Double] = [-11.25, 11.25, 33.75, 56.25, 78.75, 101.25, 123.75, 146.25, 168.75, 191.25]
    let texts: [String] = ["0", "20", "40", "60", "80", "100", "120", "140", "160", "180", "200"]
    @Binding var value: Double
    var body: some View {
        ZStack {
            Text("\(value, specifier: "%0.0f")")
                .font(.system(size: 40, weight: Font.Weight.bold))
                .foregroundColor(Color.orange)
                .offset(x: 0, y: 40)
            ForEach(lowLocations, id: \.self) { item in
                Rectangle()
                    .fill(Color.orange)
                    .frame(width: 20, height: 6)
                    .offset(x: -150, y: 0)
                    .rotationEffect(.init(degrees: item), anchor: .center)
                    .onTapGesture {
                        self.tapLow(angle: item)
                }
            }
            ForEach(longLocations, id: \.self) { item in
                Rectangle()
                    .fill(Color.orange)
                    .frame(width: 40, height: 8)
                    .offset(x: -140, y: 0)
                    .rotationEffect(.init(degrees: item), anchor: .center)
                    .onTapGesture {
                        self.tapLong(angle: item)
                }
            }
            ForEach(lowLocations, id: \.self) {
                Text("\(self.texts[self.lowLocations.firstIndex(of: $0)!])")
                    .font(.system(size: 18, weight: Font.Weight.bold))
                    .foregroundColor(.orange)
                    .rotationEffect(.init(degrees: -$0), anchor: .center)
                    .offset(x: -120, y: 0)
                    .rotationEffect(.init(degrees: $0), anchor: .center)
            }
            Needle()
                .fill(Color.orange)
                .frame(width: 140, height: 6)
                .offset(x: -70, y: 0)
                .rotationEffect(.init(degrees: getAngle(value: value)), anchor: .center)
                .animation(.linear)
            Circle()
                .frame(width: 20, height: 20)
                .foregroundColor(.orange)
        }.padding(.vertical, 80)
    }
    
    func tapLow(angle: Double) {
        value = Double(self.lowLocations.firstIndex(of: angle)!) * 20
    }
    
    func tapLong(angle: Double) {
        value = Double(self.longLocations.firstIndex(of: angle)!) * 20 + 10
    }
    
    func getAngle(value: Double) -> Double {
        return value/200*225-22.5
    }
}


struct Back_Previews: PreviewProvider {
    static var previews: some View {
        Instrument(value: .constant(90))
    }
}
