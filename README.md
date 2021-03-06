# STON - Smalltalk Object Notation

[![CI](https://github.com/svenvc/ston/actions/workflows/CI.yml/badge.svg)](https://github.com/svenvc/ston/actions/workflows/CI.yml)

A lightweight text-based, human-readable data interchange format 
for class-based object-oriented languages like Smalltalk.
It can be used to serialize domain level objects, 
either for persistency or network transport. 
As its name suggests, it is based on JSON (Javascript Object Notation). 
It adds symbols as a primitive value, class tags for object values and references. 
Implementations for Pharo Smalltalk, Squeak and Gemstone Smalltalk are available.

## Installation

```Smalltalk
Metacello new
	baseline: 'Ston';
	repository: 'github://svenvc/ston/repository';
	load
 ```

## Documentation

The original [Smalltalk Object Notation](https://github.com/svenvc/ston/blob/master/ston-paper.md) paper

The Pharo Enterprise book [STON](https://ci.inria.fr/pharo-contribution/job/EnterprisePharoBook/lastSuccessfulBuild/artifact/book-result/STON/STON.html) chapter

The most formal description is [The STON Specification](https://github.com/svenvc/ston/blob/master/ston-spec.md)

*Sven Van Caekenberghe* 
[MIT Licensed](https://github.com/svenvc/ston/blob/master/license.txt)

## Dependency

Add the following code to your Metacello baseline or configuration

```
spec 
   baseline: 'Ston' 
   with: [ spec repository: 'github://svenvc/ston/repository' ]
```
