----
date: 2024-10-13T00:00:00Z
title: Announcing Caliptra 1.0 Root of Trust Macro
categories:
  - Blog
author:  
images: ['news/Caliptra/Caliptra_logo.png']
aliases: ['/blog/2024/10/12/Caliptra 1.0 Released']
----

**Caliptra @ OCP Global Summit 2024**

# Introduction

As we continue to advance the field of hardware security, we are thrilled to celebrate the successful integration of Caliptra 1.x by our esteemed partners. Their commitment to enhancing security through the adoption of our open-source Root of Trust (RoT) is a testament to the collaborative spirit of the Open Compute Project (OCP). In this post, we also look ahead to the exciting developments planned for Caliptra 2.0.

# Recognizing Caliptra 1.x Integrators

We are proud to recognize the following companies for their successful integration of Caliptra 1.x into their products. Each integrator has demonstrated a strong commitment to security, transparency, and innovation. Click on the company names to read their detailed blog posts about their integration of Caliptra:

1. [AMD](https://community.amd.com/t5/corporate/addressing-security-integrating-project-caliptra-into-amd-s/ba-p/716837)  
2. [ASPEED](https://www.aspeedtech.com/news_content/?id=66fe4a60e3e8c86fb9134b0e)  
3. [AXIADO](https://axiado.com/axiado-integrates-caliptra-1-0-silicon-root-of-trust-into-its-flagship-tcu-product/)

We extend our heartfelt thanks to these integrators for their dedication and collaboration. Their efforts are instrumental in driving the adoption of secure, open-source hardware solutions.

# What's Next: Caliptra 2.0

As we celebrate the achievements of Caliptra 1.x, we are also excited to share our vision for Caliptra 2.0. The single most important priority in the Caliptra 2.0 roadmap is the integration of Post-Quantum Cryptography (PQC) algorithms, ensuring our solutions remain secure against future threats.

## Key Focus: Post-Quantum Cryptography (PQC)

- Dilithium for Secure Boot and Attestation  
- Hardware-Accelerated Cryptos with Countermeasures  
- Kyber for Key Wrapping  
- Continued Support for Existing Algorithms

## Caliptra Subsystem Profile

To further reduce the SOC integration burden, Caliptra 2.0 will introduce the Caliptra Subsystem, which includes:

- ### Caliptra Core 2.0

  - **OCP Recovery Mode/Streaming Boot**: Enhanced capabilities for secure boot and recovery.  
  - **Security Services & Primitives**: Providing essential security services and primitives for SOC operations.

- ### Fuse Controller

  - **Extendable to SOC Specific Fuses**: Managing fuses for Caliptra and extendable to SOC-specific fuses.

- ### Manufacturer Control Unit (MCU)

  - **SOC Specific Firmware**: Running SOC-specific firmware authenticated, measured, and loaded by Caliptra at boot time.  
  - **SOC Initialization and Management**: Capable of performing SOC-specific initialization, reset control, security policy enforcement, initial configuration (e.g., GPIO programming, glitch detection circuits, reading/moving non-secret fuses).  
  - **No Cryptos in MCU**: The MCU uses the Caliptra core for all cryptographic operations.

- ### Reference Stack

  - **MCTP PLDM, SPDM**: Implementing a reference stack for these protocols.

- ### VeeR Based CPU with PMP & User Mode Support

  - **Enhanced Security**: Providing robust security features with PMP (Physical Memory Protection) and user mode support.

## Caliptra 2.0 Timeline

- ### RTL Design Freeze \- October 2024

- **Includes PQC (Dilithium)**: The RTL design freeze will incorporate the Dilithium algorithm, marking a significant milestone in our roadmap.  
- **Partial Spec Release**: At this point, we aim to release a partial specification to facilitate early integration efforts.

- ### RTL Post-Verify Freeze \- February 2025

  - **Caliptra Core ROM and FMC**: This freeze will include the Caliptra Core ROM and the First Microcontroller (FMC), ensuring a stable and verified design.  
  - **Firmware Development**: As customary, firmware development will lag slightly behind the hardware milestones, with the final specification being completed in sync with the firmware.

# Conclusion

We are immensely proud of the progress made with Caliptra 1.x and grateful to our integrators for their support and collaboration. As we look forward to the advancements in Caliptra 2.0, particularly with the integration of PQC algorithms and the introduction of the Caliptra Subsystem, we remain committed to fostering a secure, transparent, and innovative hardware ecosystem.

Stay tuned for more updates and join us in shaping the future of hardware security.  
