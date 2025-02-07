//
//  CatDetail.swift
//  CatsApi
//
//  Created by Mauricio Rodriguez on 7/2/2025.
//

import SwiftUI

struct CatDetailView: View {
    let cat: Cat
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: cat.url)) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                ProgressView()
            }
            .frame(height: 300)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(radius: 5)
            
            if let breed = cat.breeds?.first {
                Text(breed.name)
                    .font(.largeTitle)
                    .bold()
                    .padding()
                Text("Origin: \(breed.origin)")
                    .font(.subheadline)
                    .padding()
                Text("Temperament: \(breed.temperament)")
                    .font(.body)
                    .padding()
            } else {
                Text("No information available")
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 8)
        .navigationTitle("🐾 Cat Details")
    }
}
