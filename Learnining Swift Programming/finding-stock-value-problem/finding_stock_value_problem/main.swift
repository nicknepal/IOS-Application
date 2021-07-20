//
//  main.swift
//  Final_Project_Assignment_3
//
//  Created by Niraj Thapa on 10/06/2021.







import Foundation

//Creating the class for StockHolding
class StockHolding{
    var purchaseSharePrice : Float
    var currentSharePrice : Float
    var numberOfShares : Int
    var companyName : String
    
    init(_ purchaseSharePrice : Float, _ currentSharePrice : Float, _ numberOfShares : Int, _ companyName : String  ){
        
        self.purchaseSharePrice = purchaseSharePrice
        self.currentSharePrice = currentSharePrice
        self.numberOfShares = numberOfShares
        self.companyName = companyName
        
    }
    
    func costInDollars() -> Float {
        return purchaseSharePrice * Float(numberOfShares)
    }
    
    func valueInDollars() -> Float {
        return currentSharePrice * Float(numberOfShares)
    }
    
}

//instances of StockHolding class
var youtubeStock = StockHolding(15.75, 58.50 , 20 , "Youtube" )
var netflixStock = StockHolding(275.00, 789.60 , 80 , "Netflix" )
var huluStock = StockHolding(65.75, 80.50 , 10 , "Hulu" )

//alphabetical sorting by companyName
var stockList : [StockHolding] = [youtubeStock, netflixStock, huluStock]
var stocks = stockList.sorted( by : { $0.companyName < $1.companyName } )

for stock in stocks{
    print(stock.companyName)
}




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




//Third part code
//  Asking till valid value given to add stock number
func askStockCountfunc() -> Int{
    var stocknumber: Int = 0
    while(stocknumber <= 0 ){
        print("\n How many Stocks they want to enter in number ( between 1 to  8)")
        if let input1 = readLine(){
            print(" Enter value is \(input1) ")
            if let input1 = Int(input1)  {
                stocknumber = input1 > 0 && input1 < 8 ? input1 : 0
            }
        }
        if stocknumber <= 0  {
            print(" Re Enter valid Number ")
        }else{
            print(" Number is valid and its \(stocknumber)")
        }
    }
    return stocknumber
}


//what is the stock type -local or foreign
func stockTypeFunc() -> Int {
    var stockTypeValue : Int = 0
    while(stockTypeValue <= 0){
         print("\n Enter the Stock type\n \t 1. for Local Stocks \n \t 2. Foreign Stock   ")
        if let input1 = readLine(){
            print(" Enter value is \(input1) ")
            if let input1 = Int(input1) {
                stockTypeValue = [1,2].contains(input1) ? input1 : 0
            }
        }
        if stockTypeValue <= 0{
            print(" Re Enter valid Number ")
        }else{
            print(" Number is valid and its \(stockTypeValue)")
        }
    }
    return stockTypeValue
}


func stockQuantityFunc() -> Int {
    var stockQuantityvalue : Int = 0
    while(stockQuantityvalue <= 0){
         print("\n Enter the number of Stock")
        if let input1 = readLine(){
            print(" Enter value is \(input1) ")
            if let input1 = Int(input1) {
                stockQuantityvalue = input1 > 0 ? input1 : 0
            }
        }
        if stockQuantityvalue <= 0{
            print(" Re Enter valid Number ")
        }else{
            print(" Number is valid and its \(stockQuantityvalue)")
        }
    }
    return stockQuantityvalue
}


func stockPriceFunc(_ stock:String) -> Float {
    var stockPriceValue : Float = 0.0
    while(stockPriceValue <= 0.0){
         print("\n Enter the \(stock) Stock price  ")
        if let input1 = readLine(){
            print(" Enter value is \(input1) ")
            if let input1 = Float(input1) {
                stockPriceValue = input1 > 0.0 ? input1 : 0.0
            }
        }
        if stockPriceValue <= 0.0{
            print(" Re Enter valid Number ")
        }else{
            print(" Price is valid and its \(stockPriceValue)")
        }
    }
    return stockPriceValue
}


func stockConversionRateFunc() -> Float {
    var stockConversionRate : Float = 0.0
    while(stockConversionRate <= 0.0){
         print("\n Enter the  Stock conversion rate  ")
        if let input1 = readLine(){
            print(" Enter value is \(input1) ")
            if let input1 = Float(input1) {
                stockConversionRate = input1 > 0.0 ? input1 : 0.0
            }
        }
        if stockConversionRate <= 0.0{
            print(" Re Enter valid Number ")
        }else{
            print(" Price is valid and its \(stockConversionRate)")
        }
    }
    return stockConversionRate
}


func stockCompaanyNameFunc() -> String {
    var stockCompanyName : String = ""
    while(stockCompanyName <= ""){
         print("\n Enter the Name of Stock Company ")
        if let input1 = readLine(){
            print(" Enter value is \(input1) ")
            if !input1.contains("\"") && !input1.isEmpty {
                stockCompanyName = (input1 != "") ? input1 : ""
            }
        }
        if stockCompanyName <= ""{
            print(" Re Enter valid Company Name ")
        }else{
            print(" Name is valid and its \(stockCompanyName)")
        }
    }
    return stockCompanyName
}



//adding above values in a list/array
var stocknumber: Int = 0
stocknumber = askStockCountfunc()
print(stocknumber)

var stockAddList : [StockHolding] = []

//calling each above function
for i in 1...stocknumber{
    print("\n \nEnter the details of the \(i) stock accordingly")
    var stocktypevalue : Int
    stocktypevalue = stockTypeFunc()
    print(stocktypevalue)
    
    var stockPurchaseValue : Float
    stockPurchaseValue = stockPriceFunc("Purchase")
    print(stockPurchaseValue)
    
    var stockCurrentValue : Float
    stockCurrentValue = stockPriceFunc("Current")
    print(stockCurrentValue)

    var stockQuantityvalue : Int
    stockQuantityvalue = stockQuantityFunc()
    print(stockQuantityvalue)
    
    var stockCompanyName : String
    stockCompanyName = stockCompaanyNameFunc()
    print(stockCompanyName)
    
    if stocktypevalue == 1 {
        let stock = StockHolding(stockPurchaseValue,stockCurrentValue,stockQuantityvalue,stockCompanyName)
        stockAddList.append(stock)
        print("Stock \(i) value been added")
    }
    if stocktypevalue == 2 {
        
        var stockConversionRate : Float
        stockConversionRate = stockConversionRateFunc()
        print(stockConversionRate)
   
        let stock = ForeignStockHolding(stockPurchaseValue,stockCurrentValue,stockQuantityvalue,stockCompanyName,stockConversionRate )
        stockAddList.append(stock)
        print("Stock \(i) value been added")
    }
}




//-------- Lowest Stock Value ---------------------------
func displayLowestStockValue(){
    let stock = stockAddList.min(by : {$0.currentSharePrice < $1.currentSharePrice})
    
    if let stock = stock{
        print("\n\n The Lowest Current Value stock is \" \(stock.companyName) \" \n\t brought at \(stock.purchaseSharePrice) \n\t in Quantity \(stock.numberOfShares) \n\tis current price : \(stock.currentSharePrice)\n")
    }
}


//---------------------Highest Stock Value----------------------
func displayHighestStockValue(){
    let stock = stockAddList.min(by : {$0.currentSharePrice > $1.currentSharePrice})
    
    if let stock = stock{
        print("\n\n The Highest Current Value stock is \" \(stock.companyName) \" \n\t brought at \(stock.purchaseSharePrice) \n\t in Quantity \(stock.numberOfShares) \n\tis current price : \(stock.currentSharePrice)\n")
    }
}


//-------------------Most Profitable Stock-----------------------
func displayMostProfitStock(){
    let stock = stockAddList.min(by : { ($0.currentSharePrice - $0.purchaseSharePrice)/$0.purchaseSharePrice > ($1.currentSharePrice - $1.purchaseSharePrice)/$1.purchaseSharePrice  })
    
    if let stock = stock{
        let profit = ((stock.currentSharePrice - stock.purchaseSharePrice)/stock.purchaseSharePrice * 100).rounded()
        
        print("\n\n The Most Profitable stock is \" \(stock.companyName) \" \n\t brought at \(stock.purchaseSharePrice) \n\t in Quantity \(stock.numberOfShares) \n\tis current price : \(stock.currentSharePrice)\n\t and Profit percentage is \(profit) \n ")
    }
}


//--------------------------------------Least Profitable Stock-----------------------
func displayLeastProfitStock(){
    let stock = stockAddList.min(by : { ($0.currentSharePrice - $0.purchaseSharePrice)/$0.purchaseSharePrice < ($1.currentSharePrice - $1.purchaseSharePrice)/$1.purchaseSharePrice  })
    
    if let stock = stock{
        let profit = ((stock.currentSharePrice - stock.purchaseSharePrice)/stock.purchaseSharePrice * 100).rounded()
        
        print("\n\n The Least Profitable stock is \" \(stock.companyName) \" \n\t brought at \(stock.purchaseSharePrice) \n\t in Quantity \(stock.numberOfShares) \n\tis current price : \(stock.currentSharePrice)\n\t and Profit percentage is \(profit) \n ")
    }
}



//----------------------stocks in an alphebetical order i.e [A-Z]------------
func displayAllStockByName(){
    let sortedstocks = stockAddList.sorted(by : {$0.companyName < $1.companyName})
    
    print(" Displaying the stocks in an alphebetical order i.e [A-Z] based on company name \n")
    
    for stock in sortedstocks{
        print("\t--> The stock is \" \(stock.companyName) \" \t brought at \(stock.purchaseSharePrice) \t in Quantity \(stock.numberOfShares) \tis current price : \(stock.currentSharePrice)")
    }
}


//-------------------lowest to highest based on Stocks Current value-------------
func displayAllStockByValue(){
    let sortedstocks = stockAddList.sorted(by : {$0.currentSharePrice < $1.currentSharePrice})
    
    print(" Displaying the stocks from lowest to highest based on Stocks Current value  \n")
    
    for stock in sortedstocks{
        print("\t--> The stock is \" \(stock.companyName) \" \t brought at \(stock.purchaseSharePrice) \t in Quantity \(stock.numberOfShares) \tis current price : \(stock.currentSharePrice)")
    }
}


//displaying the message again
func menu(){
    print("\n \n Select From  The Following Options from 1 to 7  To Continue")
    print("\n\t1.\tDisplay stock information with the lowest value. \n\n\t2.\tDisplay stock with the highest value.\n\n\t3.\tDisplay the most profitable stock.\n\n\t4.\tDisplay the least profitable stock.\n\n\t5.\tList all stocks sorted by company name (A-Z)\n\n\t6.\tList all stocks sorted from the lowest value to the highest value\n\n\t7.\tExit\n")
    
    var OptionEntered : Int = 0
    
    print("\n Enter the option to continue")
    if let input1 = readLine(){
        print(" Enter value is \(input1) ")
        if let input1 = Int(input1) {
            OptionEntered = input1 > 0 && input1 < 8 ? input1 : 0
        }
        
    }
    
    switch OptionEntered {
    case 1:
        displayLowestStockValue()
        menu()
    case 2:
        displayHighestStockValue()
        menu()
    case 3:
        displayMostProfitStock()
        menu()
    case 4:
        displayLeastProfitStock()
        menu()
    case 5:
        displayAllStockByName()
        menu()
    case 6:
        displayAllStockByValue()
        menu()
    case 7:
        print("Exiting the menu and program ..... ")
        return
    
    default:
        print("Invalid Option Enter Again")
        menu()
    }
    
}

menu()
