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
