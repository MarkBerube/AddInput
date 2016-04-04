# AddInput

An adding function built in MIC-1 assembly with overflow protection.

## Installation

Clone this repository in either the GitHub client or download the repository as a zip.

## Usage

Download your favorite MIC-1 simulator/emulator(using masm in this case) and run the assembly code in the AddInput.asm file.

Assemble the AddInput object:

`masm <AddInput.asm> AddInput.obj`

Run with your MIC-1 assembly emulator:

`mic1 newprom.dat AddInput.obj`
