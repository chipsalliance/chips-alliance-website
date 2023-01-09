---
date: 2021-11-17T00:00:00Z
title: How Google is Applying Machine Learning to Macro Placement 
categories:
  - Blog
author: 
images: ['/images/blog-share.jpg']
---

CHIPS Alliance’s latest Deep Dive Cafe featured an outstanding talk by a Google physical design engineer, Young-Joon Lee, who has a PhD from Georgia Tech, and has been working on machine learning physical design projects for the past two years. 

The chip placement problem is a notoriously challenging design problem, and has been explored in the electronic design automation research and development community for years. For those unfamiliar with the problem, it involves finding the optimal placement of physical cells implementing the logical function on a chip image to minimize performance, power, and area of the silicon, which in the end affects the cost of the product. The effort by Google to apply machine learning to the placement problem started as part of the Google Brain effort, which in part focuses on running algorithms at scale on large amounts of data.

Deep learning itself started taking off in 2012, with computational needs rapidly increasing every three to four  months. Machine learning is particularly applicable to the placement problem as different moves that are tried for training can be fed back to the underlying network as part of reinforcement learning. Models are trained and scale on distributed systems with billions of parameters. 

In this talk, Young-Joon shared how Google devised a hybrid approach to the placement problem, first placing large macros with reinforcement learning, and then using force directed placement for standard cells. As part of this effort, Google used an open source RISC-V processor called Ariane. The presentation highlighted the quality of results achieved, challenges, and the overall designer productivity that was afforded with the development of this technique. Of note, the recently released TPU v4 was able to be placed within 24 hours by the machine learning approach compared to six to eight  weeks by a physical design engineer, achieving 3% shorter wirelengths and 23 more DRC violations. 

Finally, next steps in the project were discussed as well as how Google is exploring more machine learning techniques to use for other parts of electronic design automation. 

Watch the [presentation](https://www.youtube.com/watch?v=EKjlr2k_wBM&) below and check out the slides here: [Learning To Play the Game of Macro Placement with Deep Reinforcement Learning](https://chipsalliance.org/wp-content/uploads/sites/83/2021/11/CHIPS-Alliance-Deep-Dive-Cafe-Talks-Nov-2021-Young-Joon-Lee.pdf)

{{< youtube EKjlr2k_wBM >}}