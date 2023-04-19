//
//  SeasonView.swift
//  constellations
//
//  Created by Byeon jinha on 2023/04/14.
//

import SwiftUI

struct SeasonView: View {
    @Binding var seasonState: Int
    @Binding var isSeasonOn: Bool
    var body: some View {
        if seasonState == 0 {
        }else if seasonState == 1 && isSeasonOn{
            CherryBlossomView() 
        } else if seasonState == 2 && isSeasonOn{
            FireworksView()
        } else if seasonState == 3 && isSeasonOn{
            LeafView()
        } else if seasonState == 4 && isSeasonOn {
            SnowView()
        }
    }
}
