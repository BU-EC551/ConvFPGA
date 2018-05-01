# ConvFPGA
This is a project intended to run convolutional neural nets on an FPGA.
Convolutional neural nets are MAC-heavy computations with a well defined structure lots of data parallelism. The end result of the computation is progressively higher-level feature maps that describe what's going on in the image, in a machine-learnable format.

Unfortunately, we did not achieve our goal of running our project on the zedboard. We mainly ran into issues running and interfacing with linux.

Despite the integration failure, our project has achieved success in three major components:

## Accelerator
We have convolutions working in sim and synthesized (in a low-power form) on the nexys-3. The accelerator itself works great -- if you can get data to it.

## Driver
The driver is a C program that connects to an imaginary interface with the board, and manages loading data and running operations. It loads the image and weights from the filesystem, and passes that data to the FPGA. The driver also implements the FC, LRN, and MAXPOOL layers that are not computed on the FPGA.

## Network
We trained a neural network to classify images with 18-bit fixed point operations. The network is based around the AlexNet architecture, and involves 6 convolution operations.