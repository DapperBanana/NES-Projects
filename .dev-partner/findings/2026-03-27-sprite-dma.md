---
title: PPU Sprite DMA Transfer Routine
date: 2026-03-27
tags: [ppu, performance, 6502]
type: technique
project: DapperBanana/NES-Projects
---

The NES PPU has a dedicated DMA channel for transferring sprite data to OAM (Object Attribute Memory). This routine leverages that by setting the `$2003` (OAMADDR) and `$2004` (OAMDATA) registers, then triggering a DMA transfer by writing to `$4014`. This is significantly faster than manually writing sprite data byte-by-byte, as the CPU is freed during the DMA transfer. The trade-off is that the CPU is stalled for ~512 cycles during the transfer, so it's best used during vblank.
