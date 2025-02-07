//
//  ContentView.swift
//  CatsApi
//
//  Created by Mauricio Rodriguez on 6/2/2025.
//

import SwiftUI

struct CatListView: View {
    @StateObject private var viewModel = CatViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.cats) { cat in
                    NavigationLink(destination: CatDetailView(cat: cat)) {
                        CatRowView(cat: cat)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 3)
                }
                if viewModel.isLoading {
                    ProgressView()
                } else {
                    Button("Load More") {
                        viewModel.fetchCats()
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                }
            }
            .navigationTitle("🐱 Cats")
            .background(Color(UIColor.systemGray6))
            .onAppear {
                if viewModel.cats.isEmpty {
                    viewModel.fetchCats()
                }
            }
        }
    }
}

struct CatRowView: View {
    let cat: Cat
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: cat.url)) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .shadow(radius: 3)
            } placeholder: {
                ProgressView()
            }
            
            Text(cat.breeds?.first?.name ?? "Unknown Name")
                .font(.headline)
                .padding()
        }
    }
}

