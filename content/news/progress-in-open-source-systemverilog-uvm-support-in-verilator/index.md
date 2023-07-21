---
date: 2023-07-21T00:00:00Z
title: Progress in open source SystemVerilog / UVM support in Verilator
categories:
  - Blog
author:
images: ['news/progress-in-open-source-systemverilog-uvm-support-in-verilator/scaling-verilator--chips-alliance.png']
---


[Verilator](https://github.com/verilator/verilator) is a shining example of a widely-accepted open source tool which provides state-of-the-art results in the ASIC design space. It is commonly used for simulation and testing, but originally, due to the lack of capability to run event-driven simulations, Verilator wasn’t even considered capable of handling UVM (Universal Verification Methodology) testbenches implemented in SystemVerilog which require scheduling and other features notably absent from the tool. For some time now, Antmicro, together with Western Digital, Google and others in the [CHIPS Alliance](https://chipsalliance.org/), has been working on enabling fully open source support for SystemVerilog UVM testbenches in Verilator. This has already resulted in significant breakthroughs we have described in this blog, such as implementing [event-driven simulation capabilities](https://antmicro.com/blog/2021/12/coroutines-for-dynamic-scheduling-in-verilator/) in Verilator which has [enabled new and exciting use cases](https://twitter.com/jevinskie/status/1602834358561566720). Since then, on the road to proper UVM testbench support, Antmicro has been working on adding various SystemVerilog constructs and UVM-specific elements into Verilator, which bring us much closer to the goal - the current status and next goals will be described in more detail in this blog note.

![Verilator and UVM illustration](uvm-support-in-verilator-illustration.svg)

### Tracking progress with a custom test suite

In the usual CHIPS Alliance fashion, in order to track progress in this long-term project and catch potential regressions, a [custom test suite and dashboard](https://antmicro.github.io/verilator-verification-features-tests/log.html) was created to provide a concise overview of the current status and some statistics for the tests being executed. This is both informative and motivating, as ticking off consecutive corner cases is a tangible measure of progress. Potentially, this also makes it easy to provide new input to the effort in the form of test cases (e.g. SystemVerilog constructs or elements of testbenches that are known not to work) that need to be addressed, without the necessity to touch the internals of Verilator itself.
  
Thanks to a tight collaboration with Verilator maintainers, as well as a clean and traceable development methodology, many features and improvements outlined in this article, along with the event-driven simulation capability, are now part of [Verilator 5.0](https://verilator.org/guide/latest/changes.html#revision-history), which opens the road to eventual mainline UVM support. 

![Verification features report screenshot](uvm-support-in-verilator-report.svg)

### Improving existing Verilator features

A significant part of Antmicro’s efforts involved expanding features that were implemented in Verilator to some extent, but missing specific corner cases or syntactic capabilities. That was the case for concurrent assertions, which are checked with each clock cycle and return `true` if a certain signal change/state happened. In addition to assertions themselves, we added value sampling. As all sampled value functions are defined in Verilator in terms of the `$past` function, we focused on this one first, and ultimately ended up [adding support for the following keywords](https://github.com/verilator/verilator/pull/3569):
* `$rose`
* `$fell`
* `$changed`
* `$stable`
* `$past`

Along with sampling improvements, we also added [support for the “not” keyword](https://github.com/verilator/verilator/pull/3572) and [named properties](https://github.com/verilator/verilator/pull/3667) in assertions.

Another improvement involved `$test$plusargs`: Verilator did not support expressions (e.g. arbitrary string concatenation) in the arguments of the `$test$plusargs` statement - it worked only for string literals for argument names, whereas [now it works for arbitrary string-type expressions](https://github.com/verilator/verilator/pull/3489): 

```
string bar = "bar";
$test$plusargs({"foo",bar,"baz"});
```

Previously, Verilator had only rudimentary support for classes, however many of the more specific features were not supported. In UVM, class constructors often end with the `return` keyword, and in those cases Verilator returned an error due to a missing return type. Antmicro provided a [fix](https://github.com/verilator/verilator/pull/3734) for that, along with an [improvement](https://github.com/verilator/verilator/pull/3789) to the way `super.new()` calls are handled - some of the UVM classes contained constructors with arguments and when a child class called this constructor explicitly using `super.new()`, Verilator reported an error. This improvement is necessary to make it possible to inherit from a base class that has a constructor with arguments.

We’ve also [added](https://github.com/verilator/verilator/pull/3760) the possibility to use a `foreach` loop with an `object` type of string, as shown in the example below: 
```
function foo;
	string bar;
	foreach (bar[i])
    	$display(bar[i]);
endfunction
```
The `do while` loop was also lacking support for the `break` and `continue` keywords, which required [changes](https://github.com/verilator/verilator/pull/3731) to how this kind of loop was processed.

Although Verilator supported the `unique` method, it did not support it with the `with` keyword. This keyword is used for specifying lambda-like constructs and is now [supported](https://github.com/verilator/verilator/pull/3772) in `unique`, `unique_index`, `min` and `max` in queues. The `with` keyword is now also supported for queue methods in some contexts, namely [when accessing members of complex types](https://github.com/verilator/verilator/pull/3775) and [passing queue elements to functions](https://github.com/verilator/verilator/pull/3739).

Lastly, Verilator had rudimentary support for randomization using the `randomize` method, there was no support for constrained randomization - `constraint` declarations were silently ignored. To support them, the [CRAVE](https://github.com/antmicro/crave) library was extended and heavily adapted to mainline Verilator as a common frontend for several solvers. This enabled support for several cases:
* value-based constraints are supported,
* soft constraints can be added and relaxed,
* `with` clauses can be used to define dynamic constraints.

Note that adding full support for constrained randomization is a significant effort and the partial support has not been mainlined yet. If you still want to give this feature a try before it’s fully ready, you can use [our fork which includes it](https://github.com/antmicro/verilator-1/tree/c975a61f9300a89c0589b84b63200a0d1eb84bde).

### Adding new features to Verilator

On top of the improvements mentioned above, we have also identified and implemented new features that can benefit Verilator and its users. For designs and testbenches we are working with, there are specific signal types that were not supported by Verilator. For example, we’ve [added support](https://github.com/verilator/verilator/pull/3501) for wildcard associative arrays (using wildcard index).

So far, Verilator only supported packed struts which cannot contain various types within them e.g. strings. We have [now added support](https://github.com/verilator/verilator/pull/3802) for unpacked structs and for the `--structs-packed` flag, allowing for their different memory layout as well as various types.

Another feature that we [added](https://github.com/verilator/verilator/pull/3654) to Verilator is support for virtual interfaces, which are required by UVM. Virtual interfaces are “pointers” to interfaces, their value represents an instance of the interface. That’s also the only way to access interfaces from within classes in SystemVerilog (an interface instance cannot be defined in class).

UVM makes extensive use of built-in classes provided by the `std` package. [Until recently](https://github.com/verilator/verilator/pull/3755), Verilator didn’t allow instantiating classes defined outside the current package. The example below shows usage of the “foo” class which is outside of the “bar” package, which would not work before our changes.

```
class foo;
endclass

package bar;
	function foo get_foo;
    	foo baz = new;
    	return baz;
	endfunction
endpackage
```
There were several outstanding issues in Verilator where the `this` keyword used as a reference or function argument was unsupported - they are now [fixed](https://github.com/verilator/verilator/pull/3675). Verilator also lacked support for some of the classes present in the `std` package, namely `std::semaphore` and `std::mailbox` (parametrized variant), which are used in several places in the UVM library. Both classes are now [supported](https://github.com/verilator/verilator/pull/3708). 

Parameterized classes are the backbone of UVM. A significant portion of custom objects definitions in UVM is based on parameterized classes. Verilator did not support parameters in classes at all but thanks to the improvements introduced by Antmicro, the following parameterization features [have been implemented](https://github.com/verilator/verilator/pull/3541): 
* class parameters,
* type parameters in classes,
* parameterized subclasses,
* scope resolution when accessing members of parameterized classes.

Signal strengths are used for so-called “conflict resolution”. Very basic signal strength support has been added to Verilator, including the following features:
* [Statically handling strengths when the strongest signal is a constant](https://github.com/verilator/verilator/pull/3601). 
* [Resolving assignments with equal strengths](https://github.com/verilator/verilator/pull/3637). 
* Tristate signals handling improvements: [handling of new tristate node types in visitCaseEq](https://github.com/verilator/verilator/pull/3604), [removing assignments with strengths weaker than strongest non-tristate RHS](https://github.com/verilator/verilator/pull/3629) and [handling case in EqCase when `constp` doesn't have `user1p()`](https://github.com/verilator/verilator/pull/3551). 

### The future of open source UVM support in Verilator

The improvements and additions described in this note, combined with Antmicro’s work on [scaling Verilator even for very large designs](https://antmicro.com/blog/2022/11/scaling-verilator-for-very-large-designs/) and other efforts within CHIPS Alliance, are moving us one step closer to the next significant milestone, running the first SystemVerilog UVM testbench through Verilator. However, there are still some features that need to be added in order for some basic UVM testbenches to pass. These include the built-in process class, `srandom` class method, static local variables, recursive function/task calls, zero delays, `constraint_mode` method, more complete `randomize(...)` function support and more thorough type-parameterized classes support. You can [watch](https://www.youtube.com/watch?v=oeY-j7WrWBg) Michael Gielda’s presentation from Chips Alliance Fall Technological Update 2022 in which he provides an overview of UVM support in Verilator. With upcoming new developments within this area, we will be posting more updates in the near future.

Antmicro’s other goals for the future include work with open source projects like [Caliptra](https://chipsalliance.org/announcement/2022/12/13/chips-alliance-welcomes-the-caliptra-open-source-root-of-trust-project/), which now has a dedicated [CHIPS Alliance Workgroup](https://lists.chipsalliance.org/g/caliptra-wg), and further supporting instruction stream based verification frameworks like [RISC-V DV](https://github.com/google/riscv-dv). 

Reach out at [contact@antmicro.com](mailto:contact@antmicro.com) to learn more about Antmicro’s efforts related to open source tools for ASIC development and how they can be implemented into your workflow, whether it’s based on UVM [or not](https://antmicro.com/blog/2022/10/open-source-tl-to-ahb-bridges-with-cocotb/).
