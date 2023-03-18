//
//  TradingRespo.swift
//  GraphLikeTrading
//
//  Created by Naveen Yadav on 18/03/23.
//

import SwiftUI
import LightweightCharts

struct Transaction {
    
    var time: String
    var value: Double
    
    static func dataEntriesForYear(transactions: [Transaction]) -> [SingleValueData] {
        return transactions.map{ SingleValueData(time: .string($0.time), value: $0.value) }
    }
    
    static var allTransactions: [Transaction] = []
}

struct TransactionBarCartView: UIViewRepresentable {

    let entries: [SingleValueData]
    let setLabel: String


    func makeUIView(context: Context) -> LightweightCharts {
        let options = ChartOptions(
            layout: LayoutOptions(fontFamily: "Helvetica"),
            rightPriceScale: VisiblePriceScaleOptions(borderColor: "rgba(197, 203, 206, 1)"),
            timeScale: TimeScaleOptions(borderColor: "rgba(197, 203, 206, 1)")
        )
        return LightweightCharts(options: options)
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {
        let dataSet = AreaSeriesOptions(topColor: "rgba(33, 150, 243, 0.56)",bottomColor: "rgba(33, 150, 243, 0.04)",lineColor: "rgba(33, 150, 243, 1)",lineWidth: .two)
        let series = uiView.addAreaSeries(options: dataSet)


        series.setData(data: entries)
        
        uiView.translatesAutoresizingMaskIntoConstraints = false
    }
}
