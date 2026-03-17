---
title: Explicit memory segments and linker script alignment critical for reliable NES ROMs
date: 2026-03-16
tags: [assembly, linker, memory-layout, 6502]
type: gotcha
project: DapperBanana/NES-Projects
---

NES development exposes how fragile implicit memory assumptions become. The NROM-128 linker script has to map zero page, stack, RAM, and PRG ROM explicitly—there's no default. If your linker config doesn't specify segment sizes ($0100 for zero page, $0100 for stack within RAM), or if the iNES header lands in the wrong PRG bank, the ROM either crashes on hardware or runs in an emulator but not on real cartridges.

The dev plan mentioning mapper variants matters: every mapper (NROM, UxROM, MMC1, etc.) has different address space rules. NROM-128 gives you 16KB PRG, NROM-256 gives 32KB. The linker config assumes a specific layout; switching mappers without updating ld65 config will silently produce a broken ROM that appears to work until it hits a PRG boundary crossing. Building with a Makefile and validating iNES headers programmatically (or by inspection) catches this early.
