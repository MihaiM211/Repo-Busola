# Digital Compass (ESP32 + BNO055)

A real-time digital compass application that visualizes absolute orientation data. This project interfaces an ESP32-C3 microcontroller with a BNO055 9-DOF Absolute Orientation Sensor and transmits heading data to a PC for graphical visualization using "Processing".

# Features
* Sensor Fusion: Utilizes the Bosch BNO055 on-board sensor fusion algorithms to retrieve precise Euler angles (Heading).
* Real-time Communication: Serial data transmission from the embedded device to the PC.
* Graphical Interface: Custom UI built in Processing (Java) that renders a rotating compass needle responding to physical sensor movement.
* Correct Physics: The UI logic compensates for rotation, mimicking the behavior of a physical magnetic compass.

## Hardware Requirements
* Microcontroller: ESP32-C3 (RISC-V) or any standard ESP32 Dev Module.
* Sensor: Bosch BNO055 (IMU - Accelerometer, Gyroscope, Magnetometer).
* Connection: USB Cable (Data capable).
* Wiring: Jumper wires.

## Wiring (I2C)

| BNO055 Pin | ESP32 Pin | Description |
| :--------- | :-------- | :---------- |
|     VIN    |    3.3V   | Power Supply |
|     GND    |    GND    | Ground |
|     SDA    |   GPIO 8 / SDA | I2C Data (Check your board pinout) |
|     SCL    |   GPIO 9 / SCL | I2C Clock (Check your board pinout) |



## Software Prerequisites

### 1. Arduino IDE (Firmware)
Required libraries (install via Library Manager):
* `Adafruit BNO055`
* `Adafruit Unified Sensor`

### 2. Processing IDE (Visualization)
* Download from [processing.org](https://processing.org/).
* No extra libraries needed (uses standard `processing.serial`).

## How to Run

### Step 1: Flash the Firmware
1.  Open the firmware code in Arduino IDE.
2.  Connect the ESP32 to your PC.
3.  Select the correct Board and COM Port.
4.  Upload the code.
5.  Close the Serial Monitor in Arduino IDE after testing (so Processing can access the port).

### Step 2: Run the Visualization
1.  Open the visualization script in Processing.
2.  Check the COM Port index line:
    ```java
    // Change the index [0], [1], etc. based on your system's port list
    String portName = Serial.list()[0]; 
    ```
3.  Click the **Run** (Play) button.
4.  Rotate the sensor and watch the compass follow!

## Troubleshooting
* "Component not found" error: Check your wiring SDA/SCL connections.
*  Processing error "Index out of bounds": This means the code is trying to access a COM port that doesn't exist. Check the console output in Processing to see the list of available ports and update the index `Serial.list()[x]` accordingly.
