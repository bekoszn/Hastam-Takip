//
//  DetayView.swift
//  Hasta Takip
//
//  Created by Berke Özgüder on 31.07.2024.
//

import SwiftUI

struct DetayView: View {
    @EnvironmentObject var hastaListesi: HastaListesi
    var hasta: HastaKayit

    var body: some View {
        VStack {
            Form {
                Section(header: Text("Hasta Bilgileri")) {
                    Text("Adı: \(hasta.adi)")
                    Text("Yaş: \(hasta.yas)")
                    Text("Cinsiyet: \(hasta.cinsiyet)")
                    Text("Telefon Numarası: \(hasta.telNo)")
                    Text("Alerji Bilgisi: \(hasta.alerjiBilgisi ? "Var" : "Yok")")
                    Text("Kan Grubu: \(hasta.kanGrubu)")
                    Text("Doktor Adı: \(hasta.doktorAdi)")
                    Text("Tarih: \(hasta.tarih, style: .date)")
                    Text("Tanı: \(hasta.hastaTanisi)")
                    Text("Tedaviye Devam Mı: \(hasta.tedaviyeDevamMi ? "Evet" : "Hayır")")
                }
            }
            
            Button(action: {
                deletePatient()
            }) {
                Text("Hasta Kaydını Sil")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.red)
                    .cornerRadius(8)
                    .padding()
            }
        }
        .navigationTitle(hasta.adi)
    }

    private func deletePatient() {
        if let index = hastaListesi.hastalar.firstIndex(where: { $0.hastaId == hasta.hastaId }) {
            hastaListesi.hastalar.remove(at: index)
        }
    }
}
