//
//  ContentView.swift
//  Hasta Takip
//
//  Created by Berke Özgüder on 31.07.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var hastaListesi = HastaListesi()

    private let columns = [GridItem(.flexible())]

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 15) {
                    ForEach(hastaListesi.hastalar) { hasta in
                        NavigationLink(destination: DetayView(hasta: hasta).environmentObject(hastaListesi)) {
                            HStack {
                                VStack(alignment: .leading, spacing: 10) {
                                    Text(hasta.adi)
                                        .font(.headline)
                                        .foregroundColor(.white)
                                        .padding(.bottom, 5)
                                    Text("Yaş: \(hasta.yas)")
                                        .foregroundColor(.white)
                                    Text("Tedavi Günü: \(hasta.tarih)")
                                        .foregroundColor(.white)
                                    Text("Doktor: \(hasta.doktorAdi)")
                                        .foregroundColor(.white)
                                    Text("Hasta Tanısı: \(hasta.hastaTanisi)")
                                        .foregroundColor(.white)
                                }
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 15).fill(self.randomColor()))
                                .frame(maxWidth: .infinity)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Hasta Listesi")
            .sheet(isPresented: $hastaListesi.showYeniHastaKayitView) {
                YeniHastaKayitView(hastaListesi: hastaListesi)
            }
            .overlay(
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button(action: {
                            hastaListesi.showYeniHastaKayitView.toggle()
                        }) {
                            Image(systemName: "plus")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .clipShape(Circle())
                                .shadow(radius: 10)
                        }
                        .padding()
                    }
                }
            )
        }
    }
    
    private func randomColor() -> Color {
        let colors: [Color] = [.red, .blue, .green, .orange, .purple]
        return colors.randomElement() ?? .blue
    }
}

#Preview {
    ContentView()
}
