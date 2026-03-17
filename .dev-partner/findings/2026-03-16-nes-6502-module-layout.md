---
title: Modular 6502 assembly pattern for NES development with reusable PPU/input modules
date: 2026-03-16
tags: [assembly, 6502, nes, modularity]
type: pattern
project: DapperBanana/NES-Projects
---

Setting up separate include files for PPU init and controller input reading is solid for NES dev. Rather than embedding all init logic in the main ROM, breaking PPU setup (vertical blank sync, sprite/background table configuration) into a dedicated module makes it trivial to reuse across multiple projects without copy-paste drift.

The iNES header and NROM-128 linker config as separate artifacts also pays off—when moving to NROM-256 or MMC1 later, you only swap the linker script and header, not scattered address definitions throughout the codebase. The Makefile tying ca65 → ld65 → ROM output keeps the build deterministic and avoids manual asm-to-obj-to-bin steps.

Controller input as a module is particularly valuable; 6502 polling is straightforward (strobe, read 8 bits serially) but the timing constraints are rigid. Isolating that logic means you can test input handling independently and reuse it across different game logic without worrying about PPU state interference.
