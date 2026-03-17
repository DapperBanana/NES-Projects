# NES-Projects Development Plan

## Goal
Build working NES ROMs using 6502 assembly, targeting ca65/ld65 toolchain (cc65 suite).

## Current State
- iNES header, linker config, PPU init, and input modules created
- Minimal "hello" ROM sets background to blue
- Makefile builds hello.nes via ca65/ld65

## Completed
1. [x] Add proper iNES header module that can be included by projects
2. [x] Set up ca65/ld65 linker config for standard NROM-128 mapper
3. [x] Create a minimal "hello world" ROM that sets background color
4. [x] Add Makefile for building .nes ROMs
5. [x] Add PPU initialization routines as reusable module
6. [x] Add controller input reading module

## Next Steps
1. [ ] Refactor mariotest to use shared lib modules and new build system
2. [ ] Add sprite DMA helper routines to ppu.inc
3. [ ] Build a simple sprite movement demo using input module
4. [ ] Add CHR tile data and background rendering example
5. [ ] Add NROM-256 (32KB PRG) linker config variant
6. [ ] Investigate MMC1 mapper support for larger projects

## Architecture
- `/lib/` — reusable 6502 modules (header, ppu, input)
- `/cfg/` — ld65 linker configs
- `/src/` — individual ROM projects
- `/build/` — output directory (gitignored)

## References
- https://www.nesdev.org/wiki/
- ca65 Users Guide
