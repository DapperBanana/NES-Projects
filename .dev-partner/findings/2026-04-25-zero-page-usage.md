---
title: Zero Page Usage for Performance
date: 2026-04-25
tags: [assembly, 6502, performance]
type: performance
project: DapperBanana/NES-Projects
---

The commits show a pattern of moving variables (sprite attributes, X/Y coordinates) to the zero page. The 6502 processor has faster and shorter addressing modes for zero page memory (addresses $00-$FF). By placing frequently accessed variables in the zero page, the code can execute faster and use fewer bytes because instructions accessing the zero page require only one byte for the address instead of two. This optimization is especially important on a system like the NES with limited processing power and memory.
