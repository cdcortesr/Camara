##VGA Display controlled by FPGA

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/cdcortesr/FPGA-VGA-Camera/refs/heads/master/Camera/Monitor-test.png">
  <source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/cdcortesr/FPGA-VGA-Camera/refs/heads/master/Camera/Monitor-test.png">
  <img alt="a." src="https://raw.githubusercontent.com/cdcortesr/FPGA-VGA-Camera/refs/heads/master/Camera/Monitor-test.png">
</picture>

• Developed a system to display real-time video from a camera module (ArduCam) onto a VGA monitor using a Nexys 4 development board featuring a Xilinx Artix-7 FPGA.

• Implemented the system design using Verilog.

• Captured image data from the ArduCam and stered it for ptional future processing.

• The nexys 4 input for the VGA connector has an ADC resistor ladder that conditions the digital signal to feed the VGA monitor.

• A RAM block is created to store a 640x480 frame to buffer image data between capture and display.
