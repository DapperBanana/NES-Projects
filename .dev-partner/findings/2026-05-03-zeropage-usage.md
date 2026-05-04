---
title: Leveraging Zeropage for Performance
date: 2026-05-03
tags: [zeropage, performance, 6502]
type: performance
project: DapperBanana/NES-Projects
---

The code utilizes the 6502's zeropage for storing variables like `sprite_count`, `sprite_x`, and `sprite_y`. Zeropage access is significantly faster than accessing other memory locations because it uses shorter addressing modes (one byte instead of two for the address).  This is crucial for the NES, where CPU cycles are at a premium, especially within the NMI routine where display updates occur. By placing frequently accessed variables in zeropage, the code optimizes for speed, which is important for smooth sprite movement and game logic.
