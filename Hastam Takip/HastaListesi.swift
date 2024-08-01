//
//  HastaListesi.swift
//  Hasta Takip
//
//  Created by Berke Özgüder on 31.07.2024.
//

import Foundation

class HastaListesi: ObservableObject {
    @Published var hastalar: [HastaKayit] = []
    @Published var showYeniHastaKayitView: Bool = false
}
