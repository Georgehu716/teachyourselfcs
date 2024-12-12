# 1 Building Abstractions with Procedures

## 1.1 The Elements of Programming

### 1.1.5 The Substitution Model for Procedure Application

Applicative order versus normal order

This alternative ``fully expand and then reduce'' evaluation method is known as *normal-order evalutation*, in contrast to the ``evaluate the arguments and then apply'' method that the interpreter actually uses, which is called *applicative-order evaluation*.

### 1.1.7 Example: Square Roots by Newton's Method

The contrast between mathematical function and computer procedures is a reflection of the general distinction between describing properties of things and describing how to do things, or, as it is sometimes referred to, the distinction between declarative knowledge and imperative knowledge. In mathematics we are usually concerned with declarative (what is) descriptions, whereas in computer science we are usually concerned with imperative (how to) descriptions.

In a related vein, an important current area in programming-language design is the exploration of so-called very high-level languages, in which one actually programs in terms of declarative statements. The idea is to make interpreters sophisticated enough so that, given ``what is" knowledge specified by the programmer, they can generate ``how to" knowledge automatically.
