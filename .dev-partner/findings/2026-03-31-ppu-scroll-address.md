---
title: PPU Scroll Register Address
date: 2026-03-31
tags: [NES, PPU, memory map]
type: gotcha
project: DapperBanana/NES-Projects
---

The NES PPU's scroll register is accessed through memory address $2005. It's a write-only register used to control the fine scrolling of the background.  A common mistake (which I made!) is to assume it's accessed via $2006, the PPU address register, since they're related.  However, $2005 specifically controls the scroll offset.  Writing to $2005 twice sets the horizontal and vertical scroll values, respectively. Getting this wrong will cause visual glitches and incorrect scrolling behavior.
