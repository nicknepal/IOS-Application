 
import Foundation


 
 enum NirColor: String {
     case blue
     case silver
     case black
     case grey
     case gold
     case white
     case green
     }


 class NirMotorVehicle: CustomStringConvertible {
    var description: String {
        return "Motor Vehicle of Colour: \(NirColor) are manufactured in the Year: \(NirYear) \n"
    }
        
      var NirYear: Int
      var NirColor: NirColor

        init(NirYear: Int, NirColor: NirColor) {
            self.NirYear = NirYear
            self.NirColor = NirColor
        }


      func nirCalculateOilPrice() -> Int {
        return 0
      }
     
 }
 

 class NirBoat: NirMotorVehicle {
      var nirQuantInfo:String
      var nirBoatPrice: Double
      var nirBoatFrequency:Int

     init(nirBoatYear: Int,nirBoatColor: NirColor, nirQuantInfo: String, nirBoatPrice: Double, nirBoatFrequency:Int){
          self.nirQuantInfo = nirQuantInfo
          self.nirBoatPrice = nirBoatPrice
          self.nirBoatFrequency = nirBoatFrequency
          super.init(NirYear: nirBoatYear, NirColor: nirBoatColor)
     }
    
     func nirCalculateOilPrice() -> Double{
         return nirBoatPrice * Double(nirBoatFrequency)
     }
    
      override var description: String {
              return "Quant:  \(nirQuantInfo),  boatFrequency:  \(nirBoatFrequency) per month,  boat oil Price: \(nirCalculateOilPrice()) \n "
     }
 }

 
 
 
 //Creating Protocol NirStreetLegal
 
 protocol NirStreetLegal {
     func nirSignalStop()
     func nirSignalLeftTurn()
     func nirSignalRightTurn()
 }

//Creating subclass NirCar
 
 class NirCar: NirMotorVehicle, NirStreetLegal {
         var nirWheelInfo: String
         var nirCarPrice: Double
         var nirCarFrequency: Int

     init(nirCarYear: Int, nirCarColor: NirColor, nirWheelInfo: String, nirCarPrice: Double, nirCarFrequency:Int){
         self.nirWheelInfo = nirWheelInfo
         self.nirCarPrice = nirCarPrice
         self.nirCarFrequency = nirCarFrequency
         super.init(NirYear: nirCarYear, NirColor: nirCarColor)
     }
     
     func nirCalculateOilPrice() -> Double{
         return nirCarPrice * Double(nirCarFrequency)
     }
    
      override var description: String {
         return """
         Wheel:  \(nirWheelInfo),  CarFrequency:  \(nirCarFrequency) per month,  Car oil Price: \(nirCalculateOilPrice())
         """
     }
     
     func nirSignalStop(){
         print(" Stop Car ")
         }
     
     func nirSignalLeftTurn(){
         print(" Turn Car Left ")
     }
     
     func nirSignalRightTurn(){
         print(" Turn Car Right")
     }
 }




 // Creating NirBicycle Subclass with protocol nirSteelLegal
 
 class NirBicyle : NirStreetLegal, CustomStringConvertible {
     var description : String {
        return "Bicycle Brand name is \(nirBrandName)"
     }
    
    
     var nirBrandName : String
         
     init(nirBrandName: String){
        self.nirBrandName = nirBrandName
     }
    
     
     func nirSignalStop(){
         print(" Stop Bicylce ")
     }
     
     func nirSignalLeftTurn(){
         print(" Turn Bicycle to the Left ")
     }
     
     func nirSignalRightTurn(){
         print(" Turn Bicycle to the Right ")
     }

 }

 //Creating NirPedestrian Subclass with protocol NirSteelLegal
 
 class NirPedestrain : NirStreetLegal, CustomStringConvertible{
    var description : String {
        return "The Pedestrian name is \(nirName) "
    }
    
    var nirName : String
         
    init(nirName : String){
        self.nirName = nirName
    }
     
     
     func nirSignalStop(){
         print(" Stop Walking ")
     }
     
     func nirSignalLeftTurn(){
         print(" Walk to the Left ")
     }
     
     func nirSignalRightTurn(){
         print(" Walk to the Right ")
     }

 }



