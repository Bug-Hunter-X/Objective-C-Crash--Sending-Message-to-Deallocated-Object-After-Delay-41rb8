# Objective-C Crash: Sending Message to Deallocated Object After Delay

This repository demonstrates a common Objective-C error involving crashes due to sending messages to deallocated objects after using `performSelector:withObject:afterDelay:`.

The `bug.m` file shows the problematic code. The `bugSolution.m` file provides a solution using weak references and checking for nil.