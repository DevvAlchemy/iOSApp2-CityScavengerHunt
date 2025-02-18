//
//  ContentView.swift
//  iOSApp2-CityScavengerHunt
//
//  Created by Royal K on 2025-02-18.
//

import SwiftUI
import PhotosUI

struct ContentView: View {
    @StateObject private var viewModel = ScavengerHuntViewModel()
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var showCamera = false
    @State private var selectedCardIndex: Int? = nil

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    Text(Rewards.calculateReward(foundItems: viewModel.completedItems))
                        .font(.headline)
                        .multilineTextAlignment(.center)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                        .padding()

                    ForEach(Array(viewModel.cards.enumerated()), id: \.element.id) { index, card in
                        CardView(card: card)
                            .onTapGesture {
                                selectedCardIndex = index
                            }
                    }
                }
                .padding(.vertical)
            }
            .navigationTitle("Downtown Scavenger Hunt")
            .sheet(isPresented: .constant(selectedCardIndex != nil)) {
                if let index = selectedCardIndex {
                    VStack {
                        Text(viewModel.cards[index].scavengerHuntItem.businessName)
                            .font(.title)
                            .padding()

                        HStack {
                            PhotosPicker("Select from Gallery", selection: $selectedItem, matching: .images)
                                .padding()
                                .buttonStyle(.bordered)

                            Button("Take a Photo") {
                                showCamera = true
                            }
                            .padding()
                            .buttonStyle(.borderedProminent)
                        }

                        Button("Complete Task") {
                            viewModel.completeItem(at: index)
                            selectedCardIndex = nil
                        }
                        .padding()
                        .disabled(viewModel.cards[index].scavengerHuntItem.isCompleted)

                        Button("Cancel") {
                            selectedCardIndex = nil
                        }
                        .padding()
                    }
                }
            }
            .sheet(isPresented: $showCamera) {
                #if targetEnvironment(simulator)
                Text("Camera not available in simulator")
                #else
                CameraView(image: $viewModel.cards[selectedCardIndex ?? 0].scavengerHuntItem.image)
                #endif
            }
            .onChange(of: selectedItem) { newItem in
                Task {
                    if let index = selectedCardIndex,
                       let newItem = newItem,
                       let data = try? await newItem.loadTransferable(type: Data.self),
                       let image = UIImage(data: data) {
                        viewModel.cards[index].scavengerHuntItem.image = image
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
