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
