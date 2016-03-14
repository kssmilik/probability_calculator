############################ Problem ############################

N = number of dices
M = sum the dropped numbers

Pn(m) - ?

Example:

P2(1) = 0
P2(2) = 1/36

############################ Solution ############################

cd to folder
irb -r './probability.rb'

```

-------------------- VIA DISTRIBUTION --------------------
       user     system      total        real
   0.000000   0.000000   0.000000 (  0.000004)
Probability get 100 with 100 dices: 1

       user     system      total        real
   0.000000   0.000000   0.000000 (  0.000003)
Probability get 600 with 100 dices: 1

       user     system      total        real
   0.000000   0.000000   0.000000 (  0.000071)
Probability get 350 with 100 dices: 0.0233563313663826

       user     system      total        real
   0.000000   0.000000   0.000000 (  0.000040)
Probability get 1000 with 300 dices: 0.0032323900011430595

-------------------- VIA COMBINATIONS --------------------
       user     system      total        real
   0.000000   0.000000   0.000000 (  0.000003)
Probability get 100 with 100 dices: 1

       user     system      total        real
   0.000000   0.000000   0.000000 (  0.000002)
Probability get 600 with 100 dices: 1

       user     system      total        real
   0.150000   0.000000   0.150000 (  0.157851)
Probability get 350 with 100 dices: 0.02332260601534536

       user     system      total        real
   1.670000   0.010000   1.680000 (  1.692843)
Probability get 1000 with 300 dices: 0.0032355163938765294

-------------------- ----------------- --------------------
```
