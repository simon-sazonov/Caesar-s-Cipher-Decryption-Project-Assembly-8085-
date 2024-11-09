# Caesar’s Cipher Decryption Project (Assembly 8085)

**Authors**:  
- Francisco Magalhães 
- Gonçalo Farinha 
- Martim Pires  
- Simon Sazonov   

**Date**: January 2024

## Project Overview

This project implements an Assembly 8085 program designed to decrypt messages encoded with a Caesar cipher. The algorithm can detect and decode messages by identifying a specific word, "OTA," embedded in each encrypted text. With this identifier, the program deduces the cipher key, decodes the entire message, and saves the key for potential future use.

The project focuses on efficient decoding without prior knowledge of the Caesar cipher’s shift value and demonstrates a structured approach to cryptography using the Assembly 8085 environment.

---

## Objectives

### Primary Objectives:
- **Detect and Decrypt**: Identify the encrypted "OTA" sequence and decrypt the entire message without knowing the cipher key in advance.
- **Key Deduction**: Calculate the Caesar cipher key and use it to decode the rest of the message.
- **Message Replacement**: Replace the original message in memory with the decoded output.
- **Key Storage**: Store the deduced key for future reference.

### Secondary Objectives:
- **User-Friendliness**: Ensure that the code is easy to understand, use, and debug.
- **Robustness**: Handle various message types and lengths.
- **Scalability**: Design with future needs in mind, enabling potential adaptations to different encryption schemes or larger messages.

---

## Solution Approach

1. **Understanding Caesar Cipher Mechanics**: The Caesar cipher shifts each letter by a fixed number of positions in the alphabet.
2. **Known Element Detection**: The program checks for the sequence "OTA" in the message by analyzing ASCII values.
3. **Decoding Process**: Once "OTA" is located, the shift key is deduced, and the program iterates through the message to decode it.
4. **Looping**: Supports positive and negative shifts, ensuring compatibility with ASCII table limits by looping values beyond boundaries.
5. **Simulator Compatibility**: The program is verified to work on multiple simulators, including the online [Sim8085](https://www.sim8085.com/) and [GitHub 8085 Simulator](https://github.com/8085simulator/8085simulator.github.io).

---

## Implementation

### Code Structure

- **Main Routine**:
  - `BLOCKLOOP`: Locates "OTA" and calculates the key.
  - `DECODELOOP`: Applies the key to decode the entire message.
  - `END`: Saves the key in the accumulator and halts the program.

- **Sub-Routines**:
  - `COMPARE`: Checks conditions between memory values.
  - `DECODE`: Decodes characters and stores the result in memory.

### Memory Management

- **Character Handling**: Manages shifts that exceed ASCII table boundaries, looping values when necessary.
- **Program Flexibility**: The code can be pasted and executed in any 8085 simulator.

---

## Testing

- **Test Cases**: Multiple encrypted messages with known keys were used to verify accuracy.
- **Edge Cases**: Tested for multiple occurrences of "OTA" and varying letter casing.
- **Simulator Validation**: Verified across different platforms to ensure compatibility and correctness.

---

## Usage

### Prerequisites

- **Assembler**: Use any standard 8085 Assembly language assembler.
- **Simulator**: Any 8085 simulator can run the code, such as [Sim8085](https://www.sim8085.com/).

### Instructions

1. **Load the Code**: Copy and paste the program into the assembler.
2. **Run the Code**: Follow your simulator's procedures to compile and execute.
3. **View Output**: After execution, the decoded message and deduced key will be stored in memory.

---

## Conclusion

This project achieves the goal of Caesar cipher decryption within the Assembly 8085 environment, handling boundary cases and optimizing for limited 8085 resources. The modular design supports scalability and simplifies debugging. Future improvements could include extending the algorithm to other ciphers or adapting it for larger datasets, potentially enabling real-time decryption in advanced cryptographic applications.
