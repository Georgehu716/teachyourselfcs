# 1 Building Abstractions with Procedures

## 1.1 The Elements of Programming
### 1.1.5 The Substitution Model for Procedure Application

Applicative order versus normal order

This alternative ``fully expand and then reduce'' evaluation method is known as *normal-order evalutation*, in contrast to the ``evaluate the arguments and then apply'' method that the interpreter actually uses, which is called *applicative-order evaluation*.

### 1.1.7 Example: Square Roots by Newton's Method

The contrast between mathematical function and computer procedures is a reflection of the general distinction between describing properties of things and describing how to do things, or, as it is sometimes referred to, the distinction between declarative knowledge and imperative knowledge. In mathematics we are usually concerned with declarative (what is) descriptions, whereas in computer science we are usually concerned with imperative (how to) descriptions.

In a related vein, an important current area in programming-language design is the exploration of so-called very high-level languages, in which one actually programs in terms of declarative statements. The idea is to make interpreters sophisticated enough so that, given ``what is" knowledge specified by the programmer, they can generate ``how to" knowledge automatically.

### 1.1.8 Procedures as Black-Box Abstractions

The problem of computing square roots breaks up into a number of subproblems.

Procedural decomposition of the problem into subproblems.

```mermaid
graph TD;
  sqrt --> sqrt-iter;
  sqrt-iter --> good-enough;
  sqrt-iter --> improve;
  improve --> average;
  good-enough --> square;
  good-enough --> abs;
```

It is crucial that each procedure accomplishes an identifiable task that can be used as a module in defining other procedures.

Regard procedure as a black box. procedural abstraction. So a procedure definition should be able to suppress detail. The users of the procedure may not have written the procedure themselves, but may have obtained it from another programmer as a black box. A user should not need to know how the procedure is implemented in order to use it.


#### Local names

The parameter names of a procedure must be local to the body of the procedure.

The set of expressions for which a binding defines a name is called the scope of that name.


#### Internal definitions and block structure

```
(define (sqrt x)
  (define (good-enough? guess)
    (< (abs (- (square guess) x)) 0.001))
  (define (improve guess)
    (average guess (/ x guess)))
  (define (sqrt-iter guess)
    (if (good-enough? guess)
        guess
        (sqrt-iter (improve guess))))
  (sqrt-iter 1.0))
```

Such nesting of definition, called block structure, is basically the right solution to the simplest name-packaging problem.

Then x gets its value form the argument with which the enclosing procedure sqrt is called. This discipline is called lexical scoping.

We will use block structure extensively to help us break up large programs into tractable pieces. The idea of block structure originated with the programming language Algol 60. It appears in most advanced programming languages and is an important tool for helping to organize the construction fo large programs.


## 1.2 Procedures and the Processes They Generate

Our situation is analogous to that of someone who has learned the rules of how the pieces move in chess but knows nothing of typical openings, tactics, or strategy. Like the novice chess player, we don't yet know the common patterns of usage in the domain.

A procedure is a pattern for the local evolution of a computational process.


### 1.2.1 Linear Recursion and Iteration

linear recursive process, linear iterative process

a recursive process vs. a recursive procedure.

tail-recursive


```
(define (factorial n)
  (if (= n 1)
      1
      (* n (factorial (- n 1)))))
```

```
(define (factorial n)
  (fact-iter 1 1 n))

(define (fact-iter product counter max-count)
  (if (> counter max-count)
      product
      (fact-iter (* product counter)
                 (+ 1 counter)
                 max-count)))
```

Consider the first process. The substitution model reveals a shape of expansion followed by contraction, indicated by the arrow in figure 1.3. The expansion occurs as the process builds up a chain of deferred operations (in this case, a chain of multiplications). The contraction occurs as the operations are actually performed. This type of process, characterized by a chain of deferred operations, is called a recursive process. Carrying out this process requires that the interpreter keep track of the operations to be performed later on. In the ocmputation of n!, the length of the chain of deferred multiplications, and hence the amount of information needed to keep track of it, groups linearly with n (is proportional to n), just like the number of steps. Such a process is called a linear recursive process.

By contrast, the second process does not grow and shrink. At each step, all we need to keep track of, for any n, are the current values of the variables product, counter, and max-count. We call this an iterative process. In general, an iterative process is one whose state can be summarized by a fixed number of state variables, together with a fixed rule that describes how the state variables should be updated as the process moves from state to state and an (optional) end test that specifies conditions under which the process should terminate. In computing n!, the number of steps required grows linearly with n. Such a process is called a linear iterative process.
