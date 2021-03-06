rubylife
========
![Alt text](https://cloud.githubusercontent.com/assets/5394429/5635232/4c910c9e-95b5-11e4-8e8d-0018dcc762f1.png
)


Our 2nd weekend project was a choice between creating Go Fish, or Conway's Game of Life.  I'm glad I chose the one I found more challenging.  The following is from a blog entry I made after finishing it:

I’m aware that Life is something of a classic coding exercise, but for someone who had previously struggled with the deeper mathematical side of… well, everything in high school and college, it was still pretty daunting, and I really wasn’t expecting to actually get through it in 3 days, after learning only two weeks of Ruby.

I almost immediately hit a road block. After implementing the ability to toggle individual cells, it in fact toggled an entire column of cells. I spent an hour or two poring over things, and then enlisted multiple people to look at it as well (It turned out I had been creating my array of arrays by generating one array, then assigning it to each element of the higher level array, so that when I toggled one cell, it actually referred to that cell in each subarray). After correcting that, I made a bit of progress, hit another multi-hour blocker, and then eventually that fell away too.

Eventually, I realized implementing the rules themselves was simpler than I expected, and then… Life happened! (In a good way!)

It still has an elusive bug, but I’m immensely pleased with myself. It seemed like the ratio between amount of work I was putting in and the impressiveness of the results followed an exponential curve.

