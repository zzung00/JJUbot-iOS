//
//  ProductCard.swift
//  JJUbot-iOS
//
//  Created by 이정현 on 2022/05/19.
//

import SwiftUI

struct ProductCard: View {
    var image: String
    var title: String
    
    var body: some View {
        HStack(alignment: .center) {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50)
                .padding(.all, 20)
            
            VStack(alignment: .leading) {
                Text(title)
                    .font(Font.custom("JalnanOTF", size: 10))
                    .foregroundColor(.white)
            }
            .padding(.trailing, 20)
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .background(Color.mainBlue)
        .modifier(CardModifier())
        .padding(.all, 10)
    }
}

struct ProductCard_Previews: PreviewProvider {
    static var previews: some View {
        ProductCard(image: "", title: "")
    }
}
