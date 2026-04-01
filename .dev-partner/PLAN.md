## NES-Projects Development Plan

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
7. [x] Refactor mariotest to use shared lib modules and new build system
8. [x] Add sprite DMA helper routines to ppu.in
9. [x] Add basic horizontal scrolling test ROM

## Next Step
Implement vertical scrolling and background updates for dynamic levels.