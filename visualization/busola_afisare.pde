import processing.serial.*;

Serial myPort;  
float yaw = 0.0; // Sensor Angle

void setup() {
  size(600, 600);
  
  // Serial list
  printArray(Serial.list());
  
  String portName = Serial.list()[0]; //Choose the COM port you use from the list
  myPort = new Serial(this, portName, 115200);
  
  myPort.bufferUntil('\n');
}

void draw() {
  background(30); 
  
  translate(width/2, height/2); 
  
  noFill();
  stroke(200);
  strokeWeight(5);
  ellipse(0, 0, 400, 400);
  
  fill(255);
  textSize(32);
  textAlign(CENTER, CENTER);
  text("N", 0, -220);
  text("S", 0, 220);
  text("E", 220, 0);
  text("W", -220, 0);
  
  pushMatrix(); 
  
  rotate(radians(-yaw)); 
  
  noStroke();
  fill(255, 0, 0); 
  triangle(0, -180, -20, 0, 20, 0);
  
  fill(255); 
  triangle(0, 180, -20, 0, 20, 0);
  
  fill(100);
  ellipse(0, 0, 20, 20);
  
  popMatrix(); 
  
  fill(255);
  textSize(24);
  text("Heading: " + nf(yaw, 0, 2) + "°", 0, 270);
}

void serialEvent(Serial myPort) {
  String inString = myPort.readStringUntil('\n');
  
  if (inString != null) {
    inString = trim(inString); 
    try {
      yaw = float(inString);
    } catch (Exception e) {
       
    }
  }
}
