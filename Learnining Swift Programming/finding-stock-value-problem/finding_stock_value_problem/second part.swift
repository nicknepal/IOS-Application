//
//  second part.swift
//  Final_Project_Assignment_3
//
//  Created by Niraj Thapa on 10/06/2021.
//

import Foundation



//Second part code
//Creating subclass and overriding functions to manupulate return type
class ForeignStockHolding : StockHolding {
    var conversionRate : Float
    
    init(_ purchaseSharePrice : Float, _ currentSharePrice : Float, _ numberOfShares : Int, _ companyName : String,_ conversionRate : Float){
        self.conversionRate = conversionRate
        super.init(purchaseSharePrice, currentSharePrice, numberOfShares, companyName)
    }
    
    
    override func costInDollars() -> Float {
        return purchaseSharePrice * conversionRate * Float(numberOfShares)
    }
    
    override func valueInDollars() -> Float {
        return currentSharePrice * conversionRate * Float(numberOfShares)
    }
    
}

//Creating and adding two instances in the stockList
var foreignTeslaStock = ForeignStockHolding(258.75, 458.50 , 65 , "TCL", 1.25 )
var foreignSonyStock = ForeignStockHolding(640.75, 542.50 , 80 , "Sony", 1.25 )

stockList.append(foreignTeslaStock)
stockList.append(foreignSonyStock)

//sorting stock aphabetically
var stocks1 = stockList.sorted( by : { $0.companyName > $1.companyName } )

for stock in stocks1{
    print(stock.companyName)
}

