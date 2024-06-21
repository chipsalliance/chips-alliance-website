---
date: 2024-06-21T00:00:00Z
title: Initial assertion control support in Verilator
categories:
  - Blog
author:  
images: ['news/initial-assertion-control-support-in-verilator/verilator-assertcontrol-chipsalliance-blog.png']
aliases: ['/blog/2024/06/21/initial-assertion-control-support-in-verilator']
---

Antmicro is continuously working on improving productivity of ASIC design and verification workflows using open source tools as leaders of the [CHIPS Alliance](https://www.chipsalliance.org/) Tools Workgroup, as well as for customer and R&D projects. Extending [Verilator](https://github.com/verilator) with new verification features is a prominent example of such efforts, with the latest notable improvements including [initial support for UVM testbenches](https://antmicro.com/blog/2023/10/running-simple-uvm-testbenches-in-verilator/), the [astsee tool for Verilator process and AST analysis](https://antmicro.com/blog/2024/01/analyze-verilator-processes-and-asts/) and [constrained randomization](https://antmicro.com/blog/2024/03/introducing-constrained-randomization-in-verilator/).

In this article, Antmicro introduces initial support for global assertion control ([already part of mainline Verilator](https://github.com/verilator/verilator/pull/5010)), building on existing support for assertions available in the simulator. These changes simplify verification testing by letting developers enable or disable assertions as required by particular simulation stages or testing scenarios. Antmicro delves into the benefits of this implementation, examines several use cases where assertion control can prove useful and provide considerations for the path towards full support.

## Introducing global assertion control

SystemVerilog Assertions (SVA), defined in [IEEE 1800-2023](https://standards.ieee.org/ieee/1800/7743/), Chapter 16, are chunks of verification code that check whether a design adheres to the specification, allowing you to validate the design’s behavior, provide functional coverage and flag non-conforming input. SystemVerilog defines two types of assertions:

* Immediate assertions – used in a procedural manner like any other statement, mainly alongside a simulation flow
* Concurrent assertions – executed using clock semantics; used to verify design properties with each clock cycle.

Assertions statements fall into the following directive types:

* `assert` – specifies properties as obligatory
* `assume` – specifies a property as an environment assumption. The simulator checks if a property holds and formal verification tools use it for their own validation
* `cover` – monitors coverage for a property
* `restrict` – does not fall under assertion control; only used by formal verification tools.

It is common practice to define assertions for the normal mode of operation of a device. For example, if a control register holds a specific value, then a constraint can be formulated on the logic driven from this register. However, during initialization of the device, there may be a period of time after reset when this register is not yet initialized to its proper value. An engineer would then have to create an `if` statement to make sure that the assertion is only fired when the device reaches the normal mode of operation (and not at the initialization phase). Instead of writing elaborate, non-reusable assertions in all modules of the design, a more elegant solution to this problem is to turn off assertions for this module at the time of initialization:

```
initial begin
  	$assertoff;
  	@(posedge clk)
  	@(negedge reset)
	initialize_device(); // Do not fire assertions in the “indeterminate” state
  	$asserton;
end
```

## The road from global to granular assertion control

While the addition of global assertion control to Verilator can already help developers simplify their test suites, a large part of the potential offered by this mechanism still remains on the table. In order to fully tap into this potential and enable full assertion control support, the simulator requires more granular criteria that will allow for more diverse verification use cases – which will be implemented in the future given enough customer interest.

One such mechanism is scoped assertion control. By introducing scopes, developers will be able to disable assertions only within the specified scopes without affecting the rest of the design, for instance in the case of error injection testing scenarios. By specifying a `level` parameter, control can be then even further constrained to a certain assertion control propagation depth and the test code can be simplified without rewriting assertion control statements for different hierarchy levels. With scoped control, Verilator will be able to support designs that already use it, including the community-driven open source [OpenTitan](https://opentitan.org/) Root of Trust project.

Constrained control over assertions within a specific type can also prove useful, e.g. disabling **concurrent** assertions may be desired during the design initialization, while keeping **immediate** assertions active.

Further granularity may also be beneficial in assertion control. Specifying an assertion directive type will make it possible to specify only certain types of directives affected. For instance, `assert` directives may be disabled by the `assertcontrol` task implemented in Verilator, while `cover` and `assume` directives may remain active. As the current level of support for cover and assume directives is not complete in Verilator, extending this aspect is an important prerequisite before control based on directive type is introduced.

## Develop and test hardware designs with Antmicro

Support for global assertion control in Verilator speeds up development by allowing assertion control in the test runtime instead of during compilation phase by using appropriate flags, all while simplifying the test suites themselves. This effort is another step towards enabling the full set of SystemVerilog features in open source verification using Verilator, enabling a set of new testing scenarios as well as laying the groundwork for support of the full range of assertions and assertion control over additional constraining arguments. 

If you are interested in commercial support in developing and verifying your hardware designs using Verilator, or in accelerating your ASIC development workflows with open source tools contact Antmicro at [contact@antmicro.com](mailto:contact@antmicro.com) to discuss your needs.
