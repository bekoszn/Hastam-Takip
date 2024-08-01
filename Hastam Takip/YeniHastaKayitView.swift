//
//  YeniHastaKayıtView.swift
//  Hasta Takip
//
//  Created by Berke Özgüder on 31.07.2024.
//

import SwiftUI

struct YeniHastaKayitView: View {
    @ObservedObject var hastaListesi: HastaListesi
    @State private var adi: String = ""
    @State private var yas: String = ""
    @State private var cinsiyet: String = ""
    @State private var telNo: String = ""
    @State private var alerjiBilgisi: Bool = false
    @State private var kanGrubu: String = ""
    @State private var doktorAdi: String = ""
    @State private var tarih: Date = Date()
    @State private var hastaTanisi: String = ""
    @State private var tedaviyeDevamMi: Bool = false
    

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Hasta Bilgileri")) {
                    TextField("Adı", text: $adi)
                    TextField("Yaş", text: $yas)
                        .keyboardType(.numberPad)
                    TextField("Cinsiyet", text: $cinsiyet)
                    TextField("Telefon Numarası", text: $telNo)
                        .keyboardType(.phonePad)
                    Toggle("Alerji Bilgisi", isOn: $alerjiBilgisi)
                    TextField("Kan Grubu", text: $kanGrubu)
                    TextField("Doktor Adı", text: $doktorAdi)
                    DatePicker("Tarih", selection: $tarih, displayedComponents: .date)
                    TextField("Tanı", text: $hastaTanisi)
                    Toggle("Tedaviye Devam Edecek Mi", isOn: $tedaviyeDevamMi)
                    
                    
                }
                
                Button(action: {
                    if let yasInt = Int(yas) {
                        let yeniHasta = HastaKayit(adi: adi, yas: yasInt, cinsiyet: cinsiyet, hastaId: UUID(), telNo: telNo, alerjiBilgisi: alerjiBilgisi, kanGrubu: kanGrubu, doktorAdi: doktorAdi, tarih: tarih, hastaTanisi: hastaTanisi, tedaviyeDevamMi: tedaviyeDevamMi)
                        hastaListesi.hastalar.append(yeniHasta)
                        hastaListesi.showYeniHastaKayitView = false
                    }
                }) {
                    Text("Kaydet")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(
                        LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]), startPoint: .leading, endPoint: .trailing)
                                        )
                        .cornerRadius(10)
                        .shadow(radius: 10)
                }
                .padding([.leading, .trailing], 20)
            }
            .navigationTitle("Yeni Hasta Ekle")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("İptal") {
                        hastaListesi.showYeniHastaKayitView = false
                    }
                }
            }
        }
    }
}
