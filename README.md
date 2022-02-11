# quadcopter-design
This repo contains the matalb work related to the quadcopter flight controller project

### Modelling and Control System Design
A non-linear quadcopter model was developped, and linearised about the hover position for linear control system design. The non-linear system is then used to validate the control system.
<p align="center">
  <img src="https://user-images.githubusercontent.com/60844959/153644207-a966b221-28b9-4d76-838a-44e8f89cf219.gif" />
</p>


### Matlab Flight Controller App
In addition, a flight controller app was developped to communicate with the drone during flight. It communicates over BLE and recieves the drone states and debug info. It also sends setpoint commands to the drone. This will help to serve as a platform for future control system fine tuning using live experiments instead of simulation.
<p align="center">
  <img src="https://user-images.githubusercontent.com/60844959/153643186-80f11514-f235-49ac-a9de-282c3a916da7.png" />
</p>

