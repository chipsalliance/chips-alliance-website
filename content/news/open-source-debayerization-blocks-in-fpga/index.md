---
date: 2021-11-30T00:00:00Z
title: Open Source Debayerization Blocks in FPGA
categories:
  - Blog
author: 
images: ['news/open-source-debayerization-blocks-in-fpga/share.jpg']
aliases: ['/blog/2021/11/30/open-source-debayerization-blocks-in-fpga/']
---

*This post was originally published at [Antmicro](https://antmicro.com/blog/2021/10/debayerization-blocks-in-fpga/).*

In [modern digital camera systems](https://antmicro.com/platforms/custom-camera-platforms/), the captured image undergoes a complex process involving various image signal processing (ISP) techniques to reproduce the observed scene as accurately as possible while preserving bandwidth. On the most basic level, most CCD and CMOS image sensors use the Bayer pattern filter, where 50% of the pixels are green, 25% are red and 25% are blue (corresponding to the increased sensitivity of the human eye to the green color). [Demosaicing](https://en.wikipedia.org/wiki/Demosaicing), also known as debayering, is an important part of any ISP pipeline whereby an algorithm reconstructs the missing RGB components/channels of each pixel by performing interpolation of the values collected for individual pixels.

![Diagram depicting debayerization process](debayering-diagram.svg)

The rapid development of FPGA technologies has made it possible to use advanced ISP algorithms in FPGAs even for high-res, multi-camera arrays, which is great news for [resource-constrained real-time applications where image quality is essential](https://antmicro.com/technologies/vision-systems/). In our R&D work, we are developing reusable open source building blocks for various I/O and data processing purposes that can be used as a starting point for customer projects which need to be bootstrapped quickly, and those include IP cores for debayerization.

## Open source debayerization

As part of a recent project, we implemented and tested an open source FPGA-based demosaicing system that converts raw data obtained from CCD or CMOS sensors and reconstructs the image using three different interpolation algorithms controlled via a dedicated wrapper. The three interpolation methods are:

- Nearest neighbour interpolation, where the nearest pixel is used to approximate the color value. This algorithm is simple to implement and is common in real-time 3D rendering. It uses a 2×2 px matrix and is the lightest and easiest method to implement.
- Bilinear interpolation, which establishes color intensity by calculating the average value of the 4 nearest pixels located diagonally in relation to the given pixel. This method uses a 3×3 px matrix and gives better results than the nearest neighbour interpolation method but takes up more FPGA resources.
- Edge directed interpolation, which calculates the pixel components in a similar way to bilinear interpolation, but uses edge detection with a 5×5 px matrix. This algorithm is the most sophisticated of the three, but gives the best results and eliminates zippering.

## System structure

The demosaicing system consists of two parts. The most important part is formed by the [demosaicing cores](https://opensource.antmicro.com/projects/fpga-isp-core) representing the three algorithms described earlier.

![Diagram depicting dmosaicing wrapper](demosaicing-wrapper-diagram.svg)

The software part of the system runs in the FPGA and features the bootloader, operating system (Linux), Antmicro’s [open source FastVDMA](https://opensource.antmicro.com/projects/fastvdma) IP core that controls data transmission between the demosaicing setup and the DDR3 memory, and a dedicated [Linux driver](https://github.com/antmicro/linux-xlnx/tree/demosaicer) that makes it possible to control the demosaicing cores from software.

## Open source FPGA IP cores for vendor-neutral solutions

Apart from building highly-capable vision systems based on FPGA platforms, we are developing various tools, open source IP cores and other resources to provide our customers with a complete, end-to-end workflow that they can fully control.

Some of our recent projects include the [FPGA Interchange Format](https://antmicro.com/blog/2021/09/symbiflow-fpga-interchange-format/) to enable interoperability between FPGA development tools, an open source [PCIe link for ASIC prototyping in FPGA](https://antmicro.com/blog/2021/02/high-throughput-open-source-pcie-on-xilinx-vu19/) or an [FPGA-based testing framework for hardware security of DRAM](https://antmicro.com/blog/2021/08/open-source-ddr-test-framework-for-rowhammer/). If you would like to benefit from introducing a more software-driven, open source friendly work methodology into your next product development cycle, reach out to us at contact@antmicro.com and keep track of our growing list of open IP cores at the [Antmicro Open Source Portal](https://opensource.antmicro.com/).