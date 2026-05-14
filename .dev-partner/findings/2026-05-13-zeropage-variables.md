---
title: Zeropage usage for sprite data
date: 2026-05-13
tags: [assembly, 6502, zeropage, optimization]
type: technique
project: DapperBanana/NES-Projects
---

Using zeropage variables for sprite coordinates and tile index makes sense for performance reasons on the 6502. Accessing memory locations in zeropage requires fewer clock cycles than accessing absolute addresses. By keeping `sprite_x`, `sprite_y`, and `sprite_tile` in zeropage, the sprite drawing routine can achieve better performance, which is crucial for a system like the NES. This is a common optimization technique for 6502 development.
