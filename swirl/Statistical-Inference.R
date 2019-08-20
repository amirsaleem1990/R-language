# 1: Introduction
# Slides for this and other Data Science courses may be found at github https://github.com/DataScienceSpecialization/courses. If you care to use them, they must be downloaded as a zip file and viewed locally. This lesson corresponds to Statistical_Inference/Introduction
# So statistical inference involves formulating conclusions using data AND quantifying the uncertainty associated with those conclusions. The uncertainty could arise from incomplete or bad data.
# We want to emphasize a couple of important points here. First, a statistic (singular) is a number computed from a sample of data. We use statistics to infer information about a population. Second, a random variable is an outcome from an experiment. Deterministic processes, such as computing means or variances, applied to random variables, produce additional random variables which have their own distributions. It's important to keep straight which distributions you're talking about.
# Finally, there are two broad flavors of inference. The first is frequency, which uses "long run proportion of times an event occurs in independent, identically distributed repetitions." The second is Bayesian in which the probability estimate for a hypothesis is updated as additional evidence is acquired. Both flavors require an understanding of probability so that's what the next lessons will cover.


#####################################################################################
# 2: Probability1                                                                   #
#####################################################################################
# Slides for this and other Data Science courses may be found at github https://github.com/DataScienceSpecialization/courses. If you care to use them, they must be downloaded as a zip file and viewed locally. This lesson corresponds to Statistical_Inference/Probability
# If A and B are two independent events then the probability of them both occurring is the product of the probabilities. P(A&B) = P(A) * P(B)

# Q: Suppose you rolled the fair die twice. What is the probability of rolling the same number two times in a row?
# Ans: 1/6
# Since we don't care what the outcome of the first roll is, its probability is 1. The second roll of the dice has to match the outcome of the first, so that has a probability of 1/6. The probability of both events occurring is 1 * 1/6.


# Q: consider the experiment of rolling 2 dice, one red and one green. Assume the dice are fair and not loaded. How many distinct outcomes are possible?
# Ans: 36
# Each of the dice has 6 ways to land, and their outcomes are independent of each other. Each way the red die lands can be paired with each way the green die lands. For instance, a "1" on the red dice can occur independently of any of the 6 outcomes of the green dice.



# If an event E can occur in more than one way and these ways are disjoint (mutually exclusive) then P(E) is the sum of the probabilities of each of the ways in which it can occur.
# Q: Rolling these two dice, what's the probability of rolling a 10?
# 3/36
# Since the highest possible dice roll is a '6', the only combinations which give '10' are 4+6 and 5+5. The first occurs in two ways - red dice gets '4' and green gets '6' OR red gets '6' and green gets '4'.
# 3 possible pairs hen, 1-pehla 6 or dusra 4. 2-pehla 4 or dusra 6. 3- dono 5.

# Q: What sum is the most likely when rolling these two dice?
# 7

# The probability of at least one of two events, A and B, occurring is the sum of their individual probabilities minus the probability of their intersection. P(A U B) = P(A) + P(B) - P(A&B).
# It's easy to see why this is. Calculating P(A) and P(B) counts outcomes that are in both A and B twice, so they're overcounted. The probability of the intersection of the two events, denoted as A&B, must be subtracted from the sum.

# Q: Back to rolling two dice. Which expression represents the probability of rolling an even number or a number greater than 8?
# (18+10-4)/36
# even numbers k 18 pairs ban sakty hen: 1+1, 2+2, 1+3, 3+1, 1+5, 5+1, 2+4, 4+2, 3+3, 2+6, 6+2, 3+5, 5+3, 4+4, 4+6, 6+4, 5+5, 6+6.
# or grater than 8 k 10 pairs ban sakty hen: 3+6, 6+3, 5+4, 4+5, 5+5, 6+4, 4+6, 5+6, 6+5, 6+6
# ye total 28 paris ho gay, jis me 4 common hen: 5+5, 6+4, 4+6, 6+6, to hamary pas unique pairs 18+10-4=24 ho gay, or probability 24/36 ho gai.

# It follows that if A and B are disjoint or mutually exclusive, i.e. only one of them can occur, then P(A U B) = P(A)+P(B) .


# A deck of cards is a set of 52 cards, 4 suits of 13 cards each. There are two red suits, diamonds and hearts, and two black suits, spades and clubs. Each of the 13 cards in a suit has a value - an ace which is sometimes thought of as 1, a number from 2 to 10, and 3 face cards, king, queen, and jack. We've created a deck in R for you.
> deck
#        spades      hearts      diamonds      clubs     
# [1,] "A:spades"  "A:hearts"  "A:diamonds"  "A:clubs" 
# [2,] "2:spades"  "2:hearts"  "2:diamonds"  "2:clubs" 
# [3,] "3:spades"  "3:hearts"  "3:diamonds"  "3:clubs" 
# [4,] "4:spades"  "4:hearts"  "4:diamonds"  "4:clubs" 
# [5,] "5:spades"  "5:hearts"  "5:diamonds"  "5:clubs" 
# [6,] "6:spades"  "6:hearts"  "6:diamonds"  "6:clubs" 
# [7,] "7:spades"  "7:hearts"  "7:diamonds"  "7:clubs" 
# [8,] "8:spades"  "8:hearts"  "8:diamonds"  "8:clubs" 
# [9,] "9:spades"  "9:hearts"  "9:diamonds"  "9:clubs" 
# [10,] "10:spades" "10:hearts" "10:diamonds" "10:clubs"
# [11,] "J:spades"  "J:hearts"  "J:diamonds"  "J:clubs" 
# [12,] "Q:spades"  "Q:hearts"  "Q:diamonds"  "Q:clubs" 
# [13,] "K:spades"  "K:hearts"  "K:diamonds"  "K:clubs" 

# Q: What is the probability of drawing a jack?
# Ans: 4/52

# Q: If you're dealt a hand of 5 cards, what is the probability of getting all 5 of the same value?
# Ans: 0

# Q: What is the probability of drawing a face card?
# Ans: 12/52

# Q: Suppose you draw a face card and don't replace it in the deck. What is the probability that when you draw a second card it also will be a face card?
# Ans: 11/51

# Q: Suppose you draw a face card and don't replace it in the deck. What is the probability that when you draw a second card it also will be a face card of the same suit?
# Ans: 2/51


##########################################################################################################################################
# 3: Probability2                                                                                                                        #
##########################################################################################################################################
# Slides for this and other Data Science courses may be found at github https://github.com/DataScienceSpecialization/courses. If you care to use them, they must be downloaded as a zip file and viewed locally. This lesson corresponds to Statistical_Inference/Probability.
# Recall that a random variable is a numerical outcome of an experiment. It can be discrete (take on only a countable number of possibilities), or continuous (take on any value on the real line or subset of it).
# Continuous random variables are usually associated with measurements of time, distance, or some biological process since they can take on any value, often within some specified range. Limitations of precision in taking the measurements may imply that the values are discrete; we in fact consider them continuous.
#  A probability mass function (PMF) gives the probability that a discrete random variable is exactly equal to some value.

# Q: For instance, suppose we have a coin which may or may not be fair. Let x=0 represent a 'heads' outcome and x=1 represent a 'tails' outcome of a coin toss. If p is the probability of 'heads' which of the following represents the PMF of the coin toss?  The variable x is either 0 (heads) or 1 (tails).
1: (p^(1-x))*(1-p)^x  # <====== OK
2: (p^x)*(1-p)^(1-x)

# A probability density function is associated with a continuous random variable. To quote from Wikipedia, it "is a function that describes the relative likelihood for this random variable to take on a given value. The probability of the random variable falling within a particular range of values is given by ... the area under the density function but above the horizontal axis and between the lowest and greatest values of the range."
# We'll repeat two requirements of a probability density function. It must be nonnegative everywhere, and the area under it must equal one."

# Consider this figure(screenshot/Statical-Inference/image-1.png) - a rectangle with height 1 and width 2 with a diagonal line drawn from the lower left corner (0,0) to the upper right (2,1). The area of the entire rectangle is 2 and elementary geometry tells us that the diagonal divides the rectangle into 2 equal areas.

# Q: Could the diagonal line represent a probability density function for a random variable with a range of values between 0 and 2? Assume the lower side of the rectangle is the x axis.
# Ans: Yes

# Now consider the shaded portion of the triangle(screenshot/Statical-Inference/image-2.png) - a smaller triangle with a base of length 1.6 and height determined by the diagonal. We'll answer the question, "What proportion of the big triangle is shaded?"
# This proportion represents the probability that throwing a piece of cat kibble at the bigger triangle (below the diagonal) hits the blue portion.

# Q: We have to compute the area of the blue triangle. (Since the area of the big triangle is 1, the area of the blue triangle is the proportion of the big triangle that is shaded.) We know the base, but what is its height?
# Ans: 0.8

# Q: What is the area of the blue triangle?
# Ans: (1.6*.8)/2

# Q: So, what is the probability that the kibble we throw at the bigger triangle will hit the blue portion?
# Ans: (1.6*.8)/2

# This artificial example was meant to illustrate a simple probability density function (PDF). Most PDFs have underlying formulae more complicated than lines.

# The cumulative distribution function (CDF) of a random variable X, either discrete or continuous, is the function F(x) equal to the probability that X is less than or equal to x. In the example above, the area of the blue triangle represents the probability that the random variable was less than or equal to the value 1.6.

# Q: In the triangle example from above, which of the following expressions represents F(x), the CDF? (The term 'x' is the base, x/2 is the height.)
# Ans: x*x/4

# If you're familiar with calculus you might recognize that when you're computing areas under curves you're actually integrating functions.
# When the random variable is continuous, as in the example, the PDF is the derivative of the CDF. So integrating the PDF (the line represented by the diagonal) yields the CDF. When you evaluate the CDF at the limits of integration the result is an area.

# To see this in the example, we've defined the function mypdf for you. This is the equation of the line represented by the diagonal of the rectangle. As the PDF, it is the derivative of F(x), the CDF. Look at mypdf now.
> mypdf
# function(x){x/2}

# Now use the R function integrate to integrate mypdf with the parameters lower equal to 0 and upper equal to 1.6. See if you get the same area (probability) you got before.
> integrate(mypdf, lower = 0, upper = 1.6)
# 0.64 with absolute error < 7.1e-15

# The survivor function S(x) of a random variable X is defined as the function of x equal to the probability that the random variable X is greater than the value x. This is the complement of the CDF F(x), in our example, the portion of the lower triangle that is not shaded.

# Q: In our example, which of the following expressions represents the survival function?
# 1-x*x/4

# The quantile v of a CDF is the point x_v at which the CDF has the value v. More precisely, F(x_v)=v. A percentile is a quantile in which v is expressed as a percentage.
> sqrt(2)
# [1] 1.414214


# A probability model connects data to a population using assumptions.



###################################################################
# 4: ConditionalProbability                                       #
###################################################################

# Slides for this and other Data Science courses may be found at github https://github.com/DataScienceSpecialization/courses/. If you care to use them, they must be downloaded as a zip file and viewed locally. This lesson corresponds to 06_Statistical_Inference/03_Conditional_Probability
# We represent the conditional probability of an event A given that B has occurred with the notation P(AB). More specifically, we define the conditional probability of event A, given that B has occurred with the following.
# P(A|B) = P(A & B)/ P(B) . P(A|B) is the probability that BOTH A and B occur divided by the probability that B occurs.

# Q: Which of the following expressions represents P(A&B), where A is the event of rolling a 3 and B is the event of the roll being odd?
# Here A is a subset of B so the probability of both A AND B happening is the probability of A happening.
# Ans: 1/6

# Q: Continuing with the same dice example. Which of the following expressions represents P(A&B)/P(B), where A is the event of rolling a 3 and B is the event of the roll being odd?
# Ans: (1/6)/(1/2)

# From the definition of P(A|B), we can write P(A&B) = P(A|B) * P(B)
# P(B|A) = P(B&A)/P(A) = P(A|B) * P(B)/P(A). This is a simple form of Bayes' Rule which relates the two conditional probabilities.

# Suppose we don't know P(A) itself, but only know its conditional probabilities, that is, the probability that it occurs if B occurs and the probability that it occurs if B doesn't occur. These are P(A|B) and P(A|~B), respectively. We use ~B to represent 'not B' or 'B complement'.
# We can then express P(A) = P(A|B) * P(B) + P(A|~B) * P(~B) and substitute this is into the denominator of Bayes' Formula.
# P(B|A) = P(A|B) * P(B) / ( P(A|B) * P(B) + P(A|~B) * P(~B) )

# Bayes' Rule has applicability to medical diagnostic tests. We'll now discuss the example of the HIV test from the slides.
# Q: Suppose we know the accuracy rates of the test for both the positive case (positive result when the patient has HIV) and negative (negative test result when the patient doesn't have HIV). These are referred to as test sensitivity and specificity, respectively.
# Ans: P(+|D) and P(-|~D)

# Q: Suppose a person gets a positive test result and comes from a population with a HIV prevalence rate of .001. We'd like to know the probability that he really has HIV. Which of the following represents this?
# Ans: P(D|+)

# By Bayes' Formula, P(D+) = P(+D) * P(D) / ( P(+D) * P(D) + P(+~D) * P(~D) )
# We can use the prevalence of HIV in the patient's population as the value for P(D). Note that since P(~D)=1-P(D) and P(+|~D) = 1-P(-|~D) we can calculate P(D|+). In other words, we know values for all the terms on the right side of the equation. Let's do it!

# Q: Disease prevalence is .001. Test sensitivity (+ result with disease) is 99.7% and specificity (- result without disease) is 98.5%. First compute the numerator, P(+|D)*P(D). (This is also part of the denominator.)
# Ans: 0.997*0.001 #(sensitivity * HIV prevalence rate)

# Q: Now put the pieces together to compute the probability that the patient has the disease given his positive test result, P(D+). Plug your last two answers into the formula P(+D) * P(D) / ( P(+D) * P(D) + P(+~D) * P(~D) ) to compute P(D+).
# Ans: .015*.999 # (1-specificity)*(1-HIV prevalence rate)

# Q: Now put the pieces together to compute the probability that the patient has the disease given his positive test result, P(D|+). Plug your last two answers into the formula P(+|D) * P(D) / ( P(+|D) * P(D) + P(+|~D) * P(~D) ) to compute P(D|+).
# Ans: 0.997 * 0.001 / (0.997 * 0.001 + 0.015 * 0.999)
# So the patient has a 6% chance of having HIV given this positive test result. The expression P(D|+) is called the positive predictive value. Similarly, P(~D|-), is called the negative predictive value, the probability that a patient does not have the disease given a negative test result.

# Q: The diagnostic likelihood ratio of a positive test, DLR_+, is the ratio of the two + conditional probabilities, one given the presence of disease and the other given the absence. Specifically, DLR_+ = P(+|D) / P(+|~D). Similarly, the DLR_- is defined as a ratio. Which of the following do you think represents the DLR_-?
# Ans: P(-|D) / P(-|~D)


# Recall that P(+|D) and P(-|~D), (test sensitivity and specificity respectively) are accuracy rates of a diagnostic test for the two possible results. They should be close to 1 because no one would take an inaccurate test, right? Since DLR_+ = P(+|D) / P(+|~D) we recognize the numerator as test sensitivity and the denominator as the complement of test specificity.

# Q: Since the numerator is close to 1 and the denominator is close to 0 do you expect DLR_+ to be large or small?
# Ans: Large

# Q: Now recall that DLR_- = P(-D) / P(-~D). Here the numerator is the complement of sensitivity and the denominator is specificity. From the arithmetic and what you know about accuracy tests, do you expect DLR_- to be large or small?
# Ans: Small

# Now a little more about likelihood ratios. Recall Bayes Formula. P(D|+) = P(+|D) * P(D) / ( P(+|D) * P(D) + P(+|~D) * P(~D) ) and notice that if we replace all occurrences of 'D' with '~D', the denominator doesn't change. This means that if we formed a ratio of P(D+) to P(~D+) we'd get a much simpler expression (since the complicated denominators would cancel each other out). Like this: P(D|+) / P(~D|+) = P(+|D) * P(D) / (P(+|~D) * P(~D)) = P(+|D)/P(+|~D) * P(D)/P(~D).

# Q: The left side of the equation represents the post-test odds of disease given a positive test result. The equation says that the post-test odds of disease equals the pre-test odds of disease (that is, P(D)/P(~D) ) times
# Ans: the DLR_+
# In other words, a DLR_+ value equal to N indicates that the hypothesis of disease is N times more supported by the data than the hypothesis of no disease.

# Taking the formula above and replacing the '+' signs with '-' yields a formula with the DLR_-. Specifically, P(D|-) / P(~D|-) = P(-|D) / P(-|~D) * P(D)/P(~D). As with the positive case, this relates the odds of disease post-test, P(D-) / P(~D-), to those of disease pre-test, P(D)/P(~D).

# Q: The equation P(D-) / P(~D|-) = P(-|D) / P(-|~D) * P(D)/P(~D) says what about the post-test odds of disease relative to the pre-test odds of disease given negative test results?
# Ans: post-test odds are less than pre-test odds

# Two events, A and B, are independent if they have no effect on each other. Formally, P(A&B) = P(A)*P(B). It's easy to see that if A and B are independent, then P(A|B)=P(A). The definition is similar for random variables X and Y.

# Q: We've seen examples of independence in our previous probability lessons. Let's review a little. What's the probability of rolling a '6' twice in a row using a fair die?
# Ans: 1/36

# Q: You're given a fair die and asked to roll it twice. What's the probability that the second roll of the die matches the first?
# Ans: 1/6

# Q: If the chance of developing a disease with a genetic or environmental component is p, is the chance of both you and your sibling developing that disease p*p?
# No. since the events aren't independent since genetic or environmental factors likely will affect the outcome.

# We'll conclude with iid. Random variables are said to be iid if they are independent and identically distributed. By independent we mean "statistically unrelated from one another". Identically distributed means that "all have been drawn from the same population distribution".
# Random variables which are iid are the default model for random samples and many of the important theories of statistics assume that variables are iid. We'll usually assume our samples are random and variables are iid.


######################################################################################################
# 5: Expectations                                                                                    #
######################################################################################################

# Slides for this and other Data Science courses may be found at github https://github.com/DataScienceSpecialization/courses/. If you care to use them, they must be downloaded as a zip file and viewed locally. This lesson corresponds to 06_Statistical_Inference/04_Expectations.
# In this lesson, as you might expect, we'll discuss expected values.
# Another term for expected value is mean. Recall your high school definition of arithmetic mean (or average) as the sum of a bunch of numbers divided by the number of numbers you added together. This is consistent with the formal definition of E(X) if all the numbers are equally weighted.

# Q: Consider the random variable X representing a roll of a fair dice. By 'fair' we mean all the sides are equally likely to appear. What is the expected value of X?
# Ans: sum(1:6) / 6

# We've defined a function for you, expect_dice, which takes a PMF as an input. For our purposes, the PMF is a 6-long array of fractions. The i-th entry in the array represents the probability of i being the outcome of a dice roll.
> expect_dice
# function(pmf){ mu <- 0; for (i in 1:6) mu <- mu + i*pmf[i]; mu}

> dice_high
# [1] 0.04761905 0.09523810 0.14285714 0.19047619 0.23809524 0.28571429

> expect_dice(dice_high)
# [1] 4.333333
# See how the expected value of dice_high is higher than that of the fair dice.

> expect_dice(dice_low)
# [1] 2.666667

# You can see the effect of loading the dice on the expectations of the rolls. For high-loaded dice the expected value of a roll (on average) is 4.33 and for low-loaded dice 2.67. We've stored these off for you in two variables, edh and edl.
# One of the nice properties of the expected value operation is that it's linear. This means that, if c is a constant, then E(cX) = c*E(X). Also, if X and Y are two random variables then E(X+Y)=E(X)+E(Y). It follows that E(aX+bY)=aE(X)+bE(Y).

# Q: Suppose you were rolling our two loaded dice, dice_high and dice_low. You can use this linearity property of expectation to compute the expected value of their average. Let X_hi and X_lo represent the respective outcomes of the dice roll. The expected value of the average is E((X_hi + X_lo)/2) or .5 *( E(X_hi)+E(X_lo) ). Compute this now. Remember we stored the expected values in edh and edl.
# Ans: 0.5 * (edh + edl)

# For a continuous random variable X, the expected value is defined analogously as it was for the discrete case. Instead of summing over discrete values, however, the expectation integrates over a continuous function.
# It follows that for continuous random variables, E(X) is the area under the function t*f(t), where f(t) is the PDF (probability density function) of X. This definition borrows from the definition of center of mass of a continuous body.

# Here's(image-3.png) a figure from the slides. It shows the constant (1) PDF on the left and the graph of t*f(t) on the right.
# Q: Knowing that the expected value is the area under the triangle, t*f(t), what is the expected value of the random variable with this PDF?
# Ans: 0.5

# For the purposes of illustration, here's(image-4.png) another figure using a PDF from our previous probability lesson. It shows the triangular PDF f(t) on the left and the parabolic t*f(t) on the right. The area under the parabola between 0 and 2 represents the expected value of the random variable with this PDF.
# To find the expected value of this random variable you need to integrate the function t*f(t). Here f(t)=t/2, the diagonal line. (You might recall this from the last probability lesson.) The function you're integrating over is therefore t^2/2. We've defined a function myfunc for you representing this. You can use the R function 'integrate' with parameters myfunc, 0 (the lower bound), and 2 (the upper bound) to find the expected value. Do this now.
> myfunc
# function(x){x^2/2}

> integrate(myfunc, lower = 0, upper = 2)
# 1.333333 with absolute error < 1.5e-14

# As all the examples have shown, expected values of distributions are useful in characterizing them. The mean characterizes the central tendency of the distribution. However, often populations are too big to measure, so we have to sample them and then we have to use sample means. That's okay because sample expected values estimate the population versions. We'll show this first with a very simple toy and then with some simple equations.
> spop
# [1]  1  4  7 10 13

> mean(spop)
# [1] 7

# Suppose spop were much bigger and we couldn't measure its mean directly and instead had to sample it with samples of size 2. There are 10 such samples, right? We've stored this for you in a 10 x 2 matrix, allsam.
> allsam
#       [,1] [,2]
# [1,]    1    4
# [2,]    1    7
# [3,]    1   10
# [4,]    1   13
# [5,]    4    7
# [6,]    4   10
# [7,]    4   13
# [8,]    7   10
# [9,]    7   13
# [10,]   10   13

# Each of these 10 samples will have a mean, right? We can use the R function apply to calculate the mean of each row of the matrix allsam. We simply call apply with the arguments allsam, 1, and mean. The second argument, 1, tells 'apply' to apply the third argument 'mean' to the rows of the matrix.
> apply(allsam, 1, mean)
# [1]  2.5  4.0  5.5  7.0  5.5  7.0  8.5  8.5 10.0 11.5

# You can see from the resulting vector that the sample means vary a lot, from 2.5 to 11.5, right? Not unexpectedly, the sample mean depends on the sample. However if we take the expected value of these sample means we'll see something amazing. We've stored the sample means in the array smeans for you. Use the R function mean on the array smeans now.
> mean(smeans)
# [1] 7

# Look familiar? The result is the same as the mean of the original population spop. This is not because the example was specially cooked. It would work on any population. The expected value or mean of the sample mean is the population mean. What this means is that the sample mean is an unbiased estimator of the population mean.
# Formally, an estimator e of some parameter v is unbiased if its expected value equals v, i.e., E(e)=v. We can show that the expected value of a sample mean equals the population mean with some simple algebra.
# Let X_1, X_2, ... X_n be a collection of n samples from a population with mean mu. The mean of these is (X_1 + X_2 + ... + X_n)/n.
# What's the expected value of the mean? Recall that E(aX)=aE(X), so E( (X_1+..+X_n)/n ) = 1/n * (E(X_1) + E(X_2) + ... + E(X_n)) = (1/n)*n*mu = mu. Each E(X_i) equals mu since X_i is drawn from the population with mean mu. We expect, on average, a random X_i will equal mu.

# Now that was theory.  We can also show this empirically with more simulations.
# Here's(image-5.png) another figure from the slides. It shows how a sample mean and the mean of averages spike together. The two shaded distributions come from the same data. The blue portion represents the density function of randomly generated standard normal data, 100000 samples. The pink portion represents the density function of 10000 averages, each of 10 random normals. (The original data was stored in a 10000 x 10 array and the average of each row was taken to generate the pink data.)

# Here's(image-6.png) another figure from the slides. Rolling a single die 10000 times yields the first figure. Each of the 6 possible outcomes appears with about the same frequency. The second figure is the histogram of outcomes of the average of rolling two dice. Similarly, the third figure is the histogram of averages of rolling three dice, and the fourth four dice. As we showed previously, the center or mean of the original distribution is 3.5 and that's exactly where all the panels are centered.


# Let's recap. Expected values are properties of distributions. The average, or mean, of random variables is itself a random variable and its associated distribution itself has an expected value. The center of this distribution is the same as that of the original distribution.

# Q: Expected values are properties of what?
# Ans: distributions

# Q: A population mean is a center of mass of what?
# Ans: a population

# Q: A sample mean is a center of mass of what?
# Ans: observed data

# Q: True or False? A population mean estimates a sample mean.
# Ans: False

# Q: True or False? A sample mean is unbiased.
# Ans: True

# Q: True or False? The more data that goes into the sample mean, the more concentrated its density / mass function is around the population mean.
# Ans: True


#########################################################################
# 6: Variance                                                           #
#########################################################################
# Slides for this and other Data Science courses may be found at github https://github.com/DataScienceSpecialization/courses/. If you care to use them, they must be downloaded as a zip file and viewed locally. This lesson corresponds to 06_Statistical_Inference/05_Variance.
# In this lesson, we'll discuss variances of distributions which, like means, are useful in characterizing them. While the mean characterizes the center of a distribution, the variance and its square root, the standard deviation, characterize the distribution's spread around the mean. As the sample mean estimates the population mean, so the sample variance estimates the population variance.
# The variance of a random variable, as a measure of spread or dispersion, is, like a mean, defined as an expected value. It is the expected squared distance of the variable from its mean. Squaring the distance makes it positive so values less than and greater than the mean are treated the same. In mathematical terms, if X comes from a population with mean mu, then Var(X) = E( (X-mu)^2 ) = E( (X-E(X))^2 ) = E(X^2)-E(X)^2
# So variance is the difference between two expected values. Recall that E(X), the expected value of a random variable from the population, is mu, the mean of that population.
# Higher variance implies more spread around a mean than lower variance.
# inally, it's easy to show from the definition and the linearity of expectations that, if a is a constant, then Var(aX)=a^2*Var(X). This will come in handy later.
# Let's practice computing the variance of a dice roll now. First we need to compute E(X^2). From the definition of expected values, this means we'll take a weighted sum over all possible values of X^2. The weight is the probability of X occurring.
# For convenience, we've defined a 6-long vector for you, dice_sqr, which holds the squares of the integers 1 through 6. This will give us the X^2 values. Look at it now.
> dice_sqr
# [1]  1  4  9 16 25 36

# Now we need weights. For these we can use any of the three PDF's, (dice_fair, dice_high, and dice_low) we defined in the previous lesson. Using R's ability to multiply vectors componentwise and its function 'sum' we can easily compute E(X^2) for any of these dice. Simply sum the product dice_sqr * PDF.  Try this now with dice_fair and put the result in a variable ex2_fair.
ex2_fair <- sum(dice_sqr * dice_fair)

# Recall that the expected value of a fair dice roll is 3.5. Subtract the square of that from ex2_fair to compute the sample variance.
ex2_fair - 3.5^2
# [1] 2.916667

sum(dice_high * dice_sqr)-edh^2
# [1] 2.222222

# Here's(image-7.png) a figure from the slides. It shows several normal distributions all centered around a common mean 0, but with different standard deviations. As you can see from the color key on the right, the thinner the bell the smaller the standard deviation and the bigger the standard deviation the fatter the bell.
# Just as we distinguished between a population mean and a sample mean we have to distinguish between a population variance sigma^2 and a sample variance s^2. They are defined similarly but with a slight difference. The sample variance is defined as the sum of n squared distances from the sample mean divided by (n-1), where n is the number of samples or observations. We divide by n-1 because this is the number of degrees of freedom in the system. The first n-1 samples or observations are independent given the mean. The last one isn't independent since it can be calculated from the sample mean used in the formula.
# In other words, the sample variance is ALMOST the average squared deviation from the sample mean.
# As with the sample mean, the sample variance is also a random variable with an associated population distribution. Its expected value or mean is the population variance and its distribution gets more concentrated around the population variance with more data. The sample standard deviation is the square root of the sample variance.
# To illustrate this point, consider this figure(image-8.png) which plots the distribution of 10000 variances, Each variance was computed on a sample of standard normals of size 10. The vertical line indicates the standard deviation 1.
# Here(image-9.png) we do the same experiment but this time (the taller lump) each of the 10000 variances is over 20 standard normal samples. We've plotted over the first plot (the shorter lump) and you can see that the distribution of the variances is getting tighter and shifting closer to the vertical line.
# Finally(image-10.png), we repeat the experiment using 30 samples for each of the 10000 variances. You can see that with more data, the distribution gets more concentrated around the population variance it is trying to estimate.
# Now recall that the means of unbiased estimators equal the values they're trying to estimate. We can infer from the above that the sample variance is an unbiased estimator of population variance.
# Recall that the average of random samples from a population is itself a random variable with a distribution centered around the population mean. Specifically, E(X') = mu, where X' represents a sample mean and mu is the population mean.
# We can show that, if the population is infinite, the variance of the sample mean is the population variance divided by the sample size. Specifically, Var(X') = sigma^2 / n. Let's work through this in four short steps.

# Q: Which of the following does Var(X') equal? Here X' represents the sample mean and 'Sum(X_i)' represents the sum of the n samples X_1,...X_n. Assume these samples are independent.
# Ans: Var(1/n * Sum(X_i))

# Q: Which of the following does Var(1/n * Sum(X_i)) equal?
# Ans: 1/n^2*Var(Sum(X_i))

# Q: Recall that Var is an expected value and expected values are linear. Also recall that our samples X_1, X_2,...,X_n are independent. What does Var(Sum(X_i)) equal?
# Ans: Sum(Var(X_i))

# Q: Finally, each X_i comes from a population with variance sigma^2. What does Sum(Var(X_i)) equal? As before, Sum is taken over n values.
# Ans: n*(sigma)^2

# So we've shown that Var(X')=Var(1/n*Sum(X_i))=(1/n^2)*Var(Sum(X_i))=(1/n^2)*Sum(sigma^2)=sigma^2/n for infinite populations when our samples are independent.

# The standard deviation of a statistic is called its standard error, so the standard error of the sample mean is the square root of its variance.
# We just showed that the variance of a sample mean is sigma^2 / n and we estimate it with s^2 / n. It follows that its square root, s / sqrt(n), is the standard error of the sample mean.
# The sample standard deviation, s, tells us how variable the population is, and s/sqrt(n), the standard error, tells us how much averages of random samples of size n from the population vary. Let's see this with some simulations.
sd(apply(matrix(rnorm(10000), 1000), 1, mean))
# [1] 0.3053074

# This returns the standard deviation of 1000 averages, each of a sample of 10 random normal numbers with mean 0 and standard deviation 1. The theory tells us that the standard error, s/sqrt(n), of the sample means indicates how much averages of random samples of size n (in this case 10) vary. Now compute 1/sqrt(10) to see if it matches the standard deviation we just computed with our simulation.
1/sqrt(10)
# [1] 0.3162278

# Q: Pretty close, right? Let's try a few more. Standard uniform distributions have variance 1/12. The theory tells us the standard error of means of independent samples of size n would have which standard error?
# Ans: 1/sqrt(12*n)

# Compute 1/sqrt(120). This would be the standard error of the means of uniform samples of size 10.
1/sqrt(120)
# [1] 0.09128709

> sd(apply(matrix(runif(10000),1000),1,mean))
# [1] 0.09131008

# Q: Pretty close again, right? Poisson(4) are distributions with variance 4; what standard error would means of random samples of n Poisson(4) have?
# Ans: 2/sqrt(n)

# We'll do another simulation to test the theory. First, assume you're taking averages of 10 Poisson(4) samples and compute the standard error of these means. Use the formula you just chose.
> 2/sqrt(10)
# [1] 0.6324555

# Now check it as we did before.
> sd(apply(matrix(rpois(10000,4),1000),1,mean))
# [1] 0.6193233

# Q: Like magic, right? One final test. Fair coin flips have variance 0.25; means of random samples of n coin flips have what standard error?
# Ans: 2/sqrt(n)

# Q: You know the drill. Assume you're taking averages of 10 coin flips and compute the standard error of these means with the theoretical formula you just picked.
# Ans: 1/(2 * sqrt(10))

# Now check it as we did before.
> sd(apply(matrix(sample(0:1,10000,TRUE),1000),1,mean))
# [1] 0.1558295

# Finally, here's something interesting. Chebyshev's inequality helps interpret variances. It states that the probability that a random variable X is at least k standard deviations from its mean is less than 1/(k^2). In other words, the probability that X is at least 2 standard deviations from the mean is less than 1/4, 3 standard deviations 1/9, 4 standard deviations 1/16, etc.
# However this estimate is quite conservative for random variables that are normally distributed, that is, with bell-curve distributions. In these cases, the probability of being at least 2 standard deviations from the mean is about 5% (as compared to Chebyshev's upper bound of 25%) and the probability of being at least 3 standard deviations from the mean is roughly .2%.

# Q: Suppose you had a measurement that was 4 standard deviations from the distribution's mean. What would be the upper bound of the probability of this happening using Chebyshev's inequality?
# Ans: 6%. Chebyshev's inequality estimates that probability as 1/16.

# Q: Now to review. The sample variance estimates what?
# Ans: population variance

# Q: The distribution of the sample variance is centered at what?
# Ans: population variance

# Q: True or False - The sample variance gets more concentrated around the population variance with larger sample sizes
# Ans: TRUE

# Q: The variance of the sample mean is the population variance divided by ?
# Ans: n

# Q: The standard error of the sample mean is the sample standard deviation s divided by ?
# Ans: sqrt(n)



##########################################################################
# 7: CommonDistros                                                       #
##########################################################################
# Slides for this and other Data Science courses may be found at github https://github.com/DataScienceSpecialization/courses/. If you care to use them, they must be downloaded as a zip file and viewed locally. This lesson corresponds to 06_Statistical_Inference/06_CommonDistros
# The first distribution we'll examine is the Bernoulli which is associated with experiments which have only 2 possible outcomes. These are also called (by people in the know) binary trials.
# For simplicity, we usually say that Bernoulli random variables take only the values 1 and 0.

# Q: If the probability of a 1 is p and the probability of a 0 is 1-p which of the following represents the PMF of a Bernoulli distribution? Recall that the PMF is the function representing the probability that X=x.
# Ans: p^x * (1-p)^(1-x)

# Recall the definition of the expectation of a random variable. Suppose we have a Bernoulli random variable and, as before, the probability it equals 1 (a success) is p and probability it equals 0 (a failure) is 1-p. What is its mean?
# Ans: p

# Q: Given the same Bernoulli random variable above, which of the following represents E(X^2)
# Ans: p

# Q: Use the answers of the last two questions to find the variance of the Bernoulli random variable. Recall Var = E(X^2)-(E(X))^2
# Ans: p(1-p)

# Binomial random variables are obtained as the sum of iid Bernoulli trials.  Specifically, let X_1, ..., X_n be iid Bernoulli(p) random variables; then X = X_1 + X_2 + ... X_n is a binomial random variable. Binomial random variables represent the number of successes, k, out of n independent Bernoulli trials. Each of the trials has probability p.

# The PMF of a binomial random variable X is the function representing the probability that X=x. In other words, that there are x successes out of n independent trials. Which of the following represents the PMF of a binomial distribution? Here x, the number of successes, goes from 0 to n, the number of trials, and choose(n,x) represents the binomial coefficient 'n choose x'

# Q: which is the number of ways x successes out of n trials can occur regardless of order.
# Ans: choose(n,x) * p^x * (1-p)^(n-x)

# Suppose we were going to flip a biased coin 5 times. The probability of tossing a head is .8 and a tail .2. What is the probability that you'll toss at least 3 heads.
> choose(5,3)*(.8)^3*(.2)^(5-3) + choose(5,4)*(.8)^4*(.2)^(5-4) + choose(5,5)*(.8)^5*(.2)^(5-5)
# [1] 0.94208

# Now you can verify your answer with the R function pbinom. The quantile is 2, the size is 5, the prob is .8 and the lower.tail is FALSE. Try it now.
pbinom(2, size = 5, prob = 0.8, lower.tail = FALSE)
# [1] 0.94208

# Another very common distribution is the normal or Gaussian. It has a complicated density function involving its mean mu and variance sigma^2. The key fact of the density formula is that when plotted, it forms a bell shaped curve, symmetric about its mean mu. The variance sigma^2 corresponds to the width of the bell, the higher the variance, the fatter the bell. We denote a normally distributed random variable X as X ~ N(mu, sigma^2).
# When mu = 0 and sigma = 1 the resulting distribution is called the standard normal distribution and it is often labeled Z.

# The R function qnorm(prob) returns the value of x (quantile) for which the area under the standard normal distribution to the left of x equals the parameter prob. (Recall that the entire area under the curve is 1.) Use qnorm now to find the 10th percentile of the standard normal. Remember the argument prob must be between 0 and 1. You don't have to specify any of the other parameters since the default is the standard normal.
> qnorm(0.1)
# [1] -1.281552

# Q: Which of the following would you expect to be the 1st percentile?
# Ans: -2.33

# Q: can you say what the 50th percentile is?
# Ans: 0

# Q: We can use the symmetry of the bell curve to determine other quantiles. Given that 2.5% of the area under the curve falls to the left of x=-1.96, what is the 97.5 percentile for the standard normal?
# Ans: 1.96

# Here are two useful facts concerning normal distributions. If X is a normal random variable with mean mu and variance sigma^2, i.e., X ~ N(mu,sigma^2) then the random variable Z defined as Z = (X -mu)/sigma is normally distributed with mean 0 and variance 1, i.e., Z ~ N(0, 1). (Z is standard normal.)
# The converse is also true. If Z is standard normal, i.e., Z ~ N(0,1), then the random variable X defined as X = mu + sigma*Z is normally distributed with mean mu and variance sigma^2, i.e., X ~ N(mu, sigma^2)
# These formulae allow you to easily compute quantiles (and thus percentiles) for ANY normally distributed variable if you know its mean and variance. We'll show how to find the 97.5th percentile of a normal distribution with mean 3 and variance 4.
> qnorm(mean = 3, sd = 2, p = 0.975)
# [1] 6.919928

# Let's check it using the formula above, X = mu + sigma*Z. Here we'll use the 97.5th percentile for the standard normal as the value Z in the formula. Recall that we previously calculated this to be 1.96. Let's multiply this by the standard deviation of the given normal distribution (2) and add in its mean (3) to see if we get a result close to the one qnorm gave us.
> 1.96*2+3
# [1] 6.92

# Suppose you have a normal distribution with mean 1020 and standard deviation of 50 and you want to compute the probability that the associated random variable X > 1200. The easiest way to do this is to use R's pnorm function in which you specify the quantile (1200), the mean (1020) and standard deviation (50). You also must specify that the lower.tail is FALSE since we're asking for a probability that the random variable is greater than our quantile. Do this now.
> pnorm(q = 1200, mean = 1020, sd = 50, lower.tail = FALSE)
# [1] 0.0001591086

# Alternatively, we could use the formula above to transform the given distribution to a standard normal. We compute the number of standard deviations the specified number (1200) is from the mean with Z = (X -mu)/sigma. This is our new quantile. We can then use the standard normal distribution and the default values of pnorm. Remember to specify that lower.tail is FALSE.  Do this now.
> pnorm((1200 - 1020) / 50, lower.tail = FALSE)
# [1] 0.0001591086

# For practice, using the same distribution, find the 75% percentile. Use qnorm and specify the probability (.75), the mean (1020) and standard deviation (50). Since we want to include the left part of the curve we can use the default lower.tail=TRUE.
> qnorm(p = 0.75, mean = 1020, sd = 50)
# [1] 1053.724

# Note that R functions pnorm and qnorm are inverses. 
# Q: What would you expect pnorm(qnorm(.53)) to return?
# Ans: 0.53

# Q:  How about qnorm(pnorm(.53))?
# Ans: 0.53

# Now let's talk about our last common distribution, the Poisson. This is, as Wikipedia tells us, "a discrete probability distribution that expresses the probability of a given number of events occurring in a fixed interval of time and/or space if these events occur with a known average rate and independently of the time since the last event."
# In other words, the Poisson distribution models counts or number of event in some interval of time. From Wikipedia, "Any variable that is Poisson distributed only takes on integer values."
# The PMF of the Poisson distribution has one parameter, lambda. As with the other distributions the PMF calculates the probability that the Poisson distributed random variable X takes the value x. Specifically, P(X=x)=(lambda^x)e^(-lambda)/x!. Here x ranges from 0 to infinity.
# The mean and variance of the Poisson distribution are both lambda.
# Poisson random variables are used to model rates such as the rate of hard drive failures. We write X~Poisson(lambda*t) where lambda is the expected count per unit of time and t is the total monitoring time.
# For example, suppose the number of people that show up at a bus stop is Poisson with a mean of 2.5 per hour, and we want to know the probability that at most 3 people show up in a 4 hour period. We use the R function ppois which returns a probability that the random variable is less than or equal to 3. We only need to specify the quantile (3) and the mean (2.5 * 4). We can use the default parameters, lower.tail=TRUE and log.p=FALSE.
> ppois(q = 3, lambda = 2.5 * 4)
# [1] 0.01033605

# Finally, the Poisson distribution approximates the binomial distribution in certain cases. Recall that the binomial distribution is the discrete distribution of the number of successes, k, out of n independent binary trials, each with probability p. If n is large and p is small then the Poisson distribution with lambda equal to n*p is a good approximation to the binomial distribution.
# To see this, use the R function pbinom to estimate the probability that you'll see at most 5 successes out of 1000 trials each of which has probability .01. As before, you can use the default parameter values (lower.tail=TRUE and log.p=FALSE) and just specify the quantile, size, and probability.
> pbinom(q = 5, size = 1000, prob = 0.01)
# [1] 0.06613951

# Now use the function ppois with quantile equal to 5 and lambda equal to n*p to see if you get a similar result.
> ppois(q = 5, lambda = 1000*0.01)
# [1] 0.06708596
# See how they're close? Pretty cool, right? This worked because n was large (1000) and p was small (.01).


###########################################################################
# 8: Asymptotics                                                          #
###########################################################################
# Slides for this and other Data Science courses may be found at github https://github.com/DataScienceSpecialization/courses/. If you care to use them, they must be downloaded as a zip file and viewed locally. This lesson corresponds to 07_Statistical_Inference/07_Asymptopia
# In this lesson, we'll discuss asymptotics, a topic which describes how statistics behave as sample sizes get very large and approach infinity. Pretending sample sizes and populations are infinite is useful for making statistical inferences and approximations since it often leads to a nice understanding of procedures.
# Asymptotics generally give no assurances about finite sample performance, but they form the basis for frequency interpretation of probabilities (the long run proportion of times an event occurs).

# Recall our simulations and discussions of sample means in previous lessons. We can now talk about the distribution of sample means of a collection of iid observations.
# Q: The mean of the sample mean estimates what?
# Ans: population mean

# The Law of Large Numbers (LLN) says that the average (mean) approaches what it's estimating. We saw in our simulations that the larger the sample size the better the estimation.  As we flip a fair coin over and over, it eventually converges to the true probability of a head (.5).
# The LLN forms the basis of frequency style thinking.

# To see this in action, we've copied some code from the slides and created the function coinPlot. It takes an integer n which is the number of coin tosses that will be simulated. As coinPlot does these coin flips it computes the cumulative sum (assuming heads are 1 and tails 0), but after each toss it divides the cumulative sum by the number of flips performed so far. It then plots this value for each of the k=1...n tosses.
> coinPlot
# function(n){
#   means <- cumsum(sample(0 : 1, n , replace = TRUE)) / (1  : n)
#   g <- ggplot(data.frame(x = 1 : n, y = means), aes(x = x, y = y)) 
#   g <- g + geom_hline(size=1.5 ,yintercept = 0.5,alpha=0.6,
#                       linetype="longdash") + geom_line(size = 1)
#   if(n<100){
#     g <- g + geom_point(colour="red",size=3,alpha=0.8)
#   }	 
#   g <- g + labs(x = "Number of obs", y = "Cumulative mean")
#   g <- g + scale_x_continuous(breaks=seq(0,n+1,ceiling(n/10)))
#   print(g)
#   invisible()
# }

> coinPlot(10)
# see image-11.png

# Your output depends on R's random number generator, but your plot probably jumps around a bit and, by the 10th flip, your cumulative sum/10 is probably different from mine. If you did this several times, your plots would vary quite a bit. 

# Now call coinPlot again, this time with 10000 as the argument.
> coinPlot(10000)
# see image-12.png

# See the difference? Asymptotics in Action! The line approaches its asymptote of .5. This is the probability you expect since what we're plotting, the cumulative sum/number of flips, represents the probability of the coin landing on heads. As we know, this is .5 .
# We say that an estimator is CONSISTENT if it converges to what it's trying to estimate. The LLN says that the sample mean of iid samples is consistent for the population mean. This is good, right?

# Q: Based on our previous lesson do you think the sample variance (and hence sample deviation) are consistent as well?
# Ans: Yes

# Now for something really important - the CENTRAL LIMIT THEOREM (CLT) - one of the most important theorems in all of statistics. It states that the distribution of averages of iid variables (properly normalized) becomes that of a standard normal as the sample size increases.
# Let's dissect this to see what it means. First, 'properly normalized' means that you transformed the sample mean X'. You subtracted the population mean mu from it and divided the difference by sigma/sqrt(n). Here sigma is the standard deviation of the population and n is the sample size.
# Second, the CLT says that for large n, this normalized variable, (X'-mu)/(sigma/sqrt(n)) is almost normally distributed with mean 0 and variance 1. Remember that n must be large for the CLT to apply.

# Q: Do you recognize sigma/sqrt(n) from our lesson on variance? Since the population std deviation sigma is unknown, sigma/sqrt(n) is often approximated by what?
# Ans: the standard error of the sample mean

# Let's rephrase the CLT. Suppose X_1, X_2, ... X_n are independent, identically distributed random variables from an infinite population with mean mu and variance sigma^2. Then if n is large, the mean of the X's, call it X', is approximately normal with mean mu and variance sigma^2/n. We denote this as X'~N(mu,sigma^2/n).
# To show the CLT in action consider this figure(image-13.png) from the slides. It presents 3 histograms of 1000 averages of dice rolls with sample sizes of 10, 20 and 30 respectively. Each average of n dice rolls (n=10,20,30) has been normalized by subtracting off the mean (3.5) then dividing by the standard error, sqrt(2.92/n). The normalization has made each histogram look like a standard normal, i.e., mean 0 and standard deviation 1.
# Notice that the CLT said nothing about the original population being normally distributed. That's precisely where its usefulness lies! We can assume normality of a sample mean no matter what kind of population we have, as long as our sample size is large enough and our samples are independent. Let's look at how it works with a binomial experiment like flipping a coin.

# Recall that if the probability of a head (call it 1) is p, then the probability of a tail (0) is 1-p. The expected value then is p and the variance is p-p^2 or p(1-p). Suppose we do n coin flips and let p' represent the average of these n flips. We normalize p' by subtracting the mean p and dividing by the std deviation sqrt(p(1-p)/n). Let's do this for 1000 trials and plot the resulting histogram.
# Here's a figure(image-14.png) from the slides showing the results of 3 such trials where each trial is for a different value of n (10, 20, and 30) and the coin is fair,so E(X)=.5 and the standard error is 1/(2sqrt(n)). Notice how with larger n (30) the histogram tightens up around the mean 0.
# Here's another plot(image-15.png) from the slides of the same experiment, this time using a biassed coin. We set the probability of a head to .9, so E(X)=.9 and the standard error is sqrt(.09/n) Again, the larger the sample size the more closely the distribution looks normal, although with this biassed coin the normal approximation isn't as good as it was with the fair coin.

# Now let's talk about confidence intervals.
# The 95% says that if one were to repeatedly get samples of size n, about 95% of the intervals obtained would contain mu, the quantity we're trying to estimate.

# Note that for a 95% confidence interval we divide (100-95) by 2 (since we have both left and right tails) and add the result to 95 to compute the quantile we need. The 97.5 quantile is actually 1.96, but for simplicity it's often just rounded up to 2.
# Q: If you wanted to find a 90% confidence interval what quantile would you want?
# hint: Divide (100-90) by 2 and add this result to 90.
# Ans: 95

# Use the R function qnorm to find the 95th quantile for a standard normal distribution. Remember that qnorm takes a probability as an input. You can use default values for all the other arguments.
> qnorm(p = 0.95)
# [1] 1.644854

# As we've seen before, in a binomial distribution in which p represents the probability or proportion of success, the variance sigma^2 is p(1-p), so the standard error of the sample mean p' is sqrt(p(1-p)/n) where n is the sample size. The 95% confidence interval of p is then p' +/- 2*sqrt(p(1-p)/n).
# Q: The 2 in this formula represents what?
# Ans: the approximate 97.5% normal quantile

# A critical point here is that we don't know the true value of p; that's what we're trying to estimate. How can we compute a confidence interval if we don't know p(1-p)? We could be conservative and try to maximize it so we get the largest possible confidence interval. Calculus tells us that p(1-p) is maximized when p=1/2, so we get the biggest 95% confidence interval when we set p=1/2 in the formula p'+/- 2*sqrt(p(1-p)/n).
# Q: Using 1/2 for the value of p in the formula above yields what expression for the 95% confidence interval for p?
# Ans: p'+/- 1/sqrt(n)

# Here's another example of applying this formula from the slides. Suppose you were running for office and your pollster polled 100 people. Of these 60 claimed they were going to vote for you. You'd like to estimate the true proportion of people who will vote for you and you want to be 95% confident of your estimate. We need to find the limits that will contain the true proportion of your supporters with 95% confidence, so we'll use the formula p' +/- 1/sqrt(n) to answer this question.
# Q: First, what value would you use for p', the sampled estimate?
# Ans: 0.60

# Q: What would you use for 1/sqrt(n)?
# hint: The sample size is n, and in this case n=100. What is 1/sqrt(100)?
# Ans: 1/10

# Q: The bounds of the interval then are what?
# hint: (We know p'- 1/sqrt(n) is the lower bound and p'+ 1/sqrt(n) is the upper bound, so use the answers from the two previous answers to fill in values for these variables.)
# Ans: .5 and .7

# Q: How do you feel about the election?
# Ans: confident

# Another technique for calculating confidence intervals for binomial distributions is to replace p with p'. This is called the Wald confidence interval. We can also use the R function qnorm to get a more precise quantile value (closer to 1.96) instead of our ballpark estimate of 2.

# Q: With the formula p'+/- qnorm(.975)*sqrt(p'(1-p')/100), use the p' and n values from above and the R construct p'+c(-1,1)... to handle the plus/minus portion of the formula. You should see bounds similar to the ones you just estimated.
> 0.6 + c(-1,1) * qnorm(0.975) * sqrt(0.6 * (1 - 0.6)/100)
# [1] 0.5039818 0.6960182

# As an alternative to this Wald interval, we can also use the R function binom.test with the parameters 60 and 100 and let all the others default. This function "performs an exact test of a simple null hypothesis about the probability of success in a Bernoulli experiment." (This means it guarantees the coverages, uses a lot of computation and doesn't rely on the CLT.) This function returns a lot of information but all we want now are the values of the confidence interval that it returns. Use the R construct x$conf.int to find these now.
> binom.test(60, 100)$conf.int
# [1] 0.4972092 0.6967052
# attr(,"conf.level")
# [1] 0.95

# Close to what we've seen before, right? Now we're going to see that the Wald interval isn't very accurate when n is small. We'll use the example from the slides.
# Suppose we flip a coin a small number of times, say 20. Also suppose we have a function mywald which takes a probability p, and generates 30 sets of 20 coin flips using that probability p. It uses the sampled proportion of success, p', for those 20 coin flips to compute the upper and lower bounds of the 95% Wald interval, that is, it computes the two numbers p'+/- qnorm(.975) * sqrt(p' * (1-p') / n) for each of the 30 trials. For the given true probability p, we count the number of times out of those 30 trials that the true probability p was in the Wald confidence interval. We'll call this the coverage.
# To make sure you understand what's going on, try running mywald now with the probability .2. It will print out 30 p' values (which you don't really need to see), followed by 30 lower bounds, 30 upper bounds and lastly the percentage of times that the input .2 was between the two bounds. See if you agree with the percentage you get. Usually it suffices to just count the number of times (out of the 30) that .2 is less than the upper bound.
> mywald
# function(p){
#   phats <- rbinom(nosim, prob = p, size = n) / n
#   ll <- phats - qnorm(.975) * sqrt(phats * (1 - phats) / n)
#   ul <- phats + qnorm(.975) * sqrt(phats * (1 - phats) / n)
#   print("Here are the p\' values")
#   print(phats)
#   print("Here are the lower")
#   print(ll)
#   print("Here are the upper")
#   print(ul)
#   mean(ll < p & ul > p)
# }

> mywald(.2)
# [1] "Here are the p' values"
# [1] 0.25 0.25 0.15 0.15 0.15 0.05 0.05 0.15 0.00 0.10 0.25 0.10 0.15 0.10 0.10 0.35
# [17] 0.35 0.15 0.20 0.20 0.10 0.25 0.15 0.10 0.20 0.10 0.05 0.25 0.20 0.10
# [1] "Here are the lower"
# [1]  0.060227303  0.060227303 -0.006490575 -0.006490575 -0.006490575 -0.045516829
# [7] -0.045516829 -0.006490575  0.000000000 -0.031478381  0.060227303 -0.031478381
# [13] -0.006490575 -0.031478381 -0.031478381  0.140962697  0.140962697 -0.006490575
# [19]  0.024695492  0.024695492 -0.031478381  0.060227303 -0.006490575 -0.031478381
# [25]  0.024695492 -0.031478381 -0.045516829  0.060227303  0.024695492 -0.031478381
# [1] "Here are the upper"
# [1] 0.4397727 0.4397727 0.3064906 0.3064906 0.3064906 0.1455168 0.1455168 0.3064906
# [9] 0.0000000 0.2314784 0.4397727 0.2314784 0.3064906 0.2314784 0.2314784 0.5590373
# [17] 0.5590373 0.3064906 0.3753045 0.3753045 0.2314784 0.4397727 0.3064906 0.2314784
# [25] 0.3753045 0.2314784 0.1455168 0.4397727 0.3753045 0.2314784
# [1] 0.8666667


# Now that you understand the underlying principle, suppose instead of 30 trials, we used 1000 trials. Also suppose we did this experiment for a series of probabilities, say from .1 to .9 taking steps of size .05. More specifically, we'll call our function using 17 different probabilities, namely .1, .15, .2, .25, ... .9 . We can then plot the percentages of coverage for each of the probabilities.
# Here's the plot(image-16.png) of our results. Each of the 17 vertices show the percentage of coverage for a particular true probability p passed to the function. Results will vary, but usually the only probability that hits close to or above the 95% line is the p=.5 . So this shows that when n, the number of flips, is small (20) the CLT doesn't hold for many values of p, so the Wald interval doesn't work very well.
# Let's try the same experiment(image-17.png) and increase n, the number of coin flips in each of our 1000 trials, from 20 to 100 to see if the plot improves. Again, results may vary, but all the probabilities are much closer to the 95% line, so the CLT works better with a bigger value of n.
# A quick fix to the problem of having a small n is to use the Agresti/Coull interval. This simply means we add 2 successes and 2 failures to the counts when calculating the proportion p'. Specifically, if X is the number of successes out of the 20 coin flips, then instead of setting p'=X/20, let p'=(X+2)/24. We use 24 as the number of trials since we've added 2 successes and 2 failures to the counts. Note that we still use 20 in the calculation of the upper and lower bounds.
# Here's a plot(image-18.png) using this Agresti/Coull interval, with 1000 trials of 20 coin flips each. It looks much better than both the original Wald with 20 coin flips and the improved Wald with 100 coin flips. However, this technique might make the confidence interval too wide.
# Why does this work? Adding 2 successes and 2 failures pulls p' closer to .5 which, as we saw, is the value which maximizes the confidence interval.

# To show this simply, we wrote a function ACCompar, which takes an integer input n. For each k from 1 to n it computes two fractions, k/n and (k+2)/(n+4). It then prints out the boolean vector of whether the new (k+2)/(n+4) fraction is less than the old k/n. It also prints out the total number of k's for which the condition is TRUE.
# For all k less than n/2, you see FALSE indicating that the new fraction is greater than or equal to k/n. For all k greater than n/2 you see TRUE indicating that the new fraction is less than the old. If k=n/2 the old and new fractions are equal.
> ACCompar
# function(n){
#   num <- 1:n 
#   den <- n
#   nn <- num+2
#   nd <- den+4
#   nf <- nn/nd
#   of <- num/den
#   scor <- nf<of
#   print(scor)
#   sum(scor)
# }

> ACCompar(20)
# [1] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE  TRUE
# [14]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
# [1] 10

# Let's move on to Poisson distributions and confidence intervals. Recall that Poisson distributions apply to counts or rates. For the latter, we write X~Poisson(lambda*t) where lambda is the expected count per unit of time and t is the total monitoring time.
# Here's another example from the slides. Suppose a nuclear pump failed 5 times out of 94.32 days and we want a 95% confidence interval for the failure rate per day. The number of failures X is Poisson distributed with parameter (lambda*t). We don't observe the failure rate, but we estimate it as x/t. Call our estimate lambda_hat, so lambda_hat=x/t. According to theory, the variance of our estimated failure rate is lambda/t. Again, we don't observe lambda, so we use our estimate of it instead. We thus approximate the variance of lambda_hat as lambda_hat/t.

# Q: In this example what would you use as the estimated mean x/t?
# Ans: 5/94.32

# Set a variable lamb now with this value.
> lamb <- 5/94.32

# So lamb is our estimated mean and lamb/t is our estimated variance. The formula we've used to calculate a 95% confidence interval is est mean + c(-1,1)*qnorm(.975)*sqrt(est var). Use this formula now making the appropriate substitutions.
> lamb +c(-1,1) * qnorm(.975) * sqrt(lamb/94.32)
# [1] 0.006545667 0.099476386

# As a check we can use R's function poisson.test with the arguments 5 and 94.32 to check this result. This is an exact test so it guarantees coverage. As with the binomial exact test, we only need to look at the conf portion of the result using the x$conf construct. Do this now.
> poisson.test(5, 94.32)$conf
# [1] 0.01721254 0.12371005
# attr(,"conf.level")
# [1] 0.95

# Pretty close, right? Now to check the coverage of our estimate we'll run the same simulation experiment we ran before with binomial distributions. We'll vary our lambda values from .005 to .1 with steps of .01 (so we have 10 of them), and for each one we'll generate 1000 Poisson samples with mean lambda*t. We'll calculate sample means and use them to compute 95% confidence intervals. We'll then count how often out of the 1000 simulations the true mean (our lambda) was contained in the computed interval.
# Here's a plot(image-19.png) of the results. We see that the coverage improves as lambda gets larger, and it's quite off for small lambda values.
# Now it's interesting to see how the coverage improves when we increase the unit of time. In the previous plot(image-19.png) we used t=100 (rounding the 94.32 up). Here's a plot(image-20.png) of the same experiment setting t=1000. We see that the coverage is much better for almost all the values of lambda, except for the smallest ones.

# Now for a quick review!
# Q: What tells us that averages of iid samples converge to the population means that they are estimating?
# Ans: the law of large numbers

# Q: What tells us that averages are approximately normal for large enough sample sizes
# Ans: the CLT

# Q: The Central Limit Theorem (CLT) tells us that averages have what kind of distributions?
# Ans: normal

# Q: The Central Limit Theorem (CLT) tells us that averages have normal distributions centered at what?
# Ans: the population mean

# Q: The Central Limit Theorem (CLT) tells us that averages have normal distributions with standard deviations equal to what?
# Ans: the standard error

# Q: True or False - The Central Limit Theorem (CLT) tells us that averages always have normal distributions no matter how big the sample size
# Ans: False

# Q: To calculate a confidence interval for a mean you take the sample mean and add and subtract the relevant normal quantile times the what?
# Ans: standard error

# Q: For a 95% confidence interval approximately how many standard errors would you add and subtract from the sample mean?
# Ans: 2

# Q:  If you wanted increased coverage what would you do to your confidence interval?
# Ans: increase it

# Q: If you had less variability in your data would your confidence interval get bigger or smaller?
# Ans: smaller

# Q: If you had larger sample size would your confidence interval get bigger or smaller?
# Ans: smaller

# Q:  A quick fix for small sample size binomial calculations is what?
# Ans: add 2 successes and 2 failures

#############################################################################
# 9: T Confidence Intervals                                                 #
#############################################################################
# Slides for this and other Data Science courses may be found at github https://github.com/DataScienceSpecialization/courses/. If you care to use them, they must be downloaded as a zip file and viewed locally. This lesson corresponds to 06_Statistical_Inference/08_tCIs
# In this lesson, we'll discuss some statistical methods for dealing with small datasets, specifically the Student's or Gosset's t distribution and t confidence intervals.
# In the Asymptotics lesson we discussed confidence intervals using the Central Limit Theorem (CLT) and normal distributions. These needed large sample sizes, and the formula for computing the confidence interval was Est +/- qnorm *std error(Est), where Est was some estimated value (such as a sample mean) with a standard error. Here qnorm represented what?
# Ans: a specified quantile from a normal distribution

# In the Asymptotics lesson we also mentioned the Z statistic Z=(X'-mu)/(sigma/sqrt(n)) which follows a standard normal distribution. This normalized statistic Z is especially nice because we know its mean and variance. They are what, respectively?
# Ans: 0 and 1

# So the mean and variance of the standardized normal are fixed and known. Now we'll define the t statistic which looks a lot like the Z. It's defined as t=(X'-mu)/(s/sqrt(n)). Like the Z statistic, the t is centered around 0. The only difference between the two is that the population std deviation, sigma, in Z is replaced by the sample standard deviation in the t. So the distribution of the t statistic is independent of the population mean and variance. Instead it depends on the sample size n.
# As a result, for t distributions, the formula for computing a confidence interval is similar to what we did in the last lesson. However, instead of a quantile for a normal distribution we use a quantile for a t distribution. So the formula is Est +/- t-quantile *std error(Est). The other distinction, which we mentioned before, is that we'll use the sample standard deviation when we estimate the standard error of Est.
# In the formula for the t statistic t=(X'-mu)/(s/sqrt(n)) what expression represents the sample standard deviation?
# Ans: s

# These t confidence intervals are very handy, and if you have a choice between these and normal, pick these. We'll see that as datasets get larger, t-intervals look normal. We'll cover the one- and two-group versions which depend on the data you have.
# The t distribution, invented by William Gosset in 1908, has thicker tails than the normal. Also, instead of having two parameters, mean and variance, as the normal does, the t distribution has only one - the number of degrees of freedom (df).
# As df increases, the t distribution gets more like a standard normal, so it's centered around 0. Also, the t assumes that the underlying data are iid Gaussian so the statistic (X' - mu)/(s/sqrt(n)) has n-1 degrees of freedom.

# Q: Quick check. In the formula t=(X' - mu)/(s/sqrt(n)), if we replaced s by sigma the statistic t would be what asymptotically?.
# Ans: the standard normal

# To see what we mean, we've taken code from the slides, the function myplot, which takes the integer df as its input and plots the t distribution with df degrees of freedom. It also plots a standard normal distribution so you can see how they relate to one another.
> myplot
# function(df){
#   d <- data.frame(y = c(dnorm(xvals), dt(xvals, df)),
#                   x = xvals,
#                   dist = factor(rep(c("Normal", "T"), c(k,k))))
#   g <- ggplot(d, aes(x = x, y = y)) 
#   g <- g + geom_line(size = 2, aes(colour = dist))
#   print(g)
# }
> myplot(2)
# see image-21.png
# You can see that the hump of t distribution (in blue) is not as high as the normal's. Consequently, the two tails of the t distribution absorb the extra mass, so they're thicker than the normal's. Note that with 2 degrees of freedom, you only have 3 data points. Ha! Talk about small sample sizes. Now try myplot with an input of 20.

> myplot(20)
# see image-22.png
# The two distributions are almost right on top of each other using this higher degree of freedom.
# Another way to look at these distributions is to plot their quantiles. From the slides, we've provided a second function for you, myplot2, which does this. It plots a lightblue reference line representing normal quantiles and a black line for the t quantiles. Both plot the quantiles starting at the 50th percentile which is 0 (since the distributions are symmetric about 0) and go to the 99th.

> myplot2
# function(df){
#   d <- data.frame(n= qnorm(pvals),t=qt(pvals, df),
#                   p = pvals)
#   g <- ggplot(d, aes(x= n, y = t))
#   g <- g + geom_abline(size = 2, col = "lightblue")
#   g <- g + geom_line(size = 2, col = "black")
#   g <- g + geom_vline(xintercept = qnorm(0.975))
#   g <- g + geom_hline(yintercept = qt(0.975, df))
#   print(g)
# }

> myplot2(2)
# see image-23.png
# The distance between the two thick lines represents the difference in sizes between the quantiles and hence the two sets of intervals. Note the thin horizontal and vertical lines. These represent the .975 quantiles for the t and normal distributions respectively. Anyway, you probably recognized the placement of the vertical at 1.96 from the Asymptotics lesson.

# Check the placement of the horizontal now using the R function qt with the arguments .975 for the quantile and 2 for the degrees of freedom (df).
> qt(.975, df = 2)
# [1] 4.302653
# See? It matches the horizontal line of the plot.

# Now run myplot2 with an argument of 20.
> myplot2(20)
# see image-24.png
# The quantiles are much closer together with the higher degrees of freedom. At the 97.5 percentile, though, the t quantile is still greater than the normal. Student's Rules!
# This means the the t interval is always wider than the normal. This is because estimating the standard deviation introduces more uncertainty so a wider interval results.
# So the t-interval is defined as X' +/- t_(n-1)*s/sqrt(n) where t_(n-1) is the relevant quantile. The t interval assumes that the data are iid normal, though it is robust to this assumption and works well whenever the distribution of the data is roughly symmetric and mound shaped.

# Q: Our plots showed us that for large degrees of freedom, t quantiles become close to what?
# Ans: standard normal quantiles

# Although it's pretty great, the t interval isn't always applicable. For skewed distributions, the spirit of the t interval assumptions (being centered around 0) are violated. There are ways of working around this problem (such as taking logs or using a different summary like the median).
# For highly discrete data, like binary, intervals other than the t are available.
# However, paired observations are often analyzed using the t interval by taking differences between the observations. We'll show you what we mean now.
# We hope you're not tired because we're going to look at some sleep data. This was the data originally analyzed in Gosset's Biometrika paper, which shows the increase in hours for 10 patients on two soporific drugs.
# We've loaded the data for you. R treats it as two groups rather than paired. To see what we mean type sleep now. This will show you how the data is stored.
> sleep
# extra group ID
# 1    0.7     1  1
# 2   -1.6     1  2
# 3   -0.2     1  3
# 4   -1.2     1  4
# 5   -0.1     1  5
# 6    3.4     1  6
# 7    3.7     1  7
# 8    0.8     1  8
# 9    0.0     1  9
# 10   2.0     1 10
# 11   1.9     2  1
# 12   0.8     2  2
# 13   1.1     2  3
# 14   0.1     2  4
# 15  -0.1     2  5
# 16   4.4     2  6
# 17   5.5     2  7
# 18   1.6     2  8
# 19   4.6     2  9
# 20   3.4     2 10

# We see 20 entries, the first 10 show the results (extra) of the first drug (group 1) on each of the patients (ID), and the last 10 entries the results of the second drug (group 2) on each patient (ID).
# Here we've plotted(image-25.png) the data in a paired way, connecting each patient's two results with a line, group 1 results on the left and group 2 on the right. See that purple line with the steep slope? That's ID 9, with 0 result for group 1 and 4.6 for group 2.
# If we just looked at the 20 data points we'd be comparing group 1 variations with group 2 variations. Both groups have quite large ranges. However, when we look at the data paired for each patient, we see that the variations in results are usually much smaller and depend on the particular subject.
# To clarify, we've defined some variables for you, namely g1 and g2. These are two 10-long vectors, respectively holding the results of the 10 patients for each of the two drugs. Look at the range of g1 using the R command range.
> range(g1)
# [1] -1.6  3.7

# So g1 values go from -1.6 to 3.7. Now look at the range of g2. We see that the ranges of both groups are relatively large.
> range(g2)
# [1] -0.1  5.5

# Now let's look at the pairwise difference. We can take advantage of R's componentwise subtraction of vectors and create the vector of difference by subtracting g1 from g2. Do this now and put the result in the variable difference.
difference <- g2 - g1
> mean(difference)
# [1] 1.58
# See how much smaller the mean difference in this paired data is compared to the group variations?

# Now use the R function sd to find the standard deviation of difference and put the result in the variable s.
> s <- sd(difference)

# Now recall the formula for finding the t confidence interval, X' +/- t_(n-1)*s/sqrt(n). Make the appropriate substitutions to find the 95% confidence intervals for the average difference you just computed. We've stored that average difference in the variable mn for you to use here. Remember to use the R construct c(-1,1) for the +/- portion of the formula and the R function qt with .975 and n-1 degrees of freedom for the quantile portion. Our data size is 10.
> mn + c(-1,1) * qt(.975, 9) * s / sqrt(10)
# [1] 0.7001142 2.4598858

# This says that with probability .95 the average difference of effects (between the two drugs) for an individual patient is between .7 and 2.46 additional hours of sleep.
# We could also just have used the R function t.test with the argument difference to get this result. (You can use the default values for all the other arguments.) As with the other R test functions, this returns a lot of information. Since all we're interested in at the moment is the confidence interval we can pick this off with the construct x$conf.int. Try this now.
> t.test(difference)$conf.int
# [1] 0.7001142 2.4598858
# attr(,"conf.level")
# [1] 0.95

# Here's code from the slides which shows four different ways of using t.test (including the two we just went through) to find the confidence interval of this data. The code also shows how to display the intervals nicely in a 4 x 2 array.
#show 4 different calls to t.test
#display as 4 long array
# rbind(
#   mn + c(-1, 1) * qt(.975, n-1) * s / sqrt(n),
#   as.vector(t.test(difference)$conf.int),
#   as.vector(t.test(g2, g1, paired = TRUE)$conf.int),
#   as.vector(t.test(extra ~ I(relevel(group, 2)), paired = TRUE, data = sleep)$conf.int)
# )

# Here's code from the slides which shows four different ways of using t.test (including the two we just went through) to find the confidence interval of this data. The code also shows how to display the intervals nicely in a 4 x 2 array.
# Suppose that we want to compare the mean blood pressure between two groups in a randomized trial. We'll compare those who received the treatment to those who received a placebo. Unlike the sleep study, we cannot use the paired t test because the groups are independent and may have different sample sizes.
# So our goal is to find a 95% confidence interval of the difference between two population means. Let's represent this difference as mu_y - mu_x. How do we do this? Recall our formula X' +/- t_(n-1)*s/sqrt(n).
# First we need a sample mean, but we have two, X' and Y', one from each group. It makes sense that we'd have to take their difference (Y'-X') as well, since we're looking for a confidence interval that contains the difference mu_y-mu_x. Now we need to specify a t quantile. Suppose the groups have different sizes n_x and n_y.

# Q: For one group we used the quantile t_(.975,n-1). What do you think we'll use for the quantile of this problem?
# Ans: t_(.975,n_x+n_y-2)

# The only term remaining is the standard error which for the single group is s/sqrt(n). Let's deal with the numerator first. Our interval will assume (for now) a common variance s^2 across the two groups. We'll actually pool variance information from the two groups using a weighted sum. (We'll deal with the more complicated situation later.)
# We call the variance estimator we use the pooled variance. The formula for it requires two variance estimators (in the form of the standard deviation), S_x and S_y, one for each group. We multiply each by its respective degrees of freedom and divide the sum by the total number of degrees of freedom. This weights the respective variances; those coming from bigger samples get more weight.

# Q:  Which of the following represents the numerator of this expression?
# Ans: (n_x-1)(S_x)^2+(n_y-1)(S_y)^2

# Q:  Which of the following represents the total number of degrees of freedom?
# Ans: (n_x-1)+(n_y-1)

# Now recall we're calculating the standard error term which for the single group case was s/sqrt(n). We've got the numerator done, by pooling the sample variances. How do we handle the 1/sqrt(n) portion? We can simply add 1/n_x and 1/n_y and take the square root of the sum. Then we MULTIPLY this by the sample variance to complete the estimate of the standard error.
# Now we'll plug in some numbers from the slides based on an example from Rosner's book Fundamentals of Biostatistics, a very good, if heavy, reference book. We want to compare blood pressure from two independent groups.

#  The first is a group of 8 oral contraceptive users and the second is a group of 21 controls. The two means are X'_{oc}=132.86 and X'_{c}=127.44, and the two sample standard deviations are s_{oc}= 15.34 and s_{c}= 18.23. Let's first compute the numerator of the pooled sample variance by weighting the sum of the two by their respective sample sizes. Recall the formula (n_x-1)(S_x)^2+(n_y-1)(S_y)^2 and fill in the values to create a variable sp.
> sp <- (7 * 15.34^2) + (20 * 18.23^2)

# Now how many degrees of freedom are there? Put your answer in the variable ns.
ns <- 8 + 21 - 2

# Now divide sp by ns, take the square root and put the result back in sp.
sp <- sqrt(sp / ns)

# Now to find the 95% confidence interval. Recall our basic formula X' +/- t_(n-1)*s/sqrt(n) and all the changes we need to make for working with two independent samples. We'll plug in the difference of the sample means for X' and our variable ns for the degrees of freedom when finding the t quantile. For the standard error, we multiply sp by the square root of the sum 1/n_{oc} + 1/n_{c}. The values for this problem are X'_{oc}=132.86 and X'_{c}=127.44, n_{oc}=8 and n_{c}=21. Be sure to use the R construct c(-1,1) for the +/- portion and the R function qt with the correct percentile and degrees of freedom.
> 132.86 - 127.44 + c(-1,1) * qt(.975, ns) * sp * sqrt(1/8+1/21)
# [1] -9.521097 20.361097

# Notice that 0 is contained in this 95% interval. That means that you can't rule out that the means of the two groups are equal since a difference of 0 is in the interval.
# Getting tired? Let's revisit the sleep problem and instead of looking at the data as paired over 10 subjects we'll look at it as two independent sets each of size 10. Recall the data is stored in the two vectors g1 and g2; we've also stored the difference between their means in the variable md.

# Let's compute the sample pooled variance and store it in the variable sp. Recall that this is the sqrt(weighted sums of sample variances/deg of freedom). The weight of each is the sample size-1. Use the R function var to compute the variances of g1 and g2. The degrees of freedom is 10+10-2 = 18.
sp <- sqrt((9*var(g1)+9*var(g2))/18)

# Now the last term of the formula, the standard error of the mean difference, is simply sp times the square root of the sum 1/10 + 1/10. Find the 95% t confidence interval of the mean difference of the two groups g1 and g2. Substitute md and sp into the formula you used above.
> md + c(-1,1)*qt(.975,18)*sp*sqrt(1/5)
# [1] -0.203874  3.363874

# We can check this manual calculation against the R function t.test. Since we subtracted g1 from g2, be sure to place g2 as your first argument and g1 as your second. Also make sure the argument paired is FALSE and var.equal is TRUE. We only need the confidence interval so use the construct x$conf.  Do this now.
> t.test(g2, g1, paired = FALSE, var.equal = TRUE)$conf
# [1] -0.203874  3.363874
# attr(,"conf.level")
# [1] 0.95

# Pretty cool that it matches, right? Note that 0 is again in this 95% interval so you can't reject the claim that the two groups are the same. (Recall that this is the opposite of what we saw with paired data.) Let's run t.test again, this time with paired=TRUE and see how different the result is. Don't specify var.equal and look only at the confidence interval.
> t.test(g2, g1, paired = TRUE)$conf
# [1] 0.7001142 2.4598858
# attr(,"conf.level")
# [1] 0.95

# Just as we saw when we ran t.test on our vector, difference! See how the interval excludes 0? This means the groups when paired have much different averages.
# Now let's talk about calculating confidence intervals for two groups which have unequal variances. We won't be pooling them as we did before.
# In this case the formula for the interval is similar to what we saw before, Y'-X' +/- t_df * SE, where as before Y'-X' represents the difference of the sample means. However, the standard error SE and the quantile t_df are calculated differently from previous methods. Here SE is the square root of the sum of the squared standard errors of the two means, (s_1)^2/n_1 + (s_2)^2/n_2 .
# When the underlying X and Y data are iid normal and the variances are different, the normalized statistic we started this lesson with, (X'-mu)/(s/sqrt(n)), doesn't follow a t distribution. However, it can be approximated by a t distribution if we set the degrees of freedom appropriately.
# The formula for the degrees of freedom is a complicated fraction that no one remembers.  The numerator is the SQUARE of the sum of the squared standard errors of the two sample means. Each has the form s^2/n. The denominator is the sum of two terms, one for each group. Each term has the same form. It is the standard error of the mean raised to the fourth power divided by the sample size-1. More precisely, each term looks like (s^4/n^2)/(n-1). We use this df to find the t quantile.
# Here's the formula. You might have to stretch the plot window to get it displayed more clearly.
# Let's plug in the numbers from the blood pressure study to see how this works. Recall we have two groups, the first with size 8 and X'_{oc}=132.86 and s_{oc}=15.34 and the second with size 21 and X'_{c}=127.44 and s_{c}=18.23.
# Let's compute the degrees of freedom first. Start with the numerator. It's the square of the sum of two terms. Each term is of the form s^2/n. Do this now and put the result in num. Our numbers were 15.34 with size 8 and 18.23 with size 21.
num <- (15.34^2/8 + 18.23^2/21)^2

# Now the denominator. This is the sum of two terms. Each term has the form s^4/n^2/(n-1). These look a little different than the form displayed but they're equivalent. Put the result in the variable den. Our numbers were 15.34 with size 8 and 18.23 with size 21.
den <- 15.34^4/8^2/7 + 18.23^4/21^2/20

# Now divide num by den and put the result in mydf.
mydf <- num / den

# Now with the R function qt(.975,mydf) compute the 95% t interval. Recall the formula. X'_{oc}-X'_{c} +/- t_df * SE. Recall that SE is the square root of the sum of the squared standard errors of the two means, (s_1)^2/n_1 + (s_2)^2/n_2 . Again our numbers are the following. X'_{oc}=132.86 s_{oc}=15.34 and n_{oc}=8 . X'_{c}=127.44 s_{c}=18.23 and n_{c}=21.
132.86-127.44 +c(-1,1)*qt(.975,mydf)*sqrt(15.34^2/8 + 18.23^2/21)
# [1] -8.913327 19.753327

# Don't worry about these nasty calculations. R makes things a lot easier. If you call t.test with var.equal set to FALSE, then R calculates the degrees of freedom for you. You don't have to memorize the formula.

#############################################################################
# 10: Hypothesis Testing                                                    #
#############################################################################
# Slides for this and other Data Science courses may be found at github https://github.com/DataScienceSpecialization/courses/. If you care to use them, they must be downloaded as a zip file and viewed locally. This lesson corresponds to 06_Statistical_Inference/09_HT
# In this lesson, as the name suggests, we'll discuss hypothesis testing which is concerned with making decisions about populations using observed data.
# An important concept in hypothesis testing is the NULL hypothesis, usually denoted as H_0. This is the hypothesis that represents the status_quo and is assumed true. It's a baseline against which you're testing alternative hypotheses, usually denoted by H_a. Statistical evidence is required to reject H_0 in favor of the research or alternative hypothesis.
# We'll consider the motivating example from the slides. A respiratory disturbance index (RDI) of more than 30 events / hour is considered evidence of severe sleep disordered breathing (SDB). Suppose that in a sample of 100 overweight subjects with other risk factors for SDB at a sleep clinic, the mean RDI (X') was 32 events / hour with a standard deviation (s) of 10 events / hour.
# We want to test the null hypothesis H_0 that mu = 30. Our alternative hypothesis H_a is mu>30. Here mu represents the hypothesized population mean RDI.

# So we have two competing hypotheses, H_0 and H_a, of which we'll have to pick one (using statistical evidence). That means we have four possible outcomes determined by what really is (the truth) and which hypothesis we accept based on our data. Two of the outcomes are correct and two are errors.
# H_a is TRUE and we accept it

# Q:  Which of the following outcomes would be an error?
# Ans: H_0 is TRUE and we reject it

#  So it's correct to accept a true hypothesis or reject a false one. Pretty clear, right?
# The errors are also clear - rejecting a true hypothesis or accepting a false one.
# We distinguish between these two errors. A Type I error REJECTS a TRUE null hypothesis H_0 and a Type II error ACCEPTS a FALSE null hypothesis H_0.

# Q: Can we ever be sure that we're absolutely right?
# Ans: No

# Since there's some element of uncertainty in questions concerning populations, we deal with probabilities. In our hypothesis testing we'll set the probability of making errors small. For now we'll focus on Type I errors, rejecting a correct hypothesis.
# The probabilities of making these two kinds of errors are related. If you decrease the probability of making a Type I error (rejecting a true hypothesis), you increase the probability of making a Type II error (accepting a false one) and vice versa.

# As in the slides, we'll consider an American court of law. The null hypothesis is that the defendant is innocent. If an innocent man is convicted what type of error is this?
# Ans: Type I

# Q: You might send the innocent man to jail by rejecting H_0. Suppose a guilty person is not convicted. What type of error is this?
# Ans: Type II

# Back to sleep (example)! A reasonable strategy would reject the null hypothesis if our sample mean X' was larger than some constant C. We choose C so that the probability of a Type I error, alpha, is .05 (or some other favorite constant). Many scientific papers use .05 as a standard level of rejection.
# This means that alpha, the Type I error rate, is the probability of rejecting the null hypothesis when, in fact, it is correct. We don't want alpha too low because then we would never reject the null hypothesis even if it's false.

# Recall that the standard error of a sample mean is given by the formula s/sqrt(n). Recall in our sleep example we had a sample of 100 subjects, our mean RDI (X') was 32 events / hour with a standard deviation (s) of 10 events / hour. What is the standard error of the mean in this example?
> 10 / sqrt(100)
# [1] 1

# Under H_0, X' is normally distributed with mean mu=30 and variance 1. (We're estimating the variance as the square of the standard error which in this case is 1.) We want to choose the constant C so that the probability that X is greater than C given H_0 is 5%. That is, P(X > C H_0) is 5%. Sound familiar?
# Here's a plot(image-26.png) to show what we mean. The shaded portion represents 5% of the area under the curve and those X values in it are those for which the probability that X>C is 5%.

# The shaded portion represents 5% of the area under this normal density curve. Which expression represents the smallest value X for which the area is shaded, assuming this is standard normal?
# Ans: qnorm(.95)

# The 95th percentile of a standard normal distribution is 1.645 standard deviations from the mean, so in our example we have to set C to be 1.645 standard deviations MORE than our hypothesized mean of 30, that is, C = 30 + 1.645 * 1 = 31.645 (recall that the variance and standard deviation equalled 1).
# This means that if our OBSERVED (sample) mean X' >= C, then it's only a 5% chance that a random draw from this N(30,1) distribution is larger than C.

# Recall that our observed mean X' is 32 which is greater than C=31.645, so it falls in that 5% region. What do we do with H_0?
# Ans: reject it

# So the rule "Reject H_0 when the sample mean X' >= 31.645" has the property that the probability of rejecting H_0 when it is TRUE is 5% given the model of this example - hypothesized mean mu=30, variance=1 and n=100.
# Instead of computing a constant C as a cutpoint for accepting or rejecting the null hypothesis, we can simply compute a Z score, the number of standard deviations the sample mean is from the hypothesized mean. We can then compare it to quantile determined by alpha.
# How do we do this? Compute the distance between the two means (32-30) and divide by the standard error of the mean, that is (s/sqrt(n)).

# Q: What is the Z score for this example? Recall the Z score is X'-mu divided by the standard error of the mean. In this example X'=32, mu=30 and the standard error is 10/sqrt(100)=1.
> 32-30/1
# [1] 2

# Q: The Z score is 2. The quantile is 1.645, so since 2>1.645. What do we do with H_0?
# Ans: reject it

#  The general rule for rejection is if sqrt(n) * ( X' - mu) / s > Z_{1-alpha}.
# Our test statistic is (X'-mu) / (s/sqrt(n)) which is standard normal.

# Q: This means that our test statistic has what mean and standard deviation?
# Ans: 0 and 1

# Let's review and expand. Our null hypothesis is that the population mean mu equals the value mu_0 and alpha=.05. (This is the probability that we reject H_0 if it's true.) We can have several different alternative hypotheses.
# Suppose our first alternative, H_a, is that mu < mu_0. We would reject H_0 (and accept H_a) when our observed sample mean is significantly less than mu_0. That is, our test statistic (X'-mu) / (s/sqrt(n)) is less than Z_alpha. Specifically, it is more than 1.64 standard deviations to the left of the mean mu_0.
# Here's a plot(image-27.png) to show what we mean. The shaded portion represents 5% of the area under the curve and those X values in it are those which are at least 1.64 standard deviations less than the mean. The probability of this is 5%. This means that if our sample mean fell in this area, we would reject a true null hypothesis, mu=mu_0, with probability 5%.

# Q:  We already covered the alternative hypothesis H_a that mu > mu_0 but let's review it. We would reject H_0 (and accept H_a) when our sample mean is what?
# Ans: significantly greater than mu_0

# Q:  This means that our test statistic (X'-mu) / (s/sqrt(n)) is what?
# Ans: at least 1.64 std dev greater than mu_0

# Here again is the plot(image-26.png) to show this. The shaded portion represents 5% of the area under the curve and those X values in it are those which are at least 1.64 standard deviations greater than the mean. The probability of this is 5%. This means that if our observed mean fell in this area we would reject a true null hypothesis, that mu=mu_0, with probability 5%.

# Finally, let's consider the alternative hypothesis H_a that mu is simply not equal to mu_0, the mean hypothesized by the null hypothesis H_0.  We would reject H_0 (and accept H_a) when our sample mean is significantly different than mu_0, that is, either less than OR greater than mu_0.
# Since we want to stick with a 5% rejection rate, we divide it in half and consider values at both tails, at the .025 and the .975 percentiles.  This means that our test statistic (X'-mu) / (s/sqrt(n)) is less than .025, Z_(alpha/2), or greater than .975, Z_(1-alpha/2).
# Here's the plot(image-28.png). As before, the shaded portion represents the 5% of the area composing the region of rejection. This time, though, it's composed of two equal pieces, each containing 2.5% of the area under the curve. The X values in the shaded portions are values which are at least 1.96 standard deviations away from the hypothesized mean.
# Notice that if we reject H_0, either it was FALSE (and hence our model is wrong and we are correct to reject it) OR H_0 is TRUE and we have made an error (Type I). The probability of this is 5%.
# Since our tests were based on alpha, the probability of a Type I error, we say that we "fail to reject H_0" rather than we "accept H_0". If we fail to reject H_0, then H_0 could be true OR we just might not have enough data to reject it.
# We have not fixed the probability of a type II error (accepting H_0 when it is false), which we call beta. The term POWER refers to the quantity 1-beta and it represents the probability of rejecting H_0 when it's false. This is used to determine appropriate sample sizes in experiments.

# Q: What do you think we call the region of values for which we reject H_0?
# Ans: the rejection region

# Note that so far we've been talking about NORMAL distributions and implicitly relying on the CENTRAL LIMIT THEOREM (CLT).

# Q: Remember the CLT. For a distribution to be approximated by a normal what does the sample size have to be?
# Ans: large

# No need to worry. If we don't have a large sample size, we can use the t distribution which conveniently uses the same test statistic (X'-mu) / (s/sqrt(n)) we used above.  That means that all the examples we just went through would work exactly the same EXCEPT instead of using NORMAL quantiles, we would use t quantiles and n-1 degrees of freedom.
# We said t distributions were very handy, didn't we?
# Let's go back to our sleep disorder example and suppose our sample size=16 (instead of 100). As before, (sample mean) X'=32, (standard deviation) s=10.  H_0 says the true mean mu=30, and H_a is that mu>30. With this smaller sample size we use the t test, but our test statistic is computed the same way, namely (X'-mu)/(s/sqrt(n))

# Q: What is the value of the test statistic (X'-mu)/(s/sqrt(n)) with sample size 16?
> (32-30)/(10/4)
# [1] 0.8

# Q:  How many degrees of freedom do we have with a sample size of 16?
# Ans: 15

# Q: Under H_0, the probability that the test statistic is larger than the 95th percentile of the t distribution is 5%. Use the R function qt with the arguments .95 and the correct number of degrees of freedom to find the quantile.
> qt(.95, 15)
# [1] 1.75305

# So the test statistic (.8) is less than 1.75, the 95th percentile of the t distribution with 15 df. This means that our sample mean (32) does not fall within the region of rejection since H_a was that mu>30.

# Q: This means what?
# Ans: we fail to reject H_0

# Now let's consider a two-sided test. Suppose that we would reject the null hypothesis if in fact the sample mean was too large or too small. That is, we want to test the alternative H_a that mu is not equal to 30. We will reject if the test statistic, 0.8, is either too large or too small.
# As we discussed before, we want the probability of rejecting under the null to be 5%, split equally as 2.5% in the upper tail and 2.5% in the lower tail. Thus we reject if our test statistic is larger than qt(.975, 15) or smaller than qt(.025, 15).

# Q: Do you expect qt(.975,15) to be bigger or smaller than qt(.95,15)?
# Ans: bigger

# Q: Since the test statistic was smaller than qt(.95,15) will it be bigger or smaller than qt(.975,15)?
# Ans: smaller

# Q: Now for the left tail, qt(.025,15). What can we say about it?
# Ans: it is less than 0

# Bottom line here is if you fail to reject the one sided test, you know that you will fail to reject the two sided.

# Q: So the test statistic .8 failed both sides of the test. That means we ?
# Ans: fail to reject H_0

#  Now we usually don't have to do all this computation ourselves because R provides the function t.test which happily does all the work! To prove this, we've provided a csv file with the father_son height data from John Verzani's UsingR website (http://wiener.math.csi.cuny.edu/UsingR/) and read it into a data structure fs for you. We'll do a t test on this paired data to see if fathers and sons have similar heights (our null hypothesis).

# Look at the dimensions of fs now using the R function dim.
> dim(fs)
# [1] 1078    2

# So fs has 1078 rows and 2 columns. The columns, fheight and sheight, contain the heights of a father and his son. Obviously there are 1078 such pairs. We can run t.test on this data in one of two ways. First, we can run it with just one argument, the difference between the heights, say fs$sheight-fs$fheight. OR we can run it with three arguments, the two heights plus the paired argument set to TRUE. Run t.test now using whichever way you prefer.
> t.test(fs$sheight, fs$fheight, paired = TRUE)
# Paired t-test
# data:  fs$sheight and fs$fheight
# t = 11.789, df = 1077, p-value < 2.2e-16
# alternative hypothesis: true difference in means is not equal to 0
# 95 percent confidence interval:
#   0.8310296 1.1629160
# sample estimates:
#   mean of the differences 
# 0.9969728 

# Q: The test statistic is what?
# Ans: 11.7885

# So the test statistic is 11.79 which is quite large so we REJECT the null hypothesis that the true mean of the difference was 0 (if you ran the test on the difference sheight-fheight) or that the true difference in means was 0 (if you ran the test on the two separate but paired columns).

# Q: The test statistic tell us what?
# Ans: the number of estimated std errors between the sample and hypothesized means

# We can test this by multiplying the t statistic (11.7885) by the standard deviation of the data divided by the square root of the sample size. Specifically run 11.7885 * sd(fs$sheight-fs$fheight)/sqrt(1078).
> 11.7885 * sd(fs$sheight-fs$fheight)/sqrt(1078)
# [1] 0.9969686

# This should give you a close match to the mean of x which t.test gave you, 0.9969728.
# Note the 95% confidence interval, 0.8310296 1.1629160, returned by t.test. It does not contain the hypothesized population mean 0 so we're pretty confident we can safely reject the hypothesis. This tells us that either our hypothesis is wrong or we're making a mistake (Type 1) in rejecting it.
# You've probably noticed the strong similarity between the confidence intervals we studied in the last lesson and these hypothesis tests. That's because they're equivalent!
# If you set alpha to some value (say .05) and ran many tests checking alternative hypotheses against H_0, that mu=mu_0, the set of all possible values for which you fail to reject H_0 forms the (1-alpha)% (that is 95%) confidence interval for mu_0.
# Similarly, if a (1-alpha)% interval contains mu_0, then we fail to reject H_0.
# Let's see how hypothesis testing works with binomial distributions by considering the example from the slides. A family has 8 children, 7 of whom are girls and none are twins. Let the null hypothesis be that either gender is equally likely, like an iid coin flip.
# So our H_0 is that p=.5, where p is the probability of a girl. We want to see if we should reject H_0 based on this sample of size 8. Our H_a is that p>.5, so we'll do a one-sided test, i.e., look at only the right tail of the distribution.
# Let's set alpha, the level of our test, to .05 and find the probabilities associated with different rejection regions, where a rejection region i has at least i-1 girls out of a possible 8.

# We've defined for you a 9-long vector, mybin, which shows nine probabilities, the i-th of which is the probability that there are at least i-1 girls out of the 8 possible children. Look at mybin now.
> mybin
# [1] 1.00000000 0.99609375 0.96484375 0.85546875 0.63671875 0.36328125 0.14453125
# [8] 0.03515625 0.00390625

