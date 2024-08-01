//
//  HastaKayit.swift
//  Hasta Takip
//
//  Created by Berke Özgüder on 31.07.2024.
//

import SwiftUI

class HastaKayit: ObservableObject, Identifiable {
    @Published var adi: String
    @Published var yas: Int
    @Published var cinsiyet: String
    @Published var hastaId: UUID
    @Published var telNo: String
    @Published var alerjiBilgisi: Bool
    @Published var kanGrubu: String
    @Published var doktorAdi: String
    @Published var tarih: Date
    @Published var hastaTanisi: String
    @Published var tedaviyeDevamMi: Bool
    
    init(adi: String = "", yas: Int = 0, cinsiyet: String = "", hastaId: UUID = UUID(), telNo: String = "", alerjiBilgisi: Bool = false, kanGrubu: String = "", doktorAdi: String = "", tarih: Date = Date(), hastaTanisi: String = "", tedaviyeDevamMi: Bool = false) {
        self.adi = adi
        self.yas = yas
        self.cinsiyet = cinsiyet
        self.hastaId = hastaId
        self.telNo = telNo
        self.alerjiBilgisi = alerjiBilgisi
        self.kanGrubu = kanGrubu
        self.doktorAdi = doktorAdi
        self.tarih = tarih
        self.hastaTanisi = hastaTanisi
        self.tedaviyeDevamMi = tedaviyeDevamMi
    }
}
