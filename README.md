# VHDL Multiplier Race Condition

This repository demonstrates a potential race condition in a VHDL multiplier implementation. The code uses a simple combinational multiplication and does not properly account for propagation delays. This could lead to incorrect results, especially in high-speed applications.

## Problem

The issue lies in the direct assignment of the `prod` signal to `result`.  The multiplication operation (`prod <= UNSIGNED(a) * UNSIGNED(b);`) might take several clock cycles to complete. If the clock edge arrives before the multiplication is finished, `result` will contain an intermediate, incorrect value.

## Solution

A more robust solution would use a pipeline or a process that ensures the multiplication is complete before updating the output.  This can be achieved through additional registers or state machines.