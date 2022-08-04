import Foundation

print("")
//For more detailed instructions
var answer = userInput(message: "Welcome to the right triangle solver! Type yes for instructions. Type anything else to skip")
if(answer == "yes" || answer == "Yes" || answer == "Y" || answer == "y" || answer == "YES"){
   print("You will only be able to put in three values.")
   print("You can put in sides and angles.")
   print("If you do not put in any values, ")
   print("If you do not put in measurements that make up a right triangle, it will cause the algorithm to have errors")
   print("")
   print("")

}

//Counts how many measurements have been given
var goodMeasurement:Int = 0
//All these are new variables that only get used if their counterpart is not 0 or nil
var calcSideA:Double = 0
var calcSideB:Double = 0
var calcSideC:Double = 0
var calcAngleA:Double = 0
var calcAngleB:Double = 0
var calcAngleC:Double = 0
//If 3 measurements have been inputted, then keep going
//Goes til all measurement have been inputted
//0 will skip and not add a measurement to the count
//FYI(tried using a while loop to make it more efficient)
//Did not work
if(goodMeasurement < 3){
  //initating a variable to whatever the user inputted
  let sideA = Double(userInput(message: "Enter side A: 0 to skip"))
  //If the variable was not 0, meaning it was not skipped
  if(sideA != 0 && sideA != nil){
      //Make sure to add one to the count of goodMeasurement, so the user can only input 3 measurements
      goodMeasurement += 1
      calcSideA = sideA!    
  }
}
//Just repeating over and over again for each angle or side that needs to be inputted
if(goodMeasurement < 3){
  let sideB = Double(userInput(message: "Enter side B: 0 to skip"))
  if(sideB != 0 && sideB != nil){
      goodMeasurement += 1 
      calcSideB = sideB!
  }
}
if(goodMeasurement < 3){
  let sideC = Double(userInput(message: "Enter side C: 0 to skip"))
  if(sideC != 0 && sideC != nil){
      goodMeasurement += 1 
      calcSideC = sideC!
  }
}
if(goodMeasurement < 3){
  let angleA = Double(userInput(message: "Enter angle A: 0 to skip"))
  if(angleA != 0 && angleA != nil){
      goodMeasurement += 1 
      calcAngleA = angleA!
  }
}
if(goodMeasurement < 3){
  let angleB = Double(userInput(message: "Enter angle B: 0 to skip"))
  if(angleB != 0 && angleB != nil){
      goodMeasurement += 1 
      calcAngleB = angleB!
  }
}
if(goodMeasurement < 3){
  let angleC = Double(userInput(message: "Enter angle C: 0 to skip"))
  if(angleC != 0 && angleC != nil){
      goodMeasurement += 1 
      calcAngleC = angleC!
  }
}

//Shows the amount of sides have been inputted
var numOfSides: Int = 0
//Shows the amount of angles to be inputted 
//These two variables will be used later to pick which function to use
var numOfAngles: Int = 0
//These 
var isThreeSides: Bool = false
var isTwoAngles: Bool = false
var isOneAngle: Bool = false
//storage variables for when switching around variables
var angle1: Double = 0
var angle2: Double = 0
var angle3: Double = 0
var largest: Double = 0

//If calcSideA was inputted, then add one to the number of sides
if(calcSideA != 0){
  numOfSides += 1
}
//If calcSideB was inputted, then add one to the number of sides
if(calcSideB != 0){
  numOfSides += 1
}
//If calcSideC was inputted, then add one to the number of sides
if(calcSideC != 0){
  numOfSides += 1
}
//If calcAngleA was inputted, then add one to the number of angles
if(calcAngleA != 0){
  numOfAngles += 1
}
//If calcAngleB was inputted, then add one to the number of angles
if(calcAngleB != 0){
  numOfAngles += 1
}
//If calcAngleC was inputted, then add one to the number of angles
if(calcAngleC != 0){
  numOfAngles += 1
}
if(numOfSides + numOfAngles < 3 || numOfAngles == 3){
  let helpAnswer = userInput(message: "Error: You did not put in enough measurements, or you did not input the right type of measurements. Press yes for help") 
  if(helpAnswer == "yes" || helpAnswer == "Yes" || helpAnswer == "Y" || helpAnswer == "y" || helpAnswer == "YES"){
    print("""
      The three options available with this are:
      You can put in 3 sides
      You can put in two sides and one angle
      You can put in one side and two angles
      But you cannot put in three angles, as it is always impossible to solve
      for the rest of the triangle from there
      If you hit enter on one of the numbers, this may also be your problem.
      If none of these worked, re-run the program and look at the beginning instructions for help
    """)
  }
  
}
//If three sides were inputted, then run the function for that, and make sure isThreeSides is set to true
//So that it does not print wrong measurements were inputted
functionStarterThreeSides: if(numOfSides == 3){
  print(" ")
  if((calcSideA + calcSideB) > calcSideC || (calcSideA + calcSideC) > calcSideB || (calcSideB + calcSideC) > calcSideA){} else {
    print("You did not input sides that meet the requirements for a triangle")
    break functionStarterThreeSides;
  }
  threeSides()
  isThreeSides = true
}
//If one angle and two sides were inputted, then run the one angle function, and make sure isOneAngle is set to true
if(numOfAngles == 1 && numOfSides == 2){
  print(" ")
  oneAngle()
  isOneAngle = true
}
//If two angles and one side were inputted, then run the two angle function, and make sure isTwoAngles is set to true
if(numOfAngles == 2 && numOfSides == 1){
  print(" ")
  twoAngles()
  isTwoAngles = true
}
//If none of the types of functions were called, and nothing was set to true, then this means no sides were inputted, or 3 measurements were not inputted. Give an error


