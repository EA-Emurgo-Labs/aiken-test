# aiken-test

This is a testing suite for Aiken

This repo is a suite of testing tools for testing smart contracts in akien.

## Unit Testing

A set of helper functions to create unit tests for helper functions and validators.

### Tx

Tx has some basic functions for unit testing and helper functions for building transaction data for your validator tests.

Inputs, Outputs, Script & Wallet Addresses

### Value

Value has some functions for turning Lists or Tuples into Values. 

These are good to combine with Fuzzers to create random Values for your validator tests.

## Property Testing

A set of fuzzers to create property tests for helper functions and validators.

### Hash

This module creates lists and tuples of hashes at 28Bytes, which is the length of script hashes, meaning it is perfect for credentials and assets.

### Ints

The Ints module creates lists and tuples of ints between 1-10. 

This is to minimise the variation for validator value tests so values used will sometimes match, helping to create failing tests with props.

---

### WARNING

This testing suite is under development and currently incomplete

---

Poject notes during development here: 
[Notes](./Notes.md)