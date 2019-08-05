1: Principles of Analytic Graphs

# Graphs give us a visual form of data, and the first principle of analytic graphs is to show some comparison. You'll hear more about this when you study statistical inference (another great course BTW), but evidence for a hypothesis is always relative to another competing or alternative hypothesis.



# When presented with a claim that something is good, you should always ask "Compared to What?" This is why in commercials you often hear the phrase "other leading brands". An implicit comparison, right?

# the first principle was to show a comparison. The second principle is to show causality or a mechanism of how your theory of the data works. This explanation or systematic structure shows your causal framework for thinking about the question you're trying to answer.

# Exploratory graphs serve mostly the same functions as graphs. They help us find patterns in data and understand its properties. They suggest modeling strategies and help to debug analyses. We DON'T use exploratory graphs to communicate results.

# Instead, exploratory graphs are the initial step in an investigation, the "quick and dirty" tool used to point the data scientist in a fruitful direction. A scientist might need to make a lot of exploratory graphs in order to develop a personal understanding of the problem being studied. Plot details such as axes, legends, color and size are cleaned up later to convey more information in an aesthetically pleasing way.

> head(pollution)
# pm25  fips region longitude latitude
# 1  9.771185 01003   east -87.74826 30.59278
# 2  9.993817 01027   east -85.84286 33.26581
# 3 10.688618 01033   east -87.72596 34.73148
# 4 11.337424 01049   east -85.79892 34.45913
# 5 12.119764 01055   east -86.03212 34.01860
# 6 10.827805 01069   east -85.35039 31.18973

> dim(pollution)
# [1] 576   5


# boxplot
# The "whiskers" of the box (the vertical lines extending above and below the box) relate to the range parameter of boxplot, which we let default to the value 1.5 used by R. The height of the box is the interquartile range, the difference between the 75th and 25th quantiles. In this case that difference is 2.8. The whiskers are drawn to be a length of range*2.8 or 1.5*2.8. This shows us roughly how many, if any, data points are outliers, that is, beyond this range of values
# abline adds one or more straight lines through the current plot.
> boxplot(ppm)
> abline(h = 12)

# We use the R formula y ~ x to show that y (in this case pm25) depends on x (region).
> boxplot(pm25 ~ region, data=pollution, col="red")
# Note that boxplot, unlike hist, did NOT specify a title and axis labels for you automatically.

# histogram

> hist(ppm)
> abline(v=median(ppm), col="magenta", lwd=4)

> hist(ppm)
> rug(ppm)
# This one-dimensional plot, with its grayscale representation, gives you a little more detailed information about how many data points are in each bucket and where they lie within the bucket.

# So this histogram(with parameter breaks=100) with more buckets is not nearly as smooth as the preceding one. In fact, it's a little too noisy to see the distribution clearly. When you're plotting histograms you might have to experiment with the argument breaks to get a good idea of your data's distribution.





# we can plot multiple histograms in one plot, though to do this we have to use more than one R command. First we have to set up the plot window with the R command par which specifies how we want to lay out the plots, say one above the other. We also use par to specify margins, a 4-long vector which indicates the number of lines for the bottom, left, top and right.
> par(mfrow=c(2,1), mar=c(4,4,2,1))
# So we set up the plot window for two rows and one column with the mfrow argument. The mar argument set up the margins.
> hist(pollution$pm25, col="green")
# See? The command par told R we were going to have one column with 2 rows, so it placed this histogram in the top position.

# We've seen that we can use a function call as an argument when calling another function. We'll do this again when we call plot with the arguments latitude and pm25 which are both from our data frame pollution. We'll call plot from inside the R command with which evaluates "an R expression in an environment constructed from data". We'll use pollution as the first argument to with and the call to plot as the second. This allows us to avoid typing "pollution$" before the arguments to plot, so it saves us some typing and adds to your base of R knowledge.
> with(pollution, plot(latitude, pm25))
# Note that the first argument is plotted along the x-axis and the second along the y. Now use abline to add a horizontal line at 12. Use two additional arguments, lwd equal to 2 and lty also equal to 2
> abline(h=12, lwd=2, lty=2)
# see how lty=2 made the line dashed?




# Let's plot two scatterplots distinguished by region.
# As we did with multiple histograms, we first have to set up the plot window with the R command par. This time, let's plot the scatterplots side by side (one row and two columns). We also need to use different margins. Type the R command par(mfrow = c(1, 2), mar = c(5, 4, 2, 1)) now. Don't expect to see any new result.
> par(mfrow=c(1,2), mar=c(5,4,2,1))
> west <- subset(pollution, region == "west")
> plot(west$latitude, west$pm25, main = "West")
> plot(east$latitude, east$pm25, main = "East")


##########################
3: Graphics Devices in R #
##########################
# Slides for this and other Data Science courses may be found at github https://github.com/DataScienceSpecialization/courses/. If you care to use them, they must be downloaded as a zip file and viewed locally. This lesson corresponds to 04_ExploratoryAnalysis/Graphics_Devices_in_R

# Would you believe that it is something where you can make a plot appear, either a screen device, such as a window on your computer, OR a file device?
# There are several different kinds of file devices with particular characteristics and hence uses. These include PDF, PNG, JPEG, SVG, and TIFF.
# To be clear, when you make a plot in R, it has to be "sent" to a specific graphics device. Usually this is the screen (the default device), especially when you're doing exploratory work. You'll send your plots to files when you're ready to publish a report, make a presentation, or send info to colleagues.
# How you access your screen device depends on what computer system you're using. On a Mac the screen device is launched with the call quartz(), on Windows you use the call windows(), and on Unix/Linux x11().  On a given platform (Mac, Windows, Unix/Linux) there is only one screen device.

# The second way to create a plot is to send it to a file device. Depending on the type of plot you're making, you explicitly launch a graphics device, e.g., a pdf file. Type the command pdf(file="myplot.pdf") to launch the file device. This will create the pdf file myplot.pdf in your working directory.
> pdf(file = "myplot.pdf")
> with(faithful, plot(eruptions, waiting))
> title(main = "Old Faithful Geyser data")
> dev.off() # This is very important!

# There are two basic types of file devices, vector and bitmap devices. These use different formats and have different characteristics. Vector formats are good for line drawings and plots with solid colors using a modest number of points, while bitmap formats are good for plots with a large number of points, natural scenes or web-based plots.

# We'll mention 4 specific vector formats. The first is pdf. This is useful for line-type graphics and papers. It resizes well, is usually portable, but it is not efficient if a plot has many objects/points.
# The second is svg which is XML-based, scalable vector graphics. This supports animation and interactivity and is potentially useful for web-based plots.
# The last two vector formats are win.metafile, a Windows-only metafile format, and postscript (ps), an older format which also resizes well, is usually portable, and can be used to create encapsulated postscript files. Unfortunately, Windows systems often don’t have a postscript viewer.


# We'll also mention 4 different bitmap formats. The first is png (Portable Network Graphics) which is good for line drawings or images with solid colors. It uses lossless compression (like the old GIF format), and most web browsers can read this format natively. In addition, png is good for plots with many points, but it does not resize well.
# In contrast, jpeg files are good for photographs or natural scenes. They use lossy compression, so they're good for plots with many points. Files in jpeg format don't resize well, but they can be read by almost any computer and any web browser. They're not great for line drawings.
# The last two bitmap formats are tiff, an older lossless compression meta-format and bmp which is a native Windows bitmapped format.



# Although it is possible to open multiple graphics devices (screen, file, or both), when viewing multiple plots at once, plotting can only occur on one graphics device at a time.

# The currently active graphics device can be found by calling dev.cur(). try it to see what number is assigned to your pdf device.
# The device is back to what it was when you started. As you might have guessed, every open graphics device is assigned an integer greater than or equal to 2. You can change the active graphics device with dev.set(<integer>) where <integer> is the number associated with the graphics device you want to switch to.
# You can also copy a plot from one device to another. This can save you some time but beware! Copying a plot is not an exact operation, so the result may not be identical to the original. R provides some functions to help you do this. The function dev.copy copies a plot from one device to another, and dev.copy2pdf specifically copies a plot to a PDF file.



4: Plotting Systems 
# Slides for this and other Data Science courses may be found at github https://github.com/DataScienceSpecialization/courses/. If you care to use them, they must be downloaded as a zip file and viewed locally. This lesson corresponds to 04_ExploratoryAnalysis/PlottingSystems

# In this lesson, we'll give you a brief overview of the three plotting systems in R, their differences, strengths, and weaknesses. We'll only cover the basics here to give you a general idea of the systems and in later lessons we'll cover each system in more depth.
# The first plotting system is the Base Plotting System which comes with R. It's the oldest system which uses a simple "Artist's palette" model. What this means is that you start with a blank canvas and build your plot up from there, step by step.
# Usually you start with a plot function (or something similar), then you use annotation functions to add to or modify your plot. R provides many annotating functions such as text, lines, points, and axis. R provides documentation for each of these. They all add to an already existing plot.
# disadvantage of the Base Plotting System: You can't go back once a plot has started

> with(cars, plot(speed, dist))
> text(mean(cars$speed), max(cars$dist), "SWIRL rules!")


# Now we'll move on to the second plotting system, the Lattice System which comes in the package of the same name. Unlike the Base System, lattice plots are created with a single function call such as xyplot or bwplot. Margins and spacing are set automatically because the entire plot is specified at once.
# The lattice system is most useful for conditioning types of plots which display how y changes with x across levels of z. The variable z might be a categorical variable of your data. This system is also good for putting many plots on a screen at once.
# The lattice system has several disadvantages. First, it is sometimes awkward to specify an entire plot in a single function call. Annotating a plot may not be especially intuitive. Second, using panel functions and subscripts is somewhat difficult and requires preparation. Finally, you cannot "add" to the plot once it is created as you can with the base system.

# Let's use the lattice command xyplot to see how life expectancy varies with income in each of the four regions.
# To do this we'll give xyplot 3 arguments. The first is the most complicated. It is this R formula, Life.Exp ~ Income  region, which indicates we're plotting life expectancy as it depends on income for each region. The second argument, data, is set equal to state. This allows us to use "Life.Exp" and "Income" in the formula instead of specifying the dataset state for each term (as in state$Income). The third argument, layout, is set equal to the two-long vector c(4,1). Run xyplot now with these three arguments.
# No need for you to worry about margins or labels. The package took care of all that for you.
> xyplot(Life.Exp ~ Income | region, data= state, layout = c(4,1))
> xyplot(Life.Exp ~ Income | region, data= state, layout = c(2,2))


# Now for the last plotting system, ggplot2, which is a hybrid of the base and lattice systems. It automatically deals with spacing, text, titles (as Lattice does) but also allows you to annotate by "adding" to a plot (as Base does), so it's the best of both worlds.
# Although ggplot2 bears a superficial similarity to lattice, it's generally easier and more intuitive to use. Its default mode makes many choices for you but you can still customize a lot. The package is based on a "grammar of graphics" (hence the gg in the name), so you can control the aesthetics of your plots. For instance, you can plot conditioning graphs and panel plots as we did in the lattice example.


5: Base Plotting System
# Slides for this and other Data Science courses may be found at github https://github.com/DataScienceSpecialization/courses/. If you care to use them, they must be downloaded as a zip file and viewed locally. This lesson corresponds to 04_ExploratoryAnalysis/PlottingBase
# The core plotting and graphics engine in R is encapsulated in two packages. The first is the graphics package which contains plotting functions for the "base" system. The functions in this package include plot, hist, boxplot, barplot, etc. The second package is grDevices which contains all the code implementing the various graphics devices, including X11, PDF, PostScript, PNG, etc.
# Base graphics are often constructed piecemeal, with each aspect of the plot handled separately through a particular function call. Usually you start with a plot function (such as plot, hist, or boxplot), then you use annotation functions (text, abline, points) to add to or modify your plot.
# Before making a plot you have to determine where the plot will appear and what it will be used for.  Is there a large amount of data going into the plot? Or is it just a few points? Do you need to be able to dynamically resize the graphic?
# The base system is very intuitive and easy to use. but you can't go backwards, though, say, if you need to readjust margins or have misspelled a caption. A finished plot will be a series of R commands, so it's difficult to translate a finished plot into a different system.
# Calling a basic routine such as plot(x, y) or hist(x) launches a graphics device (if one is not already open) and draws a new plot on the device. If the arguments to plot or hist are not of some special class, then the default method is called.


> boxplot(Ozone ~ Month, data = airquality, xlab = "Month", ylab = "Ozone (ppb)", col.axis = "blue", col.lab = "red")
> title(main="Ozone and Wind in New York City")

# Scatterplot
> with(airquality, plot(Wind, Ozone))
# Note that plot generated labels for the x and y axes but no title.
> title(main = "Ozone and Wind in New York City")

# To see just how much flexibility you have, run the R command length with the argument par() now.
> length(par())
# [1] 72

# So there are a boatload (72) of parameters that par() gives you access to. Run the R function names with par() as its argument to see what these parameters are.
names(par())
# [1] "xlog"      "ylog"      "adj"       "ann"       "ask"       "bg"        "bty"      
# [8] "cex"       "cex.axis"  "cex.lab"   "cex.main"  "cex.sub"   "cin"       "col"      
# [15] "col.axis"  "col.lab"   "col.main"  "col.sub"   "cra"       "crt"       "csi"      
# [22] "cxy"       "din"       "err"       "family"    "fg"        "fig"       "fin"      
# [29] "font"      "font.axis" "font.lab"  "font.main" "font.sub"  "lab"       "las"      
# [36] "lend"      "lheight"   "ljoin"     "lmitre"    "lty"       "lwd"       "mai"      
# [43] "mar"       "mex"       "mfcol"     "mfg"       "mfrow"     "mgp"       "mkh"      
# [50] "new"       "oma"       "omd"       "omi"       "page"      "pch"       "pin"      
# [57] "plt"       "ps"        "pty"       "smo"       "srt"       "tck"       "tcl"      
# [64] "usr"       "xaxp"      "xaxs"      "xaxt"      "xpd"       "yaxp"      "yaxs"     
# [71] "yaxt"      "ylbias"   

> par()$pin
# [1] 7.530833 4.160000
# Plot dimensions in inches


> par()$fg
# [1] "black"
# specifies foreground color

# The plot character default is the open circle, but it "can either be a single character or an integer code for one of a set of graphics symbols." Run the command par("pch") to see the integer value of the default. When you need to, you can use R's Documentation (?pch) to find what the other values mean.
> par("pch")
# [1] 1

lty # line type
lwd # line width

> par("lty")
# [1] "solid"

# So the default line type is solid, but it can be dashed, dotted, etc. Once again, R's ?par documentation will tell you what other line types are available. The line width is a positive integer; the default value is 1.

# The par() function is used to specify global graphics parameters that affect all plots in an R session. (Use dev.off or plot.new to reset to the defaults.) These parameters can be overridden when specified as arguments to specific plotting functions. These include las (the orientation of the axis labels on the plot), bg (background color), mar (margin size), oma (outer margin size), mfrow and mfcol (number of plots per row, column).

# The last two, mfrow and mfcol, both deal with multiple plots in that they specify the number of plots per row and column. The difference between them is the order in which they fill the plot matrix. The call mfrow will fill the rows first while mfcol fills the columns first.

# So you can add text, title, points, and lines to an existing plot. To add lines, you give a vector of x values and a corresponding vector of y values (or a 2-column matrix); the function lines just connects the dots. The function text adds text labels to a plot using specified x, y coordinates.

# The function title adds annotations. These include x- and y- axis labels, title, subtitle, and outer margin. Two other annotating functions are mtext which adds arbitrary text to either the outer or inner margins of the plot and axis which adds axis ticks and labels. Another useful function is legend which explains to the reader what the symbols your plot uses mean.

# let's test your ability to make a somewhat complicated scatterplot. First run plot with 3 arguments. airquality$Wind, airquality$Ozone, and type set equal to "n". This tells R to set up the plot but not to put the data in it.
> plot(airquality$Wind, airquality$Ozone, type = "n")
# Now for the test. (You might need to check R's documentation for some of these.) Add a title with the argument main set equal to the string "Wind and Ozone in NYC"
> title(main = "Wind and Ozone in NYC")
# Now create a variable called may by subsetting airquality appropriately. (Recall that the data specifies months by number and May is the fifth month of the year.)
> may <- subset(airquality, Month == 5)
# Now use the R command points to plot May's wind and ozone (in that order) as solid blue triangles. You have to set the color and plot character with two separate arguments. Note we use points because we're adding to an existing plot.
> points(may$Wind,may$Ozone,col="blue",pch=17)


# Now create the variable notmay by subsetting airquality appropriately.
> notmay <- subset(airquality, Month != 5)
# Now use the R command points to plot these notmay's wind and ozone (in that order) as red snowflakes.
> points(notmay$Wind,notmay$Ozone,col="red",pch=8)

# Now we'll use the R command legend to clarify the plot and explain what it means. The function has a lot of arguments, but we'll only use 4. The first will be the string "topright" to tell R where to put the legend. The remaining 3 arguments will each be 2-long vectors created by R's concatenate function, e.g., c(). These arguments are pch, col, and legend. The first is the vector (17,8), the second ("blue","red"), and the third ("May","Other Months").
> legend("topright", pch = c(17,8), col=c("blue", "red"), legend = c("May","Other Months"))
# Now add a vertical line at the median of airquality$Wind. Make it dashed (lty=2) with a width of 2.
> abline(v = median(airquality$Wind), lty=2, lwd=2)
# Use par with the parameter mfrow set equal to the vector (1,2) to set up the plot window for two plots side by side
> par(mfrow=c(1,2))
# Now plot airquality$Wind and airquality$Ozone and use main to specify the title "Ozone and Wind".
> plot(airquality$Wind, airquality$Ozone, main = "Ozone and Wind")
# Plot airquality$Ozone and airquality$Solar.R and use main to specify the title "Ozone and Solar Radiation".
> plot(airquality$Ozone, airquality$Solar.R, main="Ozone and Solar Radiation")



# Now for something more challenging.
# This one with 3 plots, to illustrate inner and outer margins.
> par(mfrow = c(1, 3), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))

# Margins are specified as 4-long vectors of integers. Each number tells how many lines of text to leave at each side. The numbers are assigned clockwise starting at the bottom. The default for the inner margin is c(5.1, 4.1, 4.1, 2.1) so you can see we reduced each of these so we'll have room for some outer text.

# Plot airquality$Wind and airquality$Ozone with the title (argument main) as "Ozone and Wind".
plot(airquality$Wind, airquality$Ozone, main = "Ozone and Wind")
plot(airquality$Solar.R, airquality$Ozone, main = "Ozone and Solar Radiation")
plot(airquality$Temp, airquality$Ozone, main = "Ozone and Temperature")

# Now we'll put in a title.
mtext("Ozone and Weather in New York City", outer = TRUE)

##############################################################################################
6: Lattice Plotting System                                                                   #
##############################################################################################
# Slides for this and other Data Science courses may be found at github https://github.com/DataScienceSpecialization/courses/. If you care to use them, they must be downloaded as a zip file and viewed locally. This lesson corresponds to 04_ExploratoryAnalysis/PlottingLattice
# The lattice plotting system is completely separate and independent of the base plotting system. It's an add-on package so it has to be explicitly loaded with a call to the R function library. We've done this for you. The R Documentation tells us that lattice "is an implementation of Trellis graphics for R. It is a powerful and elegant high-level data visualization system with an emphasis on multivariate data."
# Lattice is implemented using two packages. The first is called, not surprisingly, lattice, and it contains code for producing Trellis graphics. Some of the functions in this package are the higher level functions which you, the user, would call. These include xyplot, bwplot, and levelplot.
# The second package in the lattice system is grid which contains the low-level functions upon which the lattice package is built. You, the user, seldom call functions from the grid package directly.
# Unlike base plotting, the lattice system does not have a "two-phase" aspect with separate plotting and annotation. Instead all plotting and annotation is done at once with a single function call.
# The lattice system, as the base does, provides several different plotting functions. These include xyplot for creating scatterplots, bwplot for box-and-whiskers plots or boxplots, and histogram for histograms. There are several others (stripplot, dotplot, splom and levelplot), which we won't cover here.
# Lattice functions generally take a formula for their first argument, usually of the form y ~ x. This indicates that y depends on x, so in a scatterplot y would be plotted on the y-axis and x on the x-axis.
# Here's an example of typical lattice plot call, xyplot(y ~ x  f * g, data). The f and g represent the optional conditioning variables. The * represents interaction between them. Remember when we said that lattice is good for plotting multivariate data? That's where these conditioning variables come into play.
# The second argument is the data frame or list from which the variables in the formula should be looked up.  If no data frame or list is passed, then the parent frame is used. If no other arguments are passed, the default values are used.
> xyplot(Ozone ~ Wind, data = airquality)
#  Look vaguely familiar? The dots are blue, instead of black, but lattice labeled the axes for you. You can use some of the same graphical parameters (e.g., pch and col) that you used in the base package in calls to lattice functions.

> xyplot(Ozone ~ Wind, data = airquality, pch=8, col="red", main="Big Apple Data")


> xyplot(Ozone ~ Wind | as.factor(Month), data = airquality, layout = c(5,1))
# here xyplot Displayed and labeled each subplot with the month's integer
# Since Month is a named column of the airquality dataframe we had to tell R to treat it as a factor.

# Lattice functions behave differently from base graphics functions in one critical way. Recall that base graphics functions plot data directly to the graphics device (e.g., screen, or file such as a PDF file). In contrast, lattice graphics functions return an object of class trellis.
# The print methods for lattice functions actually do the work of plotting the data on the graphics device. They return "plot objects" that can be stored (but it’s usually better to just save the code and data). On the command line, trellis objects are auto-printed so that it appears the function is plotting the data.
> p <- xyplot(Ozone ~ Wind, data=airquality)
> p # for print the plot

> names(p)
# [1] "formula"           "as.table"          "aspect.fill"       "legend"           
# [5] "panel"             "page"              "layout"            "skip"             
# [9] "strip"             "strip.left"        "xscale.components" "yscale.components"
# [13] "axis"              "xlab"              "ylab"              "xlab.default"     
# [17] "ylab.default"      "xlab.top"          "ylab.right"        "main"             
# [21] "sub"               "x.between"         "y.between"         "par.settings"     
# [25] "plot.args"         "lattice.options"   "par.strip.text"    "index.cond"       
# [29] "perm.cond"         "condlevels"        "call"              "x.scales"         
# [33] "y.scales"          "panel.args.common" "panel.args"        "packet.sizes"     
# [37] "x.limits"          "y.limits"          "x.used.at"         "y.used.at"        
# [41] "x.num.limit"       "y.num.limit"       "aspect.ratio"      "prepanel.default" 
# [45] "prepanel"   

> p[["formula"]]
# Ozone ~ Wind

> p[["x.limits"]]
# [1]  0.37 22.03

# let's talk about lattice's panel functions which control what happens inside each panel of the plot. The ease of making multi-panel plots makes lattice very appealing. The lattice package comes with default panel functions, but you can customize what happens in each panel.
# Panel functions receive the x and y coordinates of the data points in their panel (along with any optional arguments).







7: Working with Colors
# Slides for this and other Data Science courses may be found at github https://github.com/DataScienceSpecialization/courses/. If you care to use them, they must be downloaded as a zip file and viewed locally. This lesson corresponds to 04_ExploratoryAnalysis/Colors
# This lesson is about using colors in R.

# these(white, red, green) are the first 3 default color values. If you were plotting and just specified col=c(1:3) as one of your arguments, these are colors you'd get.
# we'll first discuss some functions that the grDevices package offers. The function colors() lists the names of 657 predefined colors you can use in any plotting function.  These names are returned as strings.

> sample(colors(), 10)
# [1] "sienna4"     "grey59"      "skyblue"     "gray76"     
# [5] "darkorchid3" "darkcyan"    "grey94"      "gray40"     
# [9] "chocolate3"  "chartreuse" 

# two additional functions from grDevices, colorRamp and colorRampPalette, give you more options. Both of these take color names as arguments and use them as "palettes", that is, these argument colors are blended in different proportions to form new colors.
# The first, colorRamp, takes a palette of colors (the arguments) and returns a function that takes values between 0 and 1 as arguments. The 0 and 1 correspond to the extremes of the color palette. Arguments between 0 and 1 return blends of these extremes.
> pal <- colorRamp(c("red", "blue"))
# We don't see any output, but R has created the function pal which we can call with a single argument between 0 and 1.
> pal(0)
# [,1] [,2] [,3]
# [1,]  255    0    0

# We see a 1 by 3 array with 255 as the first entry and 0 in the other 2. This 3 long vector corresponds to red, green, blue (RGB) color encoding commonly used in televisions and monitors. In R, 24 bits are used to represent colors. Think of these 24 bits as 3 sets of 8 bits, each of which represents an intensity for one of the colors red, green, and blue.
# The 255 returned from the pal(0) call corresponds to the largest possible number represented with 8 bits, so the vector (255,0,0) contains only red (no green or blue), and moreover, it's the highest possible value of red.

> pal(1)
# [,1] [,2] [,3]
# [1,]    0    0  255

# You see the vector (0,0,255) which represents the highest intensity of blue.

> pal(0.5)
# [,1] [,2] [,3]
# [1,]    127.5    0  127.5

# The function pal can take more than one argument. It returns one 3-long (or 4-long, but more about this later) vector for each argument.
> pal(seq(0,1,len=6))
# [,1] [,2] [,3]
# [1,]  255    0    0
# [2,]  204    0   51
# [3,]  153    0  102
# [4,]  102    0  153
# [5,]   51    0  204
# [6,]    0    0  255
# Six vectors (each of length 3) are returned. The i-th vector is identical to output that would be returned by the call pal(i/5) for i=0,...5. We see that the i-th row (for i=1,...6) differs from the (i-1)-st row in the following way. Its red entry is 51 = 255/5 points lower and its blue entry is 51 points higher.

# So pal creates colors using the palette we specified when we called colorRamp. In this example none of pal's outputs will ever contain green since it wasn't in our initial palette.



# We'll turn now to colorRampPalette, a function similar to colorRamp. It also takes a palette of colors and returns a function. This function, however, takes integer arguments (instead of numbers between 0 and 1) and returns a vector of colors each of which is a blend of colors of the original palette.
# The argument you pass to the returned function specifies the number of colors you want returned. Each element of the returned vector is a 24 bit number, represented as 6 hexadecimal characters, which range from 0 to F. This set of 6 hex characters represents the intensities of red, green, and blue, 2 characters for each color.

p1 <- colorRampPalette(c("red", "blue"))
> p1(2)
# [1] "#FF0000" "#0000FF"
# We see a 2-long vector is returned. The first entry FF0000 represents red. The FF is hexadecimal for 255, the same value returned by our call pal(0). The second entry 0000FF represents blue, also with intensity 255.

> p1(6)
# [1] "#FF0000" "#CC0033" "#990066" "#650099" "#3200CC" "#0000FF"
# Now we get the 6-long vector (FF0000, CC0033, 990066, 650099, 3200CC, 0000FF). We see the two ends (FF0000 and 0000FF) are consistent with the colors red and blue. How about CC0033? Type 0xcc or 0xCC at the command line to see the decimal equivalent of this hex number. You must include the 0 before the x to specify that you're entering a hexadecimal number.
> 0xcc
# [1] 204
# So 0xCC equals 204 and we can easily convert hex 33 to decimal, as in 0x33=3*16+3=51. These were exactly the numbers we got in the second row returned from our call to pal(seq(0,1,len=6)). We see that 4 of the 6 numbers agree with our earlier call to pal. Two of the 6 differ slightly.


# We can also form palettes using colors other than red, green and blue.
> p2 <- colorRampPalette(c("red", "yellow"))
> p2(2)
# [1] "#FF0000" "#FFFF00"
# This will show us the two extremes of the blends of colors we'll get.
# Not surprisingly the first color we see is FF0000, which we know represents red. The second color returned, FFFF00, must represent yellow


# Let's now call p2 with the argument 10. This will show us how the two extremes, red and yellow, are blended together.
> p2(10)
# [1] "#FF0000" "#FF1C00" "#FF3800" "#FF5500" "#FF7100" "#FF8D00"
# [7] "#FFAA00" "#FFC600" "#FFE200" "#FFFF00"
# So we see the 10-long vector. For each element, the red component is fixed at FF, and the green component grows from 00 (at the first element) to FF (at the last).

# We mentioned before that colorRamp (and colorRampPalette) could return a 3 or 4 long vector of colors. We saw 3-long vectors returned indicating red, green, and blue intensities. What would the 4th entry be?
> p1
# function (n) 
# {
#   x <- ramp(seq.int(0, 1, length.out = n))
#   if (ncol(x) == 4L) 
#     rgb(x[, 1L], x[, 2L], x[, 3L], x[, 4L], maxColorValue = 255)
#   else rgb(x[, 1L], x[, 2L], x[, 3L], maxColorValue = 255)
# }
# <bytecode: 0x5625dc121ad8>
#   <environment: 0x5625d491dc00>

# We see that p1 is a short function with one argument, n. The argument n is used as the length in a call to the function seq.int, itself an argument to the function ramp. We can infer that ramp is just going to divide the interval from 0 to 1 into n pieces.

> ?rgb
...
# We see that rgb is a color specification function that can be used to produce any color with red, green, blue proportions. We see the maxColorValue is 1 by default, so if we called rgb with values for red, green and blue, we would specify numbers at most 1 (assuming we didn't change the default for maxColorValue).
# So the fourth argument is alpha which can be a logical, i.e., either TRUE or FALSE, or a numerical value.

> p3 <- colorRampPalette(c("blue", "green"), alpha = 0.5)
> p3(5)
# [1] "#0000FFFF" "#003FBFFF" "#007F7FFF" "#00BF3FFF" "#00FF00FF"
# We see that in the 5-long vector that the call returned, each element has 32 bits, 4 groups of 8 bits each. The last 8 bits represent the value of alpha. Since it was NOT ZERO in the call to colorRampPalette, it gets the maximum FF value. (The same result would happen if alpha had been set to TRUE.) When it was 0 or FALSE (as in previous calls to colorRampPalette) it was given the value 00 and wasn't shown. The leftmost 24 bits of each element are the same RGB encoding we previously saw.
# So what is alpha? Alpha represents an opacity level, that is, how transparent should the colors be. We can add color transparency with the alpha parameter to calls to rgb. We haven't seen any examples of this yet, but we will now.


> plot(x,y, pch = 19, col = rgb(0, 0.5, 0.5))
# Well this picture is okay for a scatterplot, a nice mix of blue and green, but it really doesn't tell us too much information in the center portion, since the points are so thick there. We see there are a lot of points, but is one area more filled than another? We can't really discriminate between different point densities. This is where the alpha argument can help us. Recall your plot command (use the up arrow) and add a 4th argument, .3, to the call to rgb. This will be our value for alpha.

> plot(x,y, pch = 19, col = rgb(0, 0.5, 0.5, 0.3))



# Our last topic for this lesson is the RColorBrewer Package, available on CRAN, that contains interesting and useful color palettes, of which there are 3 types, sequential, divergent, and qualitative. Which one you would choose to use depends on your data.


# These colorBrewer palettes can be used in conjunction with the colorRamp() and colorRampPalette() functions. You would use colors from a colorBrewer palette as your base palette,i.e., as arguments to colorRamp or colorRampPalette which would interpolate them to create new colors.

# As an example of this, create a new object, cols by calling the function brewer.pal with 2 arguments, 3 and "BuGn". The string "BuGn" is the second last palette in the sequential display. The 3 tells the function how many different colors we want.
> cols <- brewer.pal(3, "BuGn")
# We see 3 colors, mixes of blue and green. Now create the variable pal by calling colorRampPalette with cols as its argument.
> pal <- colorRampPalette(cols)
# The call showMe(pal(3)) would be identical to the showMe(cols) call.
# Now we can use the colors in pal(20) to display topographic information on Auckland's Maunga Whau Volcano. R provides this information in a matrix called volcano which is included in the package datasets.  Call the R function image with volcano as its first argument and col set equal to pal(20) as its second.
> image(volcano, col = pal(20))
# We see that the colors here of the sequential palette clue us in on the topography. The darker colors are more concentrated than the lighter ones. 

8: GGPlot2 Part1
# Slides for this and other Data Science courses may be found at github https://github.com/DataScienceSpecialization/courses/. If you care to use them, they must be downloaded as a zip file and viewed locally. This lesson corresponds to 04_ExploratoryAnalysis/ggplot2
#  In this lesson we'll focus on the third and newest plotting system in R, ggplot2.  As we did with the other two systems, we'll focus on creating graphics on the screen device rather than another graphics device.
# A grammar of graphics represents an abstraction of graphics, that is, a theory of graphics which conceptualizes basic pieces from which you can build new graphics and graphical objects. The goal of the grammar is to “Shorten the distance from mind to page”. From Hadley Wickham's book we learn that
# The ggplot2 package "is composed of a set of independent components that can be composed in many different ways. ... you can create new graphics that are precisely tailored for your problem." These components include aesthetics which are attributes such as colour, shape, and size, and geometric objects or geoms such as points, lines, and bars.# Yes, ggplot2 combines the best of base and lattice. It allows for multipanel (conditioning) plots (as lattice does) but also post facto annotation (as base does), so you can add titles and labels. It uses the low-level grid package (which comes with R) to draw the graphics. As part of its grammar philosophy, ggplot2 plots are composed of aesthetics (attributes such as size, shape, color) and geoms (points, lines, and bars), the geometric objects you see on the plot.
# The ggplot2 package has 2 workhorse functions. The more basic workhorse function is qplot, (think quick plot), which works like the plot function in the base graphics system. It can produce many types of plots (scatter, histograms, box and whisker) while hiding tedious details from the user. Similar to lattice functions, it looks for data in a data frame or parent environment.
# The more advanced workhorse function in the package is ggplot, which is more flexible and can be customized for doing things qplot cannot do. In this lesson we'll focus on qplot.

# see if there's a correlation between engine displacement (displ) and highway miles per gallon (hwy).
> qplot(displ, hwy, data = mpg)

# Now we want to do the same plot but this time use different colors to distinguish between the 3 factors (subsets) of different types of drive (drv) in the data (front-wheel, rear-wheel, and 4-wheel).
qplot(displ, hwy, data = mpg, color = drv)
# Pretty cool, right? See the legend to the right which qplot helpfully supplied? The colors were automatically assigned by qplot so the legend decodes the colors for you. Notice that qplot automatically used dots or points to indicate the data. These points are geoms (geometric objects). We could have used a different aesthetic, for instance shape instead of color, to distinguish between the drive types.

# Now add a second geom to the default points. How about some smoothing function to produce trend lines, one for each color?
> qplot(displ, hwy, data = mpg, color = drv, geom = c("point", "smooth"))
# Notice the gray areas surrounding each trend lines. These indicate the 95% confidence intervals for the lines.


> qplot(y=hwy, data = mpg, color=drv)
# What's this plot showing? We see the x-axis ranges from 0 to 250 and we remember that we had 234 data points in our set, so we can infer that each point in the plot represents one of the hwy values (indicated by the y-axis).
# Comparing the values of mpg$hwy with the plot, we see the first entries in the vector (29, 29, 31, 30,...) correspond to the leftmost points in the the plot (in order), and the last entries in myhigh (28, 29, 26, 26, 26) correspond to the rightmost plotted points. So, specifying the y parameter only, without an x argument, plots the values of the y argument in the order in which they occur in the data.


# The all-purpose qplot can also create box and whisker plots. Call qplot now with 4 arguments. First specify the variable by which you'll split the data, in this case drv, then specify the variable which you want to examine, in this case hwy. The third argument is data (set equal to mpg), and the fourth, the geom, set equal to the string "boxplot"
qplot(drv, hwy, data = mpg, geom = "boxplot")
# We see 3 boxes, one for each drive.


qplot(drv, hwy, data = mpg, geom = "boxplot", color = manufacture)
# It's a little squished but we just wanted to illustrate qplot's capabilities. Notice that there are still 3 regions of the plot (determined by the factor drv). Each is subdivided into several boxes depicting different manufacturers.



# Now, on to histograms
> qplot(hwy, data = mpg, fill = drv)
# See how qplot consistently uses the colors. Red (if 4-wheel drv is in the bin) is at the bottom of the bin, then green on top of it (if present), followed by blue (rear wheel drv). The color lets us see right away that 4-wheel drive vehicles in this dataset don't have gas mileages exceeding 30 miles per gallon.
# It's cool that qplot can do this so easily, but some people may find this multi-color histogram hard to interpret. Instead of using colors to distinguish between the drive factors let's use facets or panels. (That's what lattice called them.) This just means we'll split the data into 3 subsets (according to drive) and make 3 smaller individual plots of each subset in one plot (and with one call to qplot).
> qplot(displ, hwy, data = mpg, facets = . ~ drv)
# The fourth is the argument facets which will be set equal to the expression . ~ drv which is ggplot2's shorthand for number of rows (to the left of the ~) and number of columns (to the right of the ~). Here the . indicates a single row and drv implies 3, since there are 3 distinct drive factors.
# The result is a 1 by 3 array of plots. Note how each is labeled at the top with the factor label (4,f, or r). This shows us more detailed information than the histogram. We see the relationship between displacement and highway mileage for each of the 3 drive factors.

> qplot(hwy, data = mpg, facets = drv ~ ., binwidth = 2)




9: GGPlot2 Part2
# Slides for this and other Data Science courses may be found at github https://github.com/DataScienceSpecialization/courses/. If you care to use them, they must be downloaded as a zip file and viewed locally. This lesson corresponds to 04_ExploratoryAnalysis/ggplot2
# In a previous lesson we showed you the vast capabilities of qplot, the basic workhorse function of the ggplot2 package. In this lesson we'll focus on some fundamental components of the package. These underlie qplot which uses default values when it calls them. If you understand these building blocks, you will be better able to customize your plots. We'll use the second workhorse function in the package, ggplot, as well as other graphing functions.
# ggplot2 stands for "rammar of graphics", A "grammar" of graphics means that ggplot2 contains building blocks with which you can create your own graphical objects. What are these basic components of ggplot2 plots? There are 7 of them.
# Obviously, there's a DATA FRAME which contains the data you're trying to plot. Then the AESTHETIC MAPPINGS determine how data are mapped to color, size, etc. The GEOMS (geometric objects) are what you see in the plot (points, lines, shapes) and FACETS are the panels used in conditional plots. You've used these or seen them used in the first ggplot2 (qplot) lesson.
# There are 3 more. STATS are statistical transformations such as binning, quantiles, and smoothing which ggplot2 applies to the data. SCALES show what coding an aesthetic map uses (for example, male = red, female = blue). Finally, the plots are depicted on a COORDINATE SYSTEM. When you use qplot these were taken care of for you.
# As in the base plotting system (and in contrast to the lattice system), when building plots with ggplot2, the plots are built up in layers, maybe in several steps. You can plot the data, then overlay a summary (for instance, a regression line or smoother) and then add any metadata and annotations you need.

> qplot(displ, hwy, data = mpg, geom = c("point", "smooth"), facets = . ~ drv)
# We see a 3 facet plot, one for each drive type (4, f, and r). Now we'll see how ggplot works. We'll build up a similar plot using the basic components of the package. We'll do this in a series of steps.
g <- ggplot(mpg, aes(displ, hwy))
# Notice that nothing happened? As in the lattice system, ggplot created a graphical object which we assigned to the variable g.
> summary(g)
# data: manufacturer, model, displ, year, cyl, trans, drv, cty,
# hwy, fl, class [234x11]
# mapping:  x = ~displ, y = ~hwy
# faceting: <ggproto object: Class FacetNull, Facet, gg>
#   compute_layout: function
# draw_back: function
# draw_front: function
# draw_labels: function
# draw_panels: function
# finish_data: function
# init_scales: function
# map_data: function
# params: list
# setup_data: function
# setup_params: function
# shrink: TRUE
# train_scales: function
# vars: function
# super:  <ggproto object: Class FacetNull, Facet, gg>

# So g contains the mpg data with all its named components in a 234 by 11 matrix. It also contains a mapping, x (displ) and y (hwy) which you specified, and no faceting.
# Note that if you tried to print g with the expressions g or print(g) you'd get an error! Even though it's a great package, ggplot doesn't know how to display the data yet since you didn't specify how you wanted to see it. Now type g+geom_point()
> g + geom_point()
# By calling the function geom_point you added a layer. By not assigning the expression to a variable you displayed a plot. Notice that you didn't have to pass any arguments to the function geom_point. That's because the object g has all the data stored in it. (Remember you saw that when you ran summary on g before.) Now use the expression you just typed (g + geom_point()) and add to it another layer, a call to geom_smooth(). Notice the red message R gives you.
> g + geom_point() + geom_smooth()
# The gray shadow around the blue line is the confidence band. See how wide it is at the right? Let's try a different smoothing function.
> g + geom_point() + geom_smooth(method = "lm")
# By changing the smoothing function to "lm" (linear model) ggplot2 generated a regression line through the data.

> g + geom_point() + geom_smooth(method = "lm") + facet_grid(. ~ drv)
# Notice how each panel is labeled with the appropriate factor. All the data associated with 4-wheel drive cars is in the leftmost panel, front-wheel drive data is shown in the middle panel, and rear-wheel drive data in the rightmost. Notice that this is similar to the plot you created at the start of the lesson using qplot. (We used a different smoothing function than previously.)

# So far you've just used the default labels that ggplot provides. You can add your own annotation using functions such as xlab(), ylab(), and ggtitle(). In addition, the function labs() is more general and can be used to label either or both axes as well as provide a title.
> g + geom_point() + geom_smooth(method = "lm") + facet_grid(. ~ drv) + ggtitle("Swirl Rules!")

# Now that you've seen the basics we'll talk about customizing. Each of the “geom” functions (e.g., _point and _smooth) has options to modify it. Also, the function theme() can be used to modify aspects of the entire plot, e.g. the position of the legend. Two standard appearance themes are included in ggplot. These are theme_gray() which is the default theme (gray background with white grid lines) and theme_bw() which is a plainer (black and white) color scheme.
> g + geom_point(color = "pink", size = 4, alpha = 1/2)
# Notice the different shades of pink? That's the result of the alpha aesthetic which you set to 1/2. This aesthetic tells ggplot how transparent the points should be. Darker circles indicate values hit by multiple data points.

> g + geom_point(size = 4, alpha = 1/2, aes(color = drv))
# Note that you MUST use the function aes since the color of the points is data dependent and not a constant as it was in the previous example.
# Notice the helpful legend on the right decoding the relationship between color and drv.

# Now we'll practice modifying labels.
g + geom_point(aes(color = drv)) + labs(title = "Swirl Rules!") + labs (x = "Displacement", y = "Hwy Mileage")
# Note that you could have combined the two calls to the function labs in the previous example.

# Now we'll practice customizing the geom_smooth calls.
g + geom_point(aes(color = drv), size = 2, alpha = 1/2) + geom_smooth(size = 4, linetype = 3, method = "lm", se = FALSE)
# What did these arguments do? The method specified a linear regression (note the negative slope indicating that the bigger the displacement the lower the gas mileage), the linetype specified that it should be dashed (not continuous), the size made the dashes big, and the se flag told ggplot to turn off the gray shadows indicating standard errors (confidence intervals).

# Finally, let's do a simple plot using the black and white theme, theme_bw.
g + geom_point(aes(color = drv)) + theme_bw(base_family =  "Times")
# No more gray background! Also, if you have good eyesight, you'll notice that the font in the labels changed.

# One final note before we go through a more complicated, layered ggplot example, and this concerns the limits of the axes. We're pointing this out to emphasize a subtle difference between ggplot and the base plotting function plot.
> plot(myx, myy, type="l", ylim=c(-3, 3))
# The type="l" tells plot you want to display the data as a line instead of as a scatterplot.

# Notice how plot plotted the points in the (-3,3) range for y-values. The outlier at (50,100) is NOT shown on the line plot. Now we'll plot the same data with ggplot.
> g <- ggplot(testdat, aes(x = myx, y = myy))
> g + geom_line()
# Notice how ggplot DID display the outlier point at (50,100). As a result the rest of the data is smashed down so you don't get to see what the bulk of it looks like. The single outlier probably isn't important enough to dominate the graph. How do we get ggplot to behave more like plot in a situation like this?
> g + geom_line() + ylim(-3, 3)
# Notice that by doing this, ggplot simply ignored the outlier point at (50,100). There's a break in the line which isn't very noticeable. Now recall that at the beginning of the lesson we mentioned 7 components of a ggplot plot, one of which was a coordinate system. This is a situation where using a coordinate system would be helpful. Instead of adding ylim(-3,3) to the expression g+geom_line(), add a call to the function coord_cartesian with the argument ylim set equal to c(-3,3).
> g + geom_line() + coord_cartesian(ylim = c(-3, 3))
# See the difference? This looks more like the plot produced by the base plot function. The outlier y value at x=50 is not shown, but the plot indicates that it is larger than 3.

# We'll close with a more complicated example to show you the full power of ggplot and the entire ggplot2 package.
> g <- ggplot(mpg, aes(x = displ, y = hwy, color = factor(year)))
> g + geom_point()

# Let's make our display a 2 dimensional multi-panel plot.
> g + geom_point() + facet_grid(drv ~ cyl, margins = TRUE)
# A 4 by 5 plot, huh? The margins argument tells ggplot to display the marginal totals over each row and column, so instead of seeing 3 rows (the number of drv factors) and 4 columns (the number of cyl factors) we see a 4 by 5 display. Note that the panel in position (4,5) is a tiny version of the scatterplot of the entire dataset.

> g + geom_point() + facet_grid(drv ~ cyl, margins = TRUE) + geom_smooth(method = "lm", se = FALSE, size = 2, color = "black")

> g + geom_point() + facet_grid(drv ~ cyl, margins = TRUE) + geom_smooth(method = "lm", se = FALSE, size = 2, color = "black") + labs(x = "Displacement", y = "Highway Mileage", title = "Swirl Rules!")
# You could have done these labels with separate calls to labs but we thought you'd be sick of this by now.



##############################################################################
# 10: GGPlot2 Extras                                                         #
##############################################################################
# Slides for this and other Data Science courses may be found at github https://github.com/DataScienceSpecialization/courses/. If you care to use them, they must be downloaded as a zip file and viewed locally. This lesson corresponds to 04_ExploratoryAnalysis/ggplot2
# In this lesson we'll go through a few more qplot examples using diamond data which comes with the ggplot2 package

> qplot(price, data = diamonds)
# Not only do you get a histogram, but you also get a message about the binwidth defaulting to range/30. Recall that range refers to the spread or dispersion of the data, in this case price of diamonds.
> max(diamonds$price) - min(diamonds$price)
# [1] 18497

> qplot(price, data = diamonds, binwidth = 18497/30)
# No more messages in red, but a histogram almost identical to the previous one! If you typed 18497/30 at the command line you would get the result 616.5667. This means that the height of each bin tells you how many diamonds have a price between x and x+617 where x is the left edge of the bin.

# We've created a vector containing integers that are multiples of 617 for you. It's called brk.
> brk
# [1]     0   617  1234  1851  2468  3085  3702  4319  4936  5553  6170
# [12]  6787  7404  8021  8638  9255  9872 10489 11106 11723 12340 12957
# [23] 13574 14191 14808 15425 16042 16659 17276 17893 18510 19127

# We've also created a vector containing the number of diamonds with prices between each pair of adjacent entries of brk. For instance, the first count is the number of diamonds with prices between 0 and $617, and the second is the number of diamonds with prices between $617 and $1234.
> counts
# [1]  4611 13255  5230  4262  3362  2567  2831  2841  2203  1666  1445
# [12]  1112   987   766   796   655   606   553   540   427   429   376
# [23]   348   338   298   305   269   287   227   251    97

> qplot(price, data = diamonds, binwidth = 18497/30, fill = cut)
# The shape of the histogram will be familiar, but it will be more colorful.
# This shows how the counts within each price grouping (bin) are distributed among the different cuts of diamonds. Notice how qplot displays these distributions relative to the cut legend on the right. The fair cut diamonds are at the bottom of each bin, the good cuts are above them, then the very good above them, until the ideal cuts are at the top of each bin. You can quickly see from this display that there are very few fair cut diamonds priced above $5000.

# Now we'll replot the histogram as a density function which will show the proportion of diamonds in each bin. This means that the shape will be similar but the scale on the y-axis will be different since, by definition, the density function is nonnegative everywhere, and the area under the curve is one.
> qplot(price, data = diamonds, geom = "density")
# Notice that the shape is similar to that of the histogram we saw previously. The highest peak is close to 0 on the x-axis meaning that most of the diamonds in the dataset were inexpensive. In general, as prices increase (move right along the x-axis) the number of diamonds (at those prices) decrease. The exception to this is when the price is around $4000; there's a slight increase in frequency. Let's see if cut is responsible for this increase.
> qplot(price, data = diamonds, geom = "density", color = cut)
# See how easily qplot did this? Four of the five cuts have 2 peaks, one at price $1000 and the other between $4000 and $5000. The exception is the Fair cut which has a single peak at $2500. This gives us a little more understanding of the histogram we saw before.

# Let's move on to scatterplots.
> qplot(carat, price, data = diamonds)
# We see the positive trend here

> qplot(carat, price, data = diamonds, shape = cut)
# The same scatterplot appears, except the cuts of the diamonds are distinguished by different symbols. The legend at the right tells you which symbol is associated with each cut. These are small and hard to read, so rerun the same command, except this time instead of setting the argument shape equal to cut, set the argument color equal to cut.

> qplot(carat, price, data = diamonds, color = cut)

> qplot(carat, price, data = diamonds, color = cut) +  geom_smooth (method = "lm")
# Again, we see the same scatterplot, but slightly more compressed and showing 5 regression lines, one for each cut of diamonds. It might be hard to see, but around each line is a shadow showing the 95% confidence interval. We see, unsurprisingly, that the better the cut, the steeper (more positive) the slope of the lines.

> qplot(carat, price, data = diamonds, color = cut, facets = . ~ cut) +  geom_smooth (method = "lm") 
# Recall that the facets argument indicates we want a multi-panel plot. The symbol to the left of the tilde indicates rows (in this case just one) and the symbol to the right of the tilde indicates columns (in this five, the number of cuts).



# Now for some ggplots.
> g <- ggplot(diamonds, aes(depth, price))

#  we want to see a scatterplot of the relationship.
> g + geom_point(alpha = 1/3)

# That's somewhat interesting. We see that depth ranges from 43 to 79, but the densest distribution is around 60 to 65. Suppose we want to see if this relationship (between depth and price) is affected by cut or carat. We know cut is a factor with 5 levels (Fair, Good, Very Good, Premium, and Ideal). But carat is numeric and not a discrete factor. Can we do this?
# Of course! That's why we asked. R has a handy command, cut, which allows you to divide your data into sets and label each entry as belonging to one of the sets, in effect creating a new factor. First, we'll have to decide where to cut the data.
# et's divide the data into 3 pockets, so 1/3 of the data falls into each. We'll use the R command quantile to do this.
> cutpoints <- quantile(diamonds$carat, seq(0,1, length = 4), na.rm=TRUE)
> cutpoints
# 0% 33.33333% 66.66667%      100% 
#   0.20      0.50      1.00      5.01 

# We see a 4-long vector (explaining why length was set equal to 4). We also see that .2 is the smallest carat size in the dataset and 5.01 is the largest. One third of the diamonds are between .2 and .5 carats and another third are between .5 and 1 carat in size. The remaining third are between 1 and 5.01 carats. Now we can use the R command cut to label each of the 53940 diamonds in the dataset as belonging to one of these 3 factors.
> diamonds$car2 <- cut(diamonds$carat, cutpoints)

# Now we can continue with our multi-facet plot. First we have to reset g since we changed the dataset (diamonds) it contained (by adding a new column).
> g <- ggplot(diamonds, aes(depth, price))
> g + geom_point(alpha = 1/3) + facet_grid(cut ~ car2)

# We see a multi-facet plot with 5 rows, each corresponding to a cut factor. Not surprising. What is surprising is the number of columns. We were expecting 3 and got 4. Why?
# he first 3 columns are labeled with the cutpoint boundaries. The fourth is labeled NA and shows us where the data points with missing data (NA or Not Available) occurred. We see that there were only a handful (12 in fact) and they occurred in Very Good, Premium, and Ideal cuts. We created a vector, myd, containing the indices of these datapoints. Look at these entries in diamonds by typing the expression diamonds[myd,]. The myd tells R what rows to show and the empty column entry says to print all the columns.
> diamonds[myd,]
# # A tibble: 12 x 11
# carat cut      color clarity depth table price     x     y     z car2 
# <dbl> <ord>    <ord> <ord>   <dbl> <dbl> <int> <dbl> <dbl> <dbl> <fct>
#   1   0.2 Premium  E     SI2      60.2    62   345  3.79  3.75  2.27 NA   
# 2   0.2 Premium  E     VS2      59.8    62   367  3.79  3.77  2.26 NA   
# 3   0.2 Premium  E     VS2      59      60   367  3.81  3.78  2.24 NA   
# 4   0.2 Premium  E     VS2      61.1    59   367  3.81  3.78  2.32 NA   
# 5   0.2 Premium  E     VS2      59.7    62   367  3.84  3.8   2.28 NA   
# 6   0.2 Ideal    E     VS2      59.7    55   367  3.86  3.84  2.3  NA   
# 7   0.2 Premium  F     VS2      62.6    59   367  3.73  3.71  2.33 NA   
# 8   0.2 Ideal    D     VS2      61.5    57   367  3.81  3.77  2.33 NA   
# 9   0.2 Very Go… E     VS2      63.4    59   367  3.74  3.71  2.36 NA   
# 10   0.2 Ideal    E     VS2      62.2    57   367  3.76  3.73  2.33 NA   
# 11   0.2 Premium  D     VS2      62.3    60   367  3.73  3.68  2.31 NA   
# 12   0.2 Premium  D     VS2      61.7    60   367  3.77  3.72  2.31 NA  

# We see these entries match the plots. Whew - that's a relief. The car2 field is, in fact, NA for these entries, but the carat field shows they each had a carat size of .2. What's going on here?
# Actually our plot answers this question. The boundaries for each column appear in the gray labels at the top of each column, and we see that the first column is labeled (0.2,0.5]. This indicates that this column contains data greater than .2 and less than or equal to .5. So diamonds with carat size .2 were excluded from the car2 field.

> g + geom_point(alpha = 1/3) + facet_grid(cut ~ car2) + geom_smooth(method = "lm", size = 3, color = "pink")
# Nice thick regression lines which are somewhat interesting. You can add labels to the plot if you want

> ggplot(diamonds, aes(carat, price)) + geom_boxplot() + facet_grid(. ~ cut)







###########################################################################################################
# 13: Dimension Reduction                                                                                 #
###########################################################################################################
# Slides for this and other Data Science courses may be found at github https://github.com/DataScienceSpecialization/courses/. If you care to use them, they must be downloaded as a zip file and viewed locally. This lesson corresponds to 04_ExploratoryAnalysis/dimensionReduction
# In this lesson we'll discuss principal component analysis (PCA) and singular value decomposition (SVD), two important and related techniques of dimension reduction. This last entails processes which finding subsets of variables in datasets that contain their essences. PCA and SVD are used in both the exploratory phase and the more formal modelling stage of analysis. We'll focus on the exploratory phase and briefly touch on some of the underlying theory.

# dataMatrix has 10 columns (and hence 40 rows) of random numbers. a matrix of 400 random normal numbers (mean 0 and standard deviation 1).
> heatmap(dataMatrix)
# We can see that even with the clustering that heatmap provides, permuting the rows (observations) and columns (variables) independently, the data still looks random.

# Let's add a pattern to the data.
set.seed(678910)
for(i in 1:40){
  # flip a coin
  coinFlip <- rbinom(1,size=1,prob=0.5)
  # if coin is heads add a common pattern to that row
  if(coinFlip){
    dataMatrix[i,] <- dataMatrix[i,] + rep(c(0,3),each=5)
  }
}

# whether or not a row gets modified by a pattern is determined by a coin flip.
# So in rows affected by the coin flip, the 5 left columns will still have a mean of 0 but the right 5 columns will have a mean closer to 3.
# Here's the image of the altered dataMatrix after the pattern has been added. The pattern is clearly visible in the columns of the matrix. The right half is yellower or hotter, indicating higher values in the matrix.

> heatmap(dataMatrix)
# Again we see the pattern in the columns of the matrix. As shown in the dendrogram at the top of the display, these split into 2 clusters, the lower numbered columns (1 through 5) and the higher numbered ones (6 through 10). Recall from the code that for rows selected by the coinflip the last 5 columns had 3 added to them. The rows still look random.
# Now consider this picture(image-1.png). On the left is an image similar to the heatmap of dataMatix you just plotted. It is an image plot of the output of hclust(), a hierarchical clustering function applied to dataMatrix. Yellow indicates "hotter" or higher values than red. This is consistent with the pattern we applied to the data (increasing the values for some of the rightmost columns).
# The middle display shows the mean of each of the 40 rows (along the x-axis). The rows are shown in the same order as the rows of the heat matrix on the left. The rightmost display shows the mean of each of the 10 columns. Here the column numbers are along the x-axis and their means along the y.
# We see immediately the connection between the yellow (hotter) portion of the cluster image and the higher row means, both in the upper right portion of the displays. Similarly, the higher valued column means are in the right half of that display and lower colummn means are in the left half.
# Now we'll talk a little theory. Suppose you have 1000's of multivariate variables X_1, ... ,X_n. By multivariate we mean that each X_i contains many components, i.e., X_i = (X_{i1}, ... , X_{im}. However, these variables (observations) and their components might be correlated to one another.
# As data scientists, we'd like to find a smaller set of multivariate variables that are uncorrelated AND explain as much variance (or variability) of the data as possible. This is a statistical approach.
# In other words, we'd like to find the best matrix created with fewer variables (that is, a lower rank matrix) that explains the original data. This is related to data compression.
# Two related solutions to these problems are PCA which stands for Principal Component Analysis and SVD, Singular Value Decomposition. This latter simply means that we express a matrix X of observations (rows) and variables (columns) as the product of 3 other matrices, i.e., X=UDV^t. This last term (V^t) represents the transpose of the matrix V.
# Here U and V each have orthogonal (uncorrelated) columns. U's columns are the left singular vectors of X and V's columns are the right singular vectors of X.  D is a diagonal matrix, by which we mean that all of its entries not on the diagonal are 0. The diagonal entries of D are the singular values of X.

> mat
# [,1] [,2] [,3]
# [1,]    1    2    3
# [2,]    2    5    7

# R provides a function to perform singular value decomposition. It's called: svd.
> svd(mat)
# $d
# [1] 9.5899624 0.1806108
# 
# $u
# [,1]       [,2]
# [1,] -0.3897782 -0.9209087
# [2,] -0.9209087  0.3897782
# 
# $v
# [,1]       [,2]
# [1,] -0.2327012 -0.7826345
# [2,] -0.5614308  0.5928424
# [3,] -0.7941320 -0.1897921

diag <- svd(mat)$d
matu <- svd(mat)$u
matv <- svd(mat)$v

a <- matu %*% diag %*% t(matv)
> all.equal(a,mat)
# [1] TRUE
# So we did in fact get mat back. That's a relief! Note that this type of decomposition is NOT unique.

# Now we'll talk a little about PCA, Principal Component Analysis, "a simple, non-parametric method for extracting relevant information from confusing data sets." We're quoting here from a very nice concise paper on this subject which can be found at http://arxiv.org/pdf/1404.1100.pdf. The paper by Jonathon Shlens of Google Research is called, A Tutorial on Principal Component Analysis.
# Basically, PCA is a method to reduce a high-dimensional data set to its essential elements (not lose information) and explain the variability in the data. We won't go into the mathematical details here, (R has a function to perform PCA), but you should know that SVD and PCA are closely related.
# We'll demonstrate this now. First we have to scale mat, our simple example data matrix.  This means that we subtract the column mean from every element and divide the result by the column standard deviation.
> svd(scale(mat))
# $d
# [1] 1.732051 0.000000
# 
# $u
# [,1]      [,2]
# [1,] -0.7071068 0.7071068
# [2,]  0.7071068 0.7071068
# 
# $v
# [,1]       [,2]
# [1,] 0.5773503 -0.5773503
# [2,] 0.5773503  0.7886751
# [3,] 0.5773503 -0.2113249

# Now run the R program prcomp on scale(mat). This will give you the principal components of mat.
> prcomp(scale(mat))
# Standard deviations (1, .., p=2):
#   [1] 1.732051 0.000000
# 
# Rotation (n x k) = (3 x 2):
#   PC1        PC2
# [1,] 0.5773503 -0.5773503
# [2,] 0.5773503  0.7886751
# [3,] 0.5773503 -0.2113249

# Notice that the principal components of the scaled matrix, shown in the Rotation component of the prcomp output, ARE the columns of V, the right singular values. Thus, PCA of a scaled matrix yields the V matrix (right singular vectors) of the same scaled matrix.


# Now that we covered the theory let's return to our bigger matrix of random data into which we had added a fixed pattern for some rows selected by coinflips. The pattern effectively shifted the means of the rows and columns.
# Here's a picture(image-2.png) showing the relationship between PCA and SVD for that bigger matrix.  We've plotted 10 points (5 are squished together in the bottom left corner). The x-coordinates are the elements of the first principal component (output from prcomp), and the y-coordinates are the elements of the first column of V, the first right singular vector (gotten from running svd). We see that the points all lie on the 45 degree line represented by the equation y=x.  So the first column of V IS the first principal component of our bigger data matrix.

# To prove we're not making this up:
> svd1 <- svd(dataMatrix)
# look at the first column of V(from svd1) now
> svd1$v[,1]
# [1] -0.01269600  0.11959541  0.03336723  0.09405542 -0.12201820 -0.43175437 -0.44120227 -0.43732624 -0.44207248 -0.43924243

# Here(image-3.png) we again show the clustered data matrix on the left. Next to it we've plotted the first column of the U matrix associated with the scaled data matrix. This is the first LEFT singular vector and it's associated with the ROW means of the clustered data. You can see the clear separation between the top 24 (around -0.2) row means and the bottom 16 (around 0.2). We don't show them but note that the other columns of U don't show this pattern so clearly.
# The rightmost display shows the first column of the V matrix associated with the scaled and clustered data matrix. This is the first RIGHT singular vector and it's associated with the COLUMN means of the clustered data. You can see the clear separation between the left 5 column means (between -0.1 and 0.1) and the right 5 column means (all below -0.4). As with the left singular vectors, the other columns of V don't show this pattern as clearly as this first one does.
# So the singular value decomposition automatically picked up these patterns, the differences in the row and column means.
# Why were the first columns of both the U and V matrices so special?  Well as it happens, the D matrix of the SVD explains this phenomenon. It is an aspect of SVD called variance explained. Recall that D is the diagonal matrix sandwiched in between U and V^t in the SVD representation of the data matrix. The diagonal entries of D are like weights for the U and V columns accounting for the variation in the data. They're given in decreasing order from highest to lowest. Look at these diagonal entries now. Recall that they're stored in svd1$d.
> svd1$d
# [1] 12.458121  7.779798  6.732595  6.301878  5.860013  4.501826  3.921267  2.973909   2.401470  2.152848
# Here's a display of these values (on the left). The first one (12.46) is significantly bigger than the others. Since we don't have any units specified, to the right we've plotted(image-4.png) the proportion of the variance each entry represents. We see that the first entry accounts for about 40% of the variance in the data. This explains why the first columns of the U and V matrices respectively showed the distinctive patterns in the row and column means so clearly.


# Now we'll show you another simple example of how SVD explains variance. We've created a 40 by 10 matrix, constantMatrix.
> head(constantMatrix)
# [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9] [,10]
# [1,]    0    0    0    0    0    1    1    1    1     1
# [2,]    0    0    0    0    0    1    1    1    1     1
# [3,]    0    0    0    0    0    1    1    1    1     1
# [4,]    0    0    0    0    0    1    1    1    1     1
# [5,]    0    0    0    0    0    1    1    1    1     1
# [6,]    0    0    0    0    0    1    1    1    1     1

# The rest of the rows look just like these. You can see that the left 5 columns are all 0's and the right 5 columns are all 1's
> svd2 <- svd(constantMatrix)
> svd2$d
# [1] 1.414214e+01 1.293147e-15 2.515225e-16 8.585184e-31 9.549693e-32 3.330034e-32 2.022600e-46 4.362170e-47 1.531252e-61 0.000000e+00
# here the first entry by far dominates the others. Here the picture(image-5.png) on the left shows the heat map of constantMatrix. You can see how the left columns differ from the right ones. The middle plot shows the values of the singular values of the matrix, i.e., the diagonal elements which are the entries of svd2$d. Nine of these are 0 and the first is a little above 14. The third plot shows the proportion of the total each diagonal element represents.

# Q: According to the plot, what percentage of the total variation does the first diagonal element account for?
# 100%
# So what does this mean? Basically that the data is one-dimensional. Only 1 piece of information, namely which column an entry is in, determines its value.


# Now let's return to our random 40 by 10 dataMatrix and consider a slightly more complicated example in which we add 2 patterns to it. Again we'll choose which rows to tweak using coinflips. Specifically, for each of the 40 rows we'll flip 2 coins. If the first coinflip is heads, we'll add 5 to each entry in the right 5 columns of that row, and if the second coinflip is heads, we'll add 5 to just the even columns of that row.
# So here's the image(image-6.png) of the scaled data matrix on the left. We can see both patterns, the clear difference between the left 5 and right 5 columns, but also, slightly less visible, the alternating pattern of the columns. The other plots show the true patterns that were added into the affected rows. The middle plot shows the true difference between the left and right columns, while the rightmost plot shows the true difference between the odd numbered and even-numbered columns.
# The question is, "Can our analysis detect these patterns just from the data?" Let's see what SVD shows. Since we're interested in patterns on columns we'll look at the first two right singular vectors (columns of V) to see if they show any evidence of the patterns.
# Here we see the 2 right singular vectors plotted next to the image(image-7.png) of the data matrix. The middle plot shows the first column of V and the rightmost plot the second. The middle plot does show that the last 5 columns have higher entries than the first 5. This picks up, or at least alludes to, the first pattern we added in which affected the last 5 columns of the matrix. The rightmost plot, showing the second column of V, looks more random. However, closer inspection shows that the entries alternate or bounce up and down as you move from left to right. This hints at the second pattern we added in which affected only even columns of selected rows.
# To see this more closely, look at the first 2 columns of the v component.
> svd2$v[,1:2]
# [,1]         [,2]
# [1,] -0.05530503  0.191200260
# [2,] -0.31131137  0.418130076
# [3,] -0.07115422  0.313155976
# [4,] -0.31715870  0.467088925
# [5,] -0.12000173 -0.374075558
# [6,] -0.42667068  0.008249501
# [7,] -0.35660145 -0.401967217
# [8,] -0.42731921  0.052087413
# [9,] -0.32368498 -0.408137473
# [10,] -0.42823762 -0.038774409

# Seeing the 2 columns side by side, we see that the values in both columns alternately increase and decrease. However, we knew to look for this pattern, so chances are, you might not have noticed this pattern if you hadn't known if was there. This example is meant to show you that it's hard to see patterns, even straightforward ones.

# Now look at the entries of the diagonal matrix d resulting from the svd.
> svd2$d
# [1] 14.189667  7.888446  6.479498  6.047231  5.557970  2.394670  2.218749  1.862250  1.223675  1.165844
# We see that the first element, 14.55, dominates the others. Here's the plot(image-8.png) of these diagonal elements of d. The left shows the numerical entries and the right show the percentage of variance each entry explains.

# Q: According to the plot, how much of the variance does the second element account for?
# 18%

# So the first element which showed the difference between the left and right halves of the matrix accounts for roughly 50% of the variation in the matrix, and the second element which picked up the alternating pattern accounts for 18% of the variance. The remaining elements account for smaller percentages of the variation. This indicates that the first pattern is much stronger than the second. Also the two patterns confound each other so they're harder to separate and see clearly. This is what often happens with real data.
# Now you're probably convinced that SVD and PCA are pretty cool and useful as tools for analysis, but one problem with them that you should be aware of, is that they cannot deal with MISSING data. Neither of them will work if any data in the matrix is missing. (You'll get error messages from R in red if you try.) Missing data is not unusual, so luckily we have ways to work around this problem. One we'll just mention is called imputing the data.
# This uses the k nearest neighbors to calculate a values to use in place of the missing data. You may want to specify an integer k which indicates how many neighbors you want to average to create this replacement value. The bioconductor package (http://bioconductor.org) has an impute package which you can use to fill in missing data. One specific function in it is impute.knn.

# We'll move on now to a final example of the power of singular value decomposition and principal component analysis and how they work as a data compression technique.
# Consider this low resolution image(image-9.png) file showing a face. We'll use SVD and see how the first several components contain most of the information in the file so that storing a huge matrix might not be necessary.
# The image data is stored in the matrix faceData.
> dim(faceData)
# [1] 32 32

# So it's not that big of a file but we want to show you how to use what you learned in this lesson. We've done the SVD and stored it in the object svd1 for you. Here's the plot(image-10.png) of the variance explained.
> svd1 <- svd(faceData)
# Q: According to the plot what percentage of the variance is explained by the first singular value?
# 40%

# So 40% of the variation in the data matrix is explained by the first component, 22% by the second, and so forth. It looks like most of the variation is contained in the first 10 components. How can we check this out? Can we try to create an approximate image using only a few components?
# Recall that the data matrix X is the product of 3 matrices, that is X=UDV^t. These are precisely what you get when you run svd on the matrix X.
# Suppose we create the product of pieces of these, say the first columns of U and V and the first element of D. The first column of U can be interpreted as a 32 by 1 matrix (recall that faceData was a 32 by 32 matrix), so we can multiply it by the first element of D, a 1 by 1 matrix, and get a 32 by 1 matrix result. We can multiply that by the transpose of the first column of V, which is the first principal component. (We have to use the transpose of V's column to make it a 1 by 32 matrix in order to do the matrix multiplication properly.)
# Alas, that is how we do it in theory, but in R using only one element of d means it's a constant. So we have to do the matrix multiplication with the %*% operator and the multiplication by the constant (svd1$d[1]) with the regular multiplication operator *.
a1 <- (svd1$u[,1] * svd1$d[1]) %*% t(svd1$v[,1])
# Now to look at it as an image. We wrote a function for you called myImage which takes a single argument, a matrix of data to display using the R function image. Run it now with a1 as its argument.
> myImage
# function(iname){
#   par(mfrow=c(1,1))
#   par(mar=c(4,5,4,5))
#   image(t(iname)[,nrow(iname):1])
# }
> myImage(a1)
# see image-11.png

# It might not look like much but it's a good start. Now we'll try the same experiment but this time we'll use 2 elements from each of the 3 SVD terms.
# Create the matrix a2 as the product of the first 2 columns of svd1$u, a diagonal matrix using the first 2 elements of svd1$d, and the transpose of the first 2 columns of svd1$v. Since all of your multiplicands are matrices you have to use only the operator %*% AND you DON'T need parentheses. Also, you must use the R function diag with svd1$d[1:2] as its sole argument to create the proper diagonal matrix. Remember, matrix multiplication is NOT commutative so you have to put the multiplicands in the correct order. Please use the 1:2 notation and not the c(m:n), i.e., the concatenate function, when specifying the columns.
> a2 <- svd1$u[,1:2] %*% diag(svd1$d[1:2]) %*% t(svd1$v[,1:2])
> myImage(a2)
# see image-12.png

# We're starting to see slightly more detail, and maybe if you squint you see a grimacing mouth. Now let's see what image results using 5 components. From our plot of the variance explained 5 components covered a sizeable percentage of the variation.
> myImage(svd1$u[,1:5] %*% diag(svd1$d[1:5]) %*% t(svd1$v[,1:5]))
