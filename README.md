<p align="center">
<svg height="200" width="600" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><filter id="a"><feGaussianBlur stdDeviation="1"/></filter><rect height="200" rx="32" width="600"/><circle cx="75" cy="40" fill="#efefef" r="4"/><circle cx="125" cy="40" fill="#efefef" r="4"/><circle cx="100" cy="150" fill="#3f3f3f" r="16"/><g fill="#fff"><path d="m84 150c0 10 32 10 32 0 0 20-32 20-32 0" filter="url(#a)"/><text font-size="60" x="170" y="120">IPv6 Mnemonic</text></g></svg>
</p>

<p align="center">
Help make IPv6 Addresses 🤖 more human-friendly 🕺🏻
</p>

**IPv6 Mnemonic** is an alternative way to represent [IPv6 Addresses](https://en.wikipedia.org/wiki/IPv6_address#Representation) 
by representing the address as written prose (sentence, paragraph, poem).

# Synopsis

The representation of [IPv6 Addresses](https://en.wikipedia.org/wiki/IPv6_address#Representation) 
is not exactly the most human-friendly way to remember them. Although the 
specification does help to compact and simplify the representation, hexadecimal 
is not often easily remembered or discussed between people (at least, in my 
experience).

# Specification - v0.1

## Background

The following is by no means a definitive reference of the IPv6 Address 
representation standard, but provides a rough understanding to get a better 
understanding of how mnemonics can be applied later on.

An IPv6 Address is represented as eight individual 4-digit lower-case 
hexadecimal values, separated by the colon `:` character. For example:
```
2134:0000:7fa3:0000:0000:0000:1986:7777
```
This can be further compacted by omitting any leading zeros `0`, and longest 
sequence of zeros as two colons `::`. Continuing with the previous example:
```
2134:0:7fa3::1986:7777
```

## IPv6 Mnemonic Goal

To represent IPv6 Address as a [readable and memorable prose](https://fiveable.me/key-terms/english-prose-style/memorable-writing). 
That is, a set of words arranged in such a way that it is not a garbled mix of 
random words strung together, but instead seems to convey some meaning or rhythm.

## IPv6 Mnemonic Specification (v0.1 - aka: ALPHA #1)

> **NOTE:** This is a draft specification, designated as __v0.1 - ALPHA #1__. 
>
> Updated specifications may have incompatible changes during the 'alpha' phase,
> leading toward version v1.0 of the specification.

To achieve the goal, the IPv6 address must be mapped to english words, then 
possibly re-arranged into a memorable prose. The steps are as follows:

### 1. Start with Compact

The IPv6 Address must first be converted to its standard compact representation:

`2134:0000:7fa3:0000:0000:0000:ffff:7777` → `2134:0:7fa3::ffff:7777`

### 2. Map to Nouns

Each 4-digit hexadecimal value maps to ($2^{16}$ = 65,536) possible values. With
this in mind, each value of the address can be mapped to one of a selection of 
nouns from the included reference list (almost):

```
2134          :  0     : 7fa3         :: ffff : 7777
 ↓            :  ↓     :  ↓           ::  ↓   :   ↓
continence    : a'hood : scorpionfish :: ???  : razorblade
...
```

However, it becomes clear that ($2^{16}$ = 65,536) can map to some rather 
obscure nouns, and it does not map every value to a unique noun (due to the 
reference list having 40,940 words). Because of this, and the need to allow the 
user to select from a few options, each 4-digit hexadecimal can optionally be 
split into two 2-digit hexadecimals ($2^8$ = 256) or remain as the original 
4-digit hexadecimal, provided the value is below 0x9fec (40,940). 

Following on from the above example, this now gives the options:
```
2134                : 0             : 7fa3           :: ffff      : 7777
↓                   : ↓             : ↓              :: ↓         : ↓
continence          : a'hood        : scorpionfish   :: ???       : razorblade
21          34      :        0      : 7f       a3    :: ff    ff  : 77     77
↓           ↓       :        ↓      : ↓        ↓     :: ↓     ↓   : ↓      ↓
ability     thing   :        actor  : moment   phone :: virus boy : soup   ...
leadership  outcome :        people : proposal ...   :: end       : speed
level       ...     :        point  : ...            :: edge
...
```

We can pick and chose a noun to represent each number, in whatever combination. 
This can give us `leadership`, `outcome`, `actor`, `moment`, `phone`,
`edge`, `boy`, `soup`, `speed` - but this doesn't make a memorable or even 
sensible prose when strung together, as _leadership outcome people actor moment 
phone edge boy soup speed_ is complete gibberish! The next step will help solve
this issue.

### 3. Reorder the Words

To change the gibberish mix of words into a more memorable and readable prose, 
the words can be re-arranged into any order and mixed with other non-noun words
(specifically, words not on the reference lists). This requires a special 
**"Word Order Mark" (WOM)** that indicates the original positions of the mapped
value-nouns.

Let's show this in the continuing example. From the original IPv6 Address and 
index position for each 2-digit hexadecimal:
```
21 34 : 00 00 : 7f a3 : 00 00 : 00 00 : 00 00 : ff ff : 77 77
 0  1 :  2  3 :  4  5 :  6  7 :  8  9 : 10 11 : 12 13 : 14 15
```
We now have the following:
```
0:leadership 1:outcome 3:actor 4:moment 5:phone 12:edge 13:boy 14:soup 15:speed
```

> Note that indexes `2`, `6`, `7`, `8`, `9`, `10`, and `11` are not present, as 
> these were removed due to the IPv6 Address compacting step.

Now, let's re-order and add some other words to make something more 
understandable:
> The 13:**boy** stood at the 12:**edge**, his 4:**moment** of glory arriving as
> an 3:**actor**. Those in the theatre watched in awe, their 5:**phones** 
> capturing the production. Knowing his 15:**speed** and talent came from 
> 0:**leadership** and dedication to the 1:**outcome**, which he celebrated 
> later with a tasty 14:**soup**.

This results in a change to the ordering as 13, 12, 4, 3, 5, 15, 0, 1, 14. We
need some way to represent this, which we achieve with the "Word Order Mark" 
(WOM), as previously described. The ordering is represented as a hexadecimal:
```
13 12 04 03 05 15 00 01 14
↓  ↓  ↓  ↓  ↓  ↓  ↓  ↓  ↓
d  c  4  3  5  f  0  1  e
```
The WOM is therefore `0xdc435f01e`. 

The WOM is represented anywhere in the prose within square (`[` and `]`) 
brackets, or if absent, means the ordering was not altered (i.e. same as
`0x0123456789abcdef`). 

The WOM itself can be converted to a mnemonic using the same procedure as 
detailed here (must be matching version). As such, there can be multiple inner 
WOM mnemonics using inner-square brackets until the desired level of reduction 
is made.

The final result of the WOM can therefore be `[0xdc435f01e]` or `[The speaker
during the exam, next to the town, regaled the people of a tale]`.
```
dc      43   5f   01     e0
220     67   95   1      224
speaker exam town people tale
```

### 4. Version Tag

A version tag is needed to identify what version of the specification, and the
associated list of nouns, are used. Without the tag, it is assumed that the
specification used is version 1 (the final ratified version). The version tag
is signified at the start of the mnemonic with the letter `v` followed by the
version number. For example `v1.0`.

## Completed Example

The end result of the address `2134:0:7fa3::ffff:7777` to mnemonic can be:
> v0.1 The boy stood at the edge, his moment of glory arriving as an actor. The 
> people in the theatre watched in awe, their phones capturing the production. 
> Knowing his speed and talent came from leadership and dedication to the 
> outcome, which he celebrated later with a tasty soup. [The speaker
during the exam, next to the town, regaled the people of a tale].

# Remarks

It is clear that a better solution for the WOM is needed.

# Motivation

There was a time, _well, just once really_, when I needed to manually enter a 
few IPv6 addresses between some systems. Though I only needed to do this about 
five times, doing it even once was too many in my view. From this task, I 
quickly conceived an idea on how this could be done in a better way.

I also wanted a simple utility that I could use as a basis at trying my hand at 
various programming languages. This project seemed perfect for this purpose.

# Acknowledgements

- [github.com/trag1c](https://gist.github.com/trag1c) - [nouns.txt](https://gist.github.com/trag1c/f74b2ab3589bc4ce5706f934616f6195)
- [github.com/hugsy](https://github.com/hugsy) - [english-nouns.txt](https://github.com/hugsy/stuff/blob/main/random-word/english-nouns.txt)
