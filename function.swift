import Foundation
let pi = 3.1415926535
let radToDegConversion=180/pi
//function for converting radians to degrees
func radToDeg(radians: Double) -> Double{
  return radians*radToDegConversion
}
//Function fo converting degrees to radians
func degToRad(radians: Double) -> Double{
  return radians/radToDegConversion
}
// Thiis is the function for retrieving what the user wants to input
func userInput(message: String) -> String{
  print(message+": ")
  return readLine()!
}

func sort(){
  print("Sorting...")
  if(calcAngleA > calcAngleB){
    if(calcAngleA > calcAngleC){
      //Using an extra variable to store the switched around variable
      angle1 = calcAngleC
      //Switching around the variable
      calcAngleC = calcAngleA
      calcAngleA = angle1
    }
  } else if (calcAngleA < calcAngleB){
    if(calcAngleB > calcAngleC){
      //Same deal as last time, switching around the variables
      angle2 = calcAngleC
      calcAngleC = calcAngleB
      calcAngleB = angle2
    }
  }
  // For business rules, switching around the sides so that the hypotenuse is the largest one 
  if(calcSideA > calcSideB){
    if(calcSideA > calcSideC){
      //Switching around the variables
      largest = calcSideA
      calcSideA = calcSideC
      calcSideC = largest
    }
  } else if (calcSideA < calcSideB) {
    if(calcSideB > calcSideC){
      //Switching around the variables
      largest = calcSideB
      calcSideB = calcSideC
      calcSideC = largest
    }
  }
}
func errorCheck(){
  print("Checking for errors...")
  let calcAngleAInt: Int = Int(calcAngleA)
  let calcAngleBInt: Int = Int(calcAngleB)
  var calcAngleCInt: Int = Int(calcAngleC)
  if(calcAngleC > 89.5 && calcAngleC < 90.5){
    calcAngleCInt = 90
  }
  //The rounding errors made the sum of all the angles always 179.9999. To fix this I initiated an Int variable to round and add together the angles in one line. Kind of janky, but needed. 
  let sum: Int = Int(calcAngleA + calcAngleB + calcAngleC) 
  if(sum != 180 || calcAngleA <= 0 || calcAngleB <= 0 || calcAngleC <= 0){
    if((calcAngleA + calcAngleB + calcAngleC) != 180){
      print("Your angles did not add up to 180 degrees")
      print(" ")
    } else {
      print("Sorry, you did not put in measurements that meet the requirements of a triangle. Try again, with correct angles")
      print(" ")
    }
    
  } else {
    print("Good job! Your measurements work for a triangle.")
    print(" ")
  }

  if ((calcAngleAInt == 90) || (calcAngleBInt == 90) || (calcAngleCInt == 90)){
    print("You put in measurements for a right triangle! Your measurements are being calculated...")
    print(" ")
  } else {
    print("Sorry, you did not put in measurements that meet the requirements for a right triangle")
    print(" ")
  }
  
}
func printAnswer(){
  //Printing out results
  print("Your angles are: ")
  print("Angle A: " + String(calcAngleA))
  print("Angle B: " + String(calcAngleB))
  print("Angle C: " + String(calcAngleC))

  print(" ")
  print("Your sides are: ")
  print("Side A: " + String(calcSideA))
  print("side B: " + String(calcSideB))
  print("Hypotenuse, or Side C: " + String(calcSideC))
}
func finish(){
  let answer1 = userInput(message: "Do you want your answers to be sorted? (1 for Yes, 2 for No)")
  if (Int(answer1) == 1){
    sort()
  }
  errorCheck()
  printAnswer()
}

// func Ssa(_angle1: Double, _angle2: Double, _angle3: Double, _side1: Double, _side2: Double, _side3: Double) {
//   angle1 = degToRad(radians: angle1)
//   angle2 = degToRad(radians: angle2)
//   angle3 = degToRad(radians: angle3)
//   calcSide1 = pow(calcSide, 2) + pow(calcSideC, 2) - ((2*calcSideB*calcSideC)*cos(calcAngleA))
// }

//Function to calculate when one angle and two sides are inputted
func oneAngle(){
  //Here we list out all the different cases, aka
  //Which angle was given and which side was not
  //There are nine combinations for this
  //Giving us 9 if statements to write out. Kind of tedious and there is probably a more efficient way to do this that I don't know
  //Using else if statements so that only one of the if statements run
  //If Angle A was given, and Side B and C were given
  if(calcAngleA != 0 && calcSideA == 0){
    //Here we will use the SAS method to solve
    //Using the Law of Cosines to solve
    calcAngleA = degToRad(radians: calcAngleA)
    calcAngleB = degToRad(radians: calcAngleB)
    calcAngleC = degToRad(radians: calcAngleC)
    
    calcSideA = pow(calcSideB, 2) + pow(calcSideC, 2) - ((2*calcSideB*calcSideC)*cos(calcAngleA))
    //The previous equation is for when A squared equals that
    //So here we have to sqare root our answer
    calcSideA = sqrt(calcSideA)

    calcAngleA = radToDeg(radians: calcAngleA)
    calcAngleB = radToDeg(radians: calcAngleB)
    calcAngleC = radToDeg(radians: calcAngleC)
    
    //Using the Law of Sines to calculate the smaller of the two angles 
    calcAngleB = (calcSideA*calcSideA + calcSideC*calcSideC - calcSideB*calcSideB)/(2*calcSideA*calcSideC)
    calcAngleB = acos(calcAngleB)

    calcAngleB = radToDeg(radians: calcAngleB)

    //3 angles add up to 180, bringing us to this equation
    calcAngleC = 180 - calcAngleB - calcAngleA
    
  } 
  //If Angle A, Side A, and Side C were given
  else if (calcAngleA != 0 && calcSideB == 0){
    calcAngleA = degToRad(radians: calcAngleA)
    //Here we will use the SSA method to solve
    //Using the Law of Sines to find Angle C
    calcAngleC = (sin(calcAngleA)*calcSideC) / calcSideA
    calcAngleC = asin(calcAngleC)
    //Using the knowledge that three triangle angles always add up to 180
    //To find what the last angle is 
    calcAngleA = radToDeg(radians: calcAngleA)
    calcAngleC = radToDeg(radians: calcAngleC)

    calcAngleB = 180 - calcAngleA - calcAngleC

    calcAngleA = degToRad(radians: calcAngleA)
    calcAngleB = degToRad(radians: calcAngleB)
    calcAngleC = degToRad(radians: calcAngleC)
    //Using the Law of Sines again to find Side B
    calcSideB = (sin(calcAngleB)*calcSideA)/sin(calcAngleA)

    calcAngleA = radToDeg(radians: calcAngleA)
    calcAngleB = radToDeg(radians: calcAngleB)
    calcAngleC = radToDeg(radians: calcAngleC)
  } 
  //If Angle A, Side A, and Side B were given
  else if (calcAngleA != 0 && calcSideC == 0){
    calcAngleA = degToRad(radians: calcAngleA)
    //Here we will use the SSA to solve
    //Using the Law of Sines to find Angle B
    calcAngleB = (sin(calcAngleA)*calcSideB) / calcSideA
    calcAngleB = asin(calcAngleB)
    //Using the knowledge that three triangle angles always add up to 180
    //To find what the last angle is 
    calcAngleA = radToDeg(radians: calcAngleA)
    calcAngleB = radToDeg(radians: calcAngleB)

    calcAngleC = 180 - calcAngleA - calcAngleB

    calcAngleA = degToRad(radians: calcAngleA)
    calcAngleB = degToRad(radians: calcAngleB)
    calcAngleC = degToRad(radians: calcAngleC)
    //Using the Law of Sines again to find Side C
    calcSideC = (sin(calcAngleC)*calcSideA)/sin(calcAngleA)

    calcAngleA = radToDeg(radians: calcAngleA)
    calcAngleB = radToDeg(radians: calcAngleB)
    calcAngleC = radToDeg(radians: calcAngleC)
  } 
  //If Angle B, Side B, and Side C were given
  else if (calcAngleB != 0 && calcSideA == 0){

    calcAngleB = degToRad(radians: calcAngleB) 
    //Here we will use the SSA to solve
    //Using the Law of Sines to find Angle C
    calcAngleC = (sin(calcAngleB)*calcSideC) / calcSideB
    calcAngleC = asin(calcAngleC)
    //Using the knowledge that three triangle angles always add up to 180
    //To find what the last angle is 
    calcAngleB = radToDeg(radians: calcAngleB)
    calcAngleC = radToDeg(radians: calcAngleC)

    calcAngleA = 180 - calcAngleC - calcAngleB

    calcAngleA = degToRad(radians: calcAngleA)
    calcAngleB = degToRad(radians: calcAngleB)
    calcAngleC = degToRad(radians: calcAngleC)

    //Using the Law of Sines again to find Side A
    calcSideA = (sin(calcAngleA)*calcSideB)/sin(calcAngleB)

    calcAngleA = radToDeg(radians: calcAngleA)
    calcAngleB = radToDeg(radians: calcAngleB)
    calcAngleC = radToDeg(radians: calcAngleC)
  } 
  //If Angle B, Side A, and Side C were given
  else if (calcAngleB != 0 && calcSideB == 0){
    calcAngleA = degToRad(radians: calcAngleA)
    calcAngleB = degToRad(radians: calcAngleB)
    calcAngleC = degToRad(radians: calcAngleC)
    //Here we will use the SAS method to solve
    //Using the Law of Cosines to solve
    calcSideB = pow(calcSideA, 2) + pow(calcSideC, 2) - (2*calcSideA*calcSideC)*cos(calcAngleB)
    //The previous equation is for when A squared equals that
    //So here we have to sqare root our answer
    calcSideB = sqrt(calcSideB)

    calcAngleA = radToDeg(radians: calcAngleA)
    calcAngleB = radToDeg(radians: calcAngleB)
    calcAngleC = radToDeg(radians: calcAngleC)

    //Using the Law of Sines to calculate the smaller of the two angles 
    calcAngleA = (calcSideB*calcSideB + calcSideC*calcSideC - calcSideA*calcSideA)/(2*calcSideB*calcSideC)
    calcAngleA = acos(calcAngleA)
    calcAngleA = radToDeg(radians: calcAngleA)

    //3 angles add up to 180, bringing us to this equation
    calcAngleC = 180 - calcAngleB - calcAngleA
  } 
  //If Angle B, Side A, and Side B were given
  else if (calcAngleB != 0 && calcSideC == 0){
    calcAngleB = degToRad(radians: calcAngleB)
    //Here we will use the SSA to solve
    //Using the Law of Sines to find Angle B
    calcAngleC = (sin(calcAngleB)*calcSideC) / calcSideB
    calcAngleC = asin(calcAngleC)
    //Using the knowledge that three triangle angles always add up to 180
    //To find what the last angle is
    calcAngleB = radToDeg(radians: calcAngleB)
    calcAngleC = radToDeg(radians: calcAngleC)

    calcAngleA = 180 - calcAngleC - calcAngleB

    calcAngleA = degToRad(radians: calcAngleA)
    calcAngleB = degToRad(radians: calcAngleB)
    calcAngleC = degToRad(radians: calcAngleC)
    //Using the Law of Sines again to find Side C
    calcSideA = (sin(calcAngleA)*calcSideB)/sin(calcAngleB)

    calcAngleA = radToDeg(radians: calcAngleA)
    calcAngleB = radToDeg(radians: calcAngleB)
    calcAngleC = radToDeg(radians: calcAngleC)
  } 
  //If Angle C, Side B, and Side C were given
  else if (calcAngleC != 0 && calcSideA == 0){
    calcAngleC = degToRad(radians: calcAngleC)
    //Here we will use the SSA to solve
    //Using the Law of Sines to find Angle B
    calcAngleB = (sin(calcAngleC)*calcSideB) / calcSideC
    calcAngleB = asin(calcAngleB)
    //Using the knowledge that three triangle angles always add up to 180
    //To find what the last angle is 
    calcAngleB = radToDeg(radians: calcAngleB)
    calcAngleC = radToDeg(radians: calcAngleC)

    calcAngleA = 180 - calcAngleC - calcAngleB

    calcAngleA = degToRad(radians: calcAngleA)
    calcAngleB = degToRad(radians: calcAngleB)
    calcAngleC = degToRad(radians: calcAngleC)
    //Using the Law of Sines again to find Side C
    calcSideA = (sin(calcAngleA)*calcSideB)/sin(calcAngleB)

    calcAngleA = radToDeg(radians: calcAngleA)
    calcAngleB = radToDeg(radians: calcAngleB)
    calcAngleC = radToDeg(radians: calcAngleC)
  } 
  //If Angle C, Side A, and Side C were given
  else if (calcAngleC != 0 && calcSideB == 0){
    calcAngleC = degToRad(radians: calcAngleC)
    //Here we will use the SSA to solve
    //Using the Law of Sines to find Angle B
    calcAngleB = (sin(calcAngleC)*calcSideB) / calcSideC
    calcAngleB = asin(calcAngleB)
    //Using the knowledge that three triangle angles always add up to 180
    //To find what the last angle is
    calcAngleB = radToDeg(radians: calcAngleB)
    calcAngleC = radToDeg(radians: calcAngleC)

    calcAngleA = 180 - calcAngleC - calcAngleB
    //Using the Law of Sines again to find Side C
    calcSideB = (sin(calcAngleB)*calcSideC)/sin(calcAngleC)

    calcAngleA = radToDeg(radians: calcAngleA)
    calcAngleB = radToDeg(radians: calcAngleB)
    calcAngleC = radToDeg(radians: calcAngleC)
  } 
  //If Angle C, Side B, and Side A were given
  else if (calcAngleC != 0 && calcSideC == 0){
    calcAngleA = degToRad(radians: calcAngleA)
    calcAngleB = degToRad(radians: calcAngleB)
    calcAngleC = degToRad(radians: calcAngleC)
    //Here we will use the SAS method to solve
    //Using the Law of Cosines to solve
    calcSideC = pow(calcSideA, 2) + pow(calcSideB, 2) - (2*calcSideA*calcSideB)*cos(calcAngleC)
    //The previous equation is for when A squared equals that
    //So here we have to sqare root our answer
    calcSideC = sqrt(calcSideC)

    calcAngleA = radToDeg(radians: calcAngleA)
    calcAngleB = radToDeg(radians: calcAngleB)
    calcAngleC = radToDeg(radians: calcAngleC)

    //Using the Law of Sines to calculate the smaller of the two angles 
    calcAngleA = (calcSideB*calcSideB + calcSideC*calcSideC - calcSideA*calcSideA)/(2*calcSideB*calcSideC)
    calcAngleA = acos(calcAngleA)
    calcAngleA = radToDeg(radians: calcAngleA)

    //3 angles add up to 180, bringing us to this equation
    calcAngleB = 180 - calcAngleC - calcAngleA
  }
  finish()
}
func twoAngles(){
  
  //Here, whichever angle was not given we figure that out
  //If Angle A was not given

  if(calcAngleA == 0){
      calcAngleA = 180 - calcAngleB - calcAngleC
  } 
  //If Angle B was not given
  if(calcAngleB == 0){
    calcAngleB = 180 - calcAngleA - calcAngleC
  }
  //If Angle C was not given
  if(calcAngleC == 0){
    calcAngleC = 180 - calcAngleA - calcAngleB
  }
    
  //Solving for Side A and B if Side C is given
  if (calcSideC != 0){
    calcAngleA = degToRad(radians: calcAngleA)
    calcAngleB = degToRad(radians: calcAngleB)
    calcAngleC = degToRad(radians: calcAngleC)
    //Using AAS method to solve for the sides
    calcSideA = (calcSideC*sin(calcAngleA))/sin(calcAngleC)
    

    calcSideB = (calcSideC*sin(calcAngleB))/sin(calcAngleC)
    
  } else if (calcSideB != 0){
    calcAngleA = degToRad(radians: calcAngleA)
    calcAngleB = degToRad(radians: calcAngleB)
    calcAngleC = degToRad(radians: calcAngleC)
    //Using AAS method to solve for the sides
    calcSideA = (calcSideB*sin(calcAngleA))/sin(calcAngleB)
    

    calcSideC = (calcSideB*sin(calcAngleC))/sin(calcAngleB)
    
  } else if (calcSideA != 0){
    calcAngleA = degToRad(radians: calcAngleA)
    calcAngleB = degToRad(radians: calcAngleB)
    calcAngleC = degToRad(radians: calcAngleC)
    //Using AAS method to solve for the sides
    calcSideC = (calcSideA*sin(calcAngleC))/sin(calcAngleA)
    

    calcSideB = (calcSideA*sin(calcAngleB))/sin(calcAngleA)
  
  } 
  calcAngleA = radToDeg(radians: calcAngleA)
  calcAngleB = radToDeg(radians: calcAngleB)
  calcAngleC = radToDeg(radians: calcAngleC)
  
  finish()
}
func threeSides(){
  
  //Calculating Angle A with the Law of Sines
  calcAngleA = (calcSideB*calcSideB + calcSideC*calcSideC - calcSideA*calcSideA)/(2*calcSideB*calcSideC)
  calcAngleA = acos(calcAngleA)
  calcAngleA = radToDeg(radians: calcAngleA)
  
  // Calculating Angle B with the Law of Sines
  calcAngleB = (calcSideA*calcSideA + calcSideC*calcSideC - calcSideB*calcSideB)/(2*calcSideA*calcSideC)
  calcAngleB = acos(calcAngleB)
  calcAngleB = radToDeg(radians: calcAngleB)
  
  // Calculating Angle C with the Law of Sines
  calcAngleC = (calcSideB*calcSideB + calcSideA*calcSideA - calcSideC*calcSideC)/(2*calcSideB*calcSideA)
  calcAngleC = acos(calcAngleC)
  calcAngleC = radToDeg(radians: calcAngleC)
  
  finish()
  
}