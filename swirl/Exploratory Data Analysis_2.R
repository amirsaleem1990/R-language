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










###############################################################################################################
# 11: Hierarchical Clustering                                                                                 #
###############################################################################################################
# Slides for this and other Data Science courses may be found at github https://github.com/DataScienceSpecialization/courses/. If you care to use them, they must be downloaded as a zip file and viewed locally. This lesson corresponds to 04_ExploratoryAnalysis/hierarchicalClustering
# In this lesson we'll learn about hierarchical clustering, a simple way of quickly examining and displaying multi-dimensional data. This technique is usually most useful in the early stages of analysis when you're trying to get an understanding of the data, e.g., finding some pattern or relationship between different factors or variables. As the name suggests hierarchical clustering creates a hierarchy of clusters.
# Clustering organizes data points that are close into groups. So obvious questions are "How do we define close?", "How do we group things?", and "How do we interpret the grouping?" Cluster analysis is a very important topic in data analysis.

# set.seed(1234)
# par(mar=c(0,0,0,0))
# x <- rnorm(12, mean = rep(1:3, each = 4), sd = 0.2)
# y <- rnorm(12, mean = rep(c(1,2,1), each = 4), sd = 0.2)
# plot(x,y,col="blue", pch = 19, cex = 2)
# text(x + 0.05, y + 0.05, labels = as.character(1:12))

# Hierarchical clustering is an agglomerative, or bottom-up, approach. From Wikipedia (http://en.wikipedia.org/wiki/Hierarchical_clustering), we learn that in this method, "each observation starts in its own cluster, and pairs of clusters are merged as one moves up the hierarchy." This means that we'll find the closest two points and put them together in one cluster, then find the next closest pair in the updated picture, and so forth. We'll repeat this process until we reach a reasonable stopping place.
# Note the word "reasonable". There's a lot of flexibility in this field and how you perform your analysis depends on your problem. Again, Wikipedia tells us, "one can decide to stop clustering either when the clusters are too far apart to be merged (distance criterion) or when there is a sufficiently small number of clusters (number criterion)."
# First, how do we define close? This is the most important step and there are several possibilities depending on the questions you're trying to answer and the data you have. Distance or similarity are usually the metrics used.
# there are several ways to measure distance or similarity. Euclidean distance and correlation similarity are continuous measures, while Manhattan distance is a binary measure. In this lesson we'll just briefly discuss the first and last of these. It's important that you use a measure of distance that fits your problem.
# Euclidean distance is what you learned about in high school algebra. Given two points on a plane, (x1,y1) and (x2,y2), the Euclidean distance is the square root of the sums of the squares of the distances between the two x-coordinates (x1-x2) and the two y-coordinates (y1-y2). You probably recognize this as an application of the Pythagorean theorem which yields the length of the hypotenuse of a right triangle.
# formula:
# sqrt(((x1 - x2)^2) + ((y1 - y2)^2))
# in general: sqrt(
#   ((A1 - A2)^2) + ((B1 - B2)^2) + ... + ((Z1 - Z2)^2)
# )

# Euclidean distance is distance "as the crow flies". Many applications, however, can't realistically use crow-flying distance. Cars, for instance, have to follow roads.
# In this case, we can use Manhattan or city block distance (also known as a taxicab metric). This picture, copied from http://en.wikipedia.org/wiki/Taxicab_geometry, shows what this means.
# You want to travel from the point at the lower left to the one on the top right. The shortest distance is the Euclidean (the green line), but you're limited to the grid, so you have to follow a path similar to those shown in red, blue, or yellow. These all have the same length (12) which is the number of small gray segments covered by their paths.
# More formally, Manhattan distance is the sum of the absolute values of the distances between each coordinate, so the distance between the points (x1,y1) and (x2,y2) is x1-x2+y1-y2. As with Euclidean distance, this too generalizes to more than 2 dimensions.
# Now we'll go back to our random points. You might have noticed that these points don't really look randomly positioned, and in fact, they're not. They were actually generated as 3 distinct clusters. We've put the coordinates of these points in a data frame for you, called dataFrame.
# We'll use this dataFrame to demonstrate an agglomerative (bottom-up) technique of hierarchical clustering and create a dendrogram. This is an abstract picture (or graph) which shows how the 12 points in our dataset cluster together. Two clusters (initially, these are points) that are close are connected with a line, We'll use Euclidean distance as our metric of closeness.
# Run the R command dist with the argument dataFrame to compute the distances between all pairs of these points. By default dist uses Euclidean distance as its metric, but other metrics such as Manhattan, are available.
> dist(dataFrame)
# 1          2          3          4          5          6          7          8          9         10         11
# 2  0.34120511                                                                                                              
# 3  0.57493739 0.24102750                                                                                                   
# 4  0.26381786 0.52578819 0.71861759                                                                                        
# 5  1.69424700 1.35818182 1.11952883 1.80666768                                                                             
# 6  1.65812902 1.31960442 1.08338841 1.78081321 0.08150268                                                                  
# 7  1.49823399 1.16620981 0.92568723 1.60131659 0.21110433 0.21666557                                                       
# 8  1.99149025 1.69093111 1.45648906 2.02849490 0.61704200 0.69791931 0.65062566                                            
# 9  2.13629539 1.83167669 1.67835968 2.35675598 1.18349654 1.11500116 1.28582631 1.76460709                                 
# 10 2.06419586 1.76999236 1.63109790 2.29239480 1.23847877 1.16550201 1.32063059 1.83517785 0.14090406                      
# 11 2.14702468 1.85183204 1.71074417 2.37461984 1.28153948 1.21077373 1.37369662 1.86999431 0.11624471 0.08317570           
# 12 2.05664233 1.74662555 1.58658782 2.27232243 1.07700974 1.00777231 1.17740375 1.66223814 0.10848966 0.19128645 0.20802789

# You see that the output is a lower triangular matrix with rows numbered from 2 to 12 and columns numbered from 1 to 11. Entry (i,j) indicates the distance between points i and j. Clearly you need only a lower triangular matrix since the distance between points i and j equals that between j and i.
# So 0.0815 (units are unspecified) between points 5 and 6 is the shortest distance. We can put these points in a single cluster and look for another close pair of points.
# 10 and 11 are another pair of points that would be in a second cluster. We'll start creating our dendrogram now. Here're the original plot and two beginning pieces of the dendrogram.
# We can keep going like this in the obvious way and pair up individual points, but as luck would have it, R provides a simple function which you can call which creates a dendrogram for you. It's called hclust() and takes as an argument the pairwise distance matrix which we looked at before. We've stored this matrix for you in a variable called distxy.
> hc <- hclust(distxy)
> plot(hc)

# Nice plot, right? R's plot conveniently labeled everything for you. The points we saw are the leaves at the bottom of the graph, 5 and 6 are connected, as are 10 and 11. Moreover, we see that the original 3 groupings of points are closest together as leaves on the picture. That's reassuring.  Now call plot again, this time with the argument as.dendrogram(hc).
> plot(as.dendrogram(hc))
# The essentials are the same, but the labels are missing and the leaves (original points) are all printed at the same level. Notice that the vertical heights of the lines and labeling of the scale on the left edge give some indication of distance.
> abline(h = 1.5, col="blue")
# We see that this blue line intersects 3 vertical lines and this tells us that using the distance 1.5 (unspecified units) gives us 3 clusters (1 through 4), (9 through 12), and (5 through 8). We call this a "cut" of our dendrogram.
> abline(h = .4, col="red")
# We see that by cutting at .4 we have 5 clusters, indicating that this distance is small enough to break up our original grouping of points.

# So the number of clusters in your data depends on where you draw the line! (We said there's a lot of flexibility here.) Now that we've seen the practice, let's go back to some "theory". Notice that the two original groupings, 5 through 8, and 9 through 12, are connected with a horizontal line near the top of the display. You're probably wondering how distances between clusters of points are measured.
# There are several ways to do this. We'll just mention two. The first is called complete linkage and it says that if you're trying to measure a distance between two clusters, take the greatest distance between the pairs of points in those two clusters. Obviously such pairs contain one point from each cluster.

# We've created the dataframe dFsm for you containing these 3 points, 4, 8, and 11.
> dist(dFsm)
# 1        2
# 2 2.028495         
# 3 2.374620 1.869994

# We see that the smallest distance is between points 2 and 3 in this reduced set, (these are actually points 8 and 11 in the original set), indicating that the two clusters these points represent ((5 through 8) and (9 through 12) respectively) would be joined (at a distance of 1.869) before being connected with the third cluster (1 through 4). This is consistent with the dendrogram we plotted.

# The second way to measure a distance between two clusters that we'll just mention is called average linkage. First you compute an "average" point in each cluster (think of it as the cluster's center of gravity). You do this by computing the mean (average) x and y coordinates of the points in the cluster.
# Then you compute the distances between each cluster average to compute the intercluster distance.
# In our simple set of data, the average and complete linkages aren't that different, but in more complicated datasets the type of linkage you use could affect how your data clusters. It is a good idea to experiment with different methods of linkage to see the varying ways your data groups. This will help you determine the best way to continue with your analysis.

# The last method of visualizing data we'll mention in this lesson concerns heat maps. Wikipedia (http://en.wikipedia.org/wiki/Heat_map) tells us a heat map is "a graphical representation of data where the individual values contained in a matrix are represented as colors. ... Heat maps originated in 2D displays of the values in a data matrix. Larger values were represented by small dark gray or black squares (pixels) and smaller values by lighter squares."
# We won't say too much on this topic, but a very nice concise tutorial on creating heatmaps in R exists at http://sebastianraschka.com/Articles/heatmaps_in_r.html#clustering. Here's an image from the tutorial to start you thinking about the topic. It shows a sample heat map with a dendrogram on the left edge mapping the relationship between the rows. The legend at the top shows how colors relate to values.
# image link: https://sebastianraschka.com/images/blog/2013/heatmaps_in_r/heatmaps_in_r.png

# R provides a handy function to produce heat maps. It's called heatmap. We've put the point data we've been using throughout this lesson in a matrix.
> heatmap(dataMatrix, col = cm.colors(25))
# We see an interesting display of sorts. This is a very simple heat map - simple because the data isn't very complex. The rows and columns are grouped together as shown by colors. The top rows (labeled 5, 6, and 7) seem to be in the same group (same colors) while 8 is next to them but colored differently. This matches the dendrogram shown on the left edge. Similarly, 9, 12, 11, and 10 are grouped together (row-wise) along with 3 and 2. These are followed by 1 and 4 which are in a separate group. Column data is treated independently of rows but is also grouped.

# We've subsetted some vehicle data from mtcars, the Motor Trend Car Road Tests which is part of the package datasets. The data is in the matrix mt and contains 6 factors of 11 cars
> heatmap(mt)
# This looks slightly more interesting than the heatmap for the point data. It shows a little better how the rows and columns are treated (clustered and colored) independently of one another. To understand the disparity in color (between the left 4 columns and the right 2) look at mt now.
> mt
# mpg cyl  disp  hp drat    wt
# Dodge Challenger 15.5   8 318.0 150 2.76 3.520
# AMC Javelin      15.2   8 304.0 150 3.15 3.435
# Camaro Z28       13.3   8 350.0 245 3.73 3.840
# Pontiac Firebird 19.2   8 400.0 175 3.08 3.845
# Fiat X1-9        27.3   4  79.0  66 4.08 1.935
# Porsche 914-2    26.0   4 120.3  91 4.43 2.140
# Lotus Europa     30.4   4  95.1 113 3.77 1.513
# Ford Pantera L   15.8   8 351.0 264 4.22 3.170
# Ferrari Dino     19.7   6 145.0 175 3.62 2.770
# Maserati Bora    15.0   8 301.0 335 3.54 3.570
# Volvo 142E       21.4   4 121.0 109 4.11 2.780
# See how four of the columns are all relatively small numbers and only two (disp and hp) are large? That explains the big difference in color columns. Now to understand the grouping of the rows call plot with one argument, the dendrogram object denmt we've created for you.
> plot(denmt)
# We see that this dendrogram is the one displayed at the side of the heat map. How was this created? Recall that we generalized the distance formula for more than 2 dimensions. We've created a distance matrix for you, distmt. Look at it now.
> distmt
# Dodge Challenger AMC Javelin Camaro Z28 Pontiac Firebird Fiat X1-9                Porsche 914-2 Lotus Europa Ford Pantera L Ferrari Dino    Maserati Bora
# AMC Javelin              14.00890                                                       AMC Javelin                                                                AMC Javelin                   
# Camaro Z28              100.27404   105.57041                                           Camaro Z28                                                                 Camaro Z28                    
# Pontiac Firebird         85.80733    99.28330   86.22779                                Pontiac Firebird                                                           Pontiac Firebird              
# Fiat X1-9               253.64640   240.51305  325.11191        339.12867               Fiat X1-9                                                                  Fiat X1-9                     
# Porsche 914-2           206.63309   193.29419  276.87318        292.15588  48.29642     Porsche 914-2                                                              Porsche 914-2                 
# Lotus Europa            226.48724   212.74240  287.59666        311.37656  49.78046     Lotus Europa          33.75246                                             Lotus Europa                  
# Ford Pantera L          118.69012   123.31494   19.20778        101.66275 336.65679     Ford Pantera L       288.56998    297.51961                                Ford Pantera L                
# Ferrari Dino            174.86264   161.03078  216.72821        255.01117 127.67016     Ferrari Dino          87.81135     80.33743      224.44761                 Ferrari Dino                  
# Maserati Bora           185.78176   185.02489  102.48902        188.19917 349.02042     Maserati Bora        303.85577    303.20992       86.84620    223.52346    Maserati Bora                 
# Volvo 142E              201.35337   187.68535  266.49555        286.74036  60.40302     Volvo 142E            18.60543     27.74042      277.43923     70.27895    Volvo 142E           289.02233







########################################################################################################################################
# 12: K Means Clustering                                                                                                               #
########################################################################################################################################
# Slides for this and other Data Science courses may be found at github https://github.com/DataScienceSpecialization/courses/. If you care to use them, they must be downloaded as a zip file and viewed locally. This lesson corresponds to 04_ExploratoryAnalysis/kmeansClustering
# In this lesson we'll learn about k-means clustering, another simple way of examining and organizing multi-dimensional data. As with hierarchical clustering, this technique is most useful in the early stages of analysis when you're trying to get an understanding of the data, e.g., finding some pattern or relationship between different factors or variables.
# R documentation tells us that the k-means method "aims to partition the points into k groups such that the sum of squares from points to the assigned cluster centres is minimized."
# Since clustering organizes data points that are close into groups we'll assume we've decided on a measure of distance, e.g., Euclidean.

# set.seed(1234)
# par(mar=c(0,0,0,0))
# x <- rnorm(12, mean = rep(1:3, each = 4), sd = 0.2)
# y <- rnorm(12, mean = rep(c(1,2,1), each = 4), sd = 0.2)
# plot(x,y,col="blue", pch = 19, cex = 2)
# text(x + 0.05, y + 0.05, labels = as.character(1:12))

# As we said, k-means is a partioning approach which requires that you first guess how many clusters you have (or want). Once you fix this number, you randomly create a "centroid" (a phantom point) for each cluster and assign each point or observation in your dataset to the centroid to which it is closest. Once each point is assigned a centroid, you readjust the centroid's position by making it the average of the points assigned to it.
# Once you have repositioned the centroids, you must recalculate the distance of the observations to the centroids and reassign any, if necessary, to the centroid closest to them. Again, once the reassignments are done, readjust the positions of the centroids based on the new cluster membership. The process stops once you reach an iteration in which no adjustments are made or when you've reached some predetermined maximum number of iterations.
# So k-means clustering requires some distance metric (say Euclidean), a hypothesized fixed number of clusters, and an initial guess as to cluster centroids.
# When it's finished k-means clustering returns a final position of each cluster's centroid as well as the assignment of each data point or observation to a cluster.

# Now we'll step through this process using our random points as our data. The coordinates of these are stored in 2 vectors, x and y. We eyeball the display and guess that there are 3 clusters. We'll pick 3 positions of centroids, one for each cluster.
# We've created two 3-long vectors for you, cx and cy. These respectively hold the x- and y- coordinates for 3 proposed centroids. For convenience, we've also stored them in a 2 by 3 matrix cmat. The x coordinates are in the first row and the y coordinates in the second.
> cmat
# [,1]  [,2] [,3]
# [1,]    1  1.8  2.5
# [2,]    2  1.0  1.5

# The coordinates of these points are (1,2), (1.8,1) and (2.5,1.5). We'll add these centroids to the plot of our points.
points(cx, cy, col = c("red", "orange", "purple"), pch = 3, cex = 2, lwd = 2)
# We see the first centroid (1,2) is in red. The second (1.8,1), to the right and below the first, is orange, and the final centroid (2.5,1.5), the furthest to the right, is purple.

# Now we have to calculate distances between each point and every centroid. There are 12 data points and 3 centroids, so we have to calculate 36 distances.
# We've written a function for you called mdist which takes 4 arguments. The vectors of data points (x and y) are the first two and the two vectors of centroid coordinates (cx and cy) are the last two.
> mdist
# function(x,y,cx,cy){
#   distTmp <- matrix(NA,nrow=3,ncol=12)
#   distTmp[1,] <- (x-cx[1])^2 + (y-cy[1])^2
#   distTmp[2,] <- (x-cx[2])^2 + (y-cy[2])^2
#   distTmp[3,] <- (x-cx[3])^2 + (y-cy[3])^2  
#   return(distTmp)
# }

> mdist(x, y, cx, cy)
# [,1]      [,2]      [,3]     [,4]      [,5]      [,6]      [,7]     [,8]       [,9]     [,10]     [,11]     [,12]
# [1,] 1.392885 0.9774614 0.7000680 1.264693 1.1894610 1.2458771 0.8113513 1.026750  4.5082665 4.5255617 4.8113368 4.0657750
# [2,] 1.108644 0.5544675 0.3768445 1.611202 0.8877373 0.7594611 0.7003994 2.208006  1.1825265 1.0540994 1.2278193 1.0090944
# [3,] 3.461873 2.3238956 1.7413021 4.150054 0.3297843 0.2600045 0.4887610 1.337896  0.3737554 0.4614472 0.5095428 0.2567247

# We've stored these distances in the matrix distTmp for you.
# Now we have to assign a cluster to each point. To do that we'll look at each column and pick the minimum entry.
# From the distTmp entries, 3rd cluster would point 6 be assigned to.

# R has a handy function which.min which you can apply to ALL the columns of distTmp with one call.
> apply(distTmp, 2, which.min)
# [1] 2 2 2 1 3 3 3 1 3 3 3 3
# You can see that you were right and the 6th entry is indeed 3 as you answered before. We see the first 3 entries were assigned to the second (orange) cluster and only 2 points (4 and 8) were assigned to the first (red) cluster.

# We've stored the vector of cluster colors ("red","orange","purple") in the array cols1 for you and we've also stored the cluster assignments in the array newClust. Let's color the 12 data points according to their assignments.
> points(x, y, pch = 19, cex = 2, col = cols1[newClust])

# Now we have to recalculate our centroids so they are the average (center of gravity) of the cluster of points assigned to them. We have to do the x and y coordinates separately. We'll do the x coordinate first. Recall that the vectors x and y hold the respective coordinates of our 12 data points.
> tapply(x, newClust, mean)
# 1        2        3 
# 1.210767 1.010320 2.498011 

> tapply(y, newClust, mean)
# 1        2        3 
# 1.730555 1.016513 1.354373 

# Now that we have new x and new y coordinates for the 3 centroids we can plot them. We've stored off the coordinates for you in variables newCx and newCy.
> points(newCx, newCy, col = cols1, pch = 8, cex = 2, lwd = 2)
# We see how the centroids have moved closer to their respective clusters. This is especially true of the second (orange) cluster.

# call the distance function mdist with the 4 arguments x, y, newCx, and newCy. This will allow us to reassign the data points to new clusters if necessary.
> mdist(x,y, newCx, newCy)
# [,1]        [,2]      [,3]      [,4]      [,5]      [,6]      [,7]     [,8]       [,9]    [,10]     [,11]     [,12]
# [1,] 0.98911875 0.539152725 0.2901879 1.0286979 0.7936966 0.8004956 0.4650664 1.028698  3.3053706 3.282778 3.5391512 2.9345445
# [2,] 0.09287262 0.002053041 0.0734304 0.2313694 1.9333732 1.8320407 1.4310971 2.926095  3.5224442 3.295301 3.5990955 3.2097944
# [3,] 3.28531180 2.197487387 1.6676725 4.0113796 0.4652075 0.3721778 0.6043861 1.643033  0.2586908 0.309730 0.3610747 0.1602755

# We've stored off this new matrix of distances in the matrix distTmp2 for you. Recall that the first cluster is red, the second orange and the third purple. Look closely at columns 4 and 7 of distTmp2.
# They will both change clusters

# find the new cluster assignments for the points.
> apply(distTmp2, 2, which.min)
# [1] 2 2 2 2 3 3 1 1 3 3 3 3

# We've stored off the new cluster assignments in a vector of factors called newClust2. Use the R function points to recolor the points with their new assignments.
> points(x, y, pch = 19, cex = 2, col = cols1[newClust2])
# Notice that points 4 and 7 both changed clusters, 4 moved from 1 to 2 (red to orange), and point 7 switched from 3 to 2 (purple to red).

# Now find the x coordinate of the new centroid.
> tapply(x,newClust2, mean)
# 1         2         3 
# 1.8878628 0.8904553 2.6001704 

> tapply(y,newClust2, mean)
# 1        2        3 
# 2.157866 1.006871 1.274675 

# We've stored off these coordinates for you in the variables finalCx and finalCy. Plot these new centroids
> points(finalCx, finalCy, col = cols1, pch = 9, cex = 2, lwd=2)
# It should be obvious that if we continued this process points 5 through 8 would all turn red, while points 1 through 4 stay orange, and points 9 through 12 purple.

# Now that you've gone through an example step by step, you'll be relieved to hear that R provides a command to do all this work for you. Unsurprisingly it's called kmeans and, although it has several parameters, we'll just mention four. These are x, (the numeric matrix of data), centers, iter.max, and nstart. The second of these (centers) can be either a number of clusters or a set of initial centroids. The third, iter.max, specifies the maximum number of iterations to go through, and nstart is the number of random starts you want to try if you specify centers as a number.
> kmeans(dataFrame, centers = 3)
# K-means clustering with 3 clusters of sizes 4, 4, 4
# 
# Cluster means:
#   x         y
# 1 2.8534966 0.9831222
# 2 0.8904553 1.0068707
# 3 1.9906904 2.0078229
# 
# Clustering vector:
#   [1] 2 2 2 2 3 3 3 3 1 1 1 1
# 
# Within cluster sum of squares by cluster:
#   [1] 0.03298027 0.34188313 0.34732441
# (between_SS / total_SS =  93.6 %)
# 
# Available components:
#   
#   [1] "cluster"      "centers"      "totss"        "withinss"     "tot.withinss"
# [6] "betweenss"    "size"         "iter"         "ifault"      

# The program returns the information that the data clustered into 3 clusters each of size 4. It also returns the coordinates of the 3 cluster means, a vector named cluster indicating how the 12 points were partitioned into the clusters, and the sum of squares within each cluster. It also shows all the available components returned by the function. We've stored off this data for you in a kmeans object called kmObj. Look at kmObj$iter to see how many iterations the algorithm went through.
> kmObj$iter
# [1] 2

# Two iterations as we did before. We just want to emphasize how you can access the information available to you. Let's plot the data points color coded according to their cluster.
> plot(x,y, col = kmObj$cluster, pch = 19, cex = 2)
# Now add the centroids which are stored in kmObj$centers.
> points(kmObj$centers, col = c("black", "red", "green"), pch =3, cex = 3, lwd = 3)



# Now for some fun! We want to show you how the output of the kmeans function is affected by its random start (when you just ask for a number of clusters). With random starts you might want to run the function several times to get an idea of the relationships between your observations. We'll call kmeans with the same data points (stored in dataFrame), but ask for 6 clusters instead of 3.
# We'll plot our data points several times and each time we'll just change the argument col which will show us how the R function kmeans is clustering them.
> plot(x,y, col = kmeans(dataFrame, 6)$cluster, pch = 19, cex = 2)
# See how the points cluster? Now recall your last command and rerun it.
> plot(x,y, col = kmeans(dataFrame, 6)$cluster, pch = 19, cex = 2)
# See how the clustering has changed? As the Teletubbies would say, "Again! Again!"
> plot(x,y, col = kmeans(dataFrame, 6)$cluster, pch = 19, cex = 2)
# So the clustering changes with different starts. Perhaps 6 is too many clusters?




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
# Now consider this picture(screenshot/Exploratory-Data-Analysis/image-1.png). On the left is an image similar to the heatmap of dataMatix you just plotted. It is an image plot of the output of hclust(), a hierarchical clustering function applied to dataMatrix. Yellow indicates "hotter" or higher values than red. This is consistent with the pattern we applied to the data (increasing the values for some of the rightmost columns).
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
# Here's a picture(screenshot/Exploratory-Data-Analysis/image-2.png) showing the relationship between PCA and SVD for that bigger matrix.  We've plotted 10 points (5 are squished together in the bottom left corner). The x-coordinates are the elements of the first principal component (output from prcomp), and the y-coordinates are the elements of the first column of V, the first right singular vector (gotten from running svd). We see that the points all lie on the 45 degree line represented by the equation y=x.  So the first column of V IS the first principal component of our bigger data matrix.

# To prove we're not making this up:
> svd1 <- svd(dataMatrix)
# look at the first column of V(from svd1) now
> svd1$v[,1]
# [1] -0.01269600  0.11959541  0.03336723  0.09405542 -0.12201820 -0.43175437 -0.44120227 -0.43732624 -0.44207248 -0.43924243

# Here(screenshot/Exploratory-Data-Analysis/image-3.png) we again show the clustered data matrix on the left. Next to it we've plotted the first column of the U matrix associated with the scaled data matrix. This is the first LEFT singular vector and it's associated with the ROW means of the clustered data. You can see the clear separation between the top 24 (around -0.2) row means and the bottom 16 (around 0.2). We don't show them but note that the other columns of U don't show this pattern so clearly.
# The rightmost display shows the first column of the V matrix associated with the scaled and clustered data matrix. This is the first RIGHT singular vector and it's associated with the COLUMN means of the clustered data. You can see the clear separation between the left 5 column means (between -0.1 and 0.1) and the right 5 column means (all below -0.4). As with the left singular vectors, the other columns of V don't show this pattern as clearly as this first one does.
# So the singular value decomposition automatically picked up these patterns, the differences in the row and column means.
# Why were the first columns of both the U and V matrices so special?  Well as it happens, the D matrix of the SVD explains this phenomenon. It is an aspect of SVD called variance explained. Recall that D is the diagonal matrix sandwiched in between U and V^t in the SVD representation of the data matrix. The diagonal entries of D are like weights for the U and V columns accounting for the variation in the data. They're given in decreasing order from highest to lowest. Look at these diagonal entries now. Recall that they're stored in svd1$d.
> svd1$d
# [1] 12.458121  7.779798  6.732595  6.301878  5.860013  4.501826  3.921267  2.973909   2.401470  2.152848
# Here's a display of these values (on the left). The first one (12.46) is significantly bigger than the others. Since we don't have any units specified, to the right we've plotted(screenshot/Exploratory-Data-Analysis/image-4.png) the proportion of the variance each entry represents. We see that the first entry accounts for about 40% of the variance in the data. This explains why the first columns of the U and V matrices respectively showed the distinctive patterns in the row and column means so clearly.


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
# here the first entry by far dominates the others. Here the picture(screenshot/Exploratory-Data-Analysis/image-5.png) on the left shows the heat map of constantMatrix. You can see how the left columns differ from the right ones. The middle plot shows the values of the singular values of the matrix, i.e., the diagonal elements which are the entries of svd2$d. Nine of these are 0 and the first is a little above 14. The third plot shows the proportion of the total each diagonal element represents.

# Q: According to the plot, what percentage of the total variation does the first diagonal element account for?
# 100%
# So what does this mean? Basically that the data is one-dimensional. Only 1 piece of information, namely which column an entry is in, determines its value.


# Now let's return to our random 40 by 10 dataMatrix and consider a slightly more complicated example in which we add 2 patterns to it. Again we'll choose which rows to tweak using coinflips. Specifically, for each of the 40 rows we'll flip 2 coins. If the first coinflip is heads, we'll add 5 to each entry in the right 5 columns of that row, and if the second coinflip is heads, we'll add 5 to just the even columns of that row.
# So here's the image(screenshot/Exploratory-Data-Analysis/image-6.png) of the scaled data matrix on the left. We can see both patterns, the clear difference between the left 5 and right 5 columns, but also, slightly less visible, the alternating pattern of the columns. The other plots show the true patterns that were added into the affected rows. The middle plot shows the true difference between the left and right columns, while the rightmost plot shows the true difference between the odd numbered and even-numbered columns.
# The question is, "Can our analysis detect these patterns just from the data?" Let's see what SVD shows. Since we're interested in patterns on columns we'll look at the first two right singular vectors (columns of V) to see if they show any evidence of the patterns.
# Here we see the 2 right singular vectors plotted next to the image(screenshot/Exploratory-Data-Analysis/image-7.png) of the data matrix. The middle plot shows the first column of V and the rightmost plot the second. The middle plot does show that the last 5 columns have higher entries than the first 5. This picks up, or at least alludes to, the first pattern we added in which affected the last 5 columns of the matrix. The rightmost plot, showing the second column of V, looks more random. However, closer inspection shows that the entries alternate or bounce up and down as you move from left to right. This hints at the second pattern we added in which affected only even columns of selected rows.
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
# We see that the first element, 14.55, dominates the others. Here's the plot(screenshot/Exploratory-Data-Analysis/image-8.png) of these diagonal elements of d. The left shows the numerical entries and the right show the percentage of variance each entry explains.

# Q: According to the plot, how much of the variance does the second element account for?
# 18%

# So the first element which showed the difference between the left and right halves of the matrix accounts for roughly 50% of the variation in the matrix, and the second element which picked up the alternating pattern accounts for 18% of the variance. The remaining elements account for smaller percentages of the variation. This indicates that the first pattern is much stronger than the second. Also the two patterns confound each other so they're harder to separate and see clearly. This is what often happens with real data.
# Now you're probably convinced that SVD and PCA are pretty cool and useful as tools for analysis, but one problem with them that you should be aware of, is that they cannot deal with MISSING data. Neither of them will work if any data in the matrix is missing. (You'll get error messages from R in red if you try.) Missing data is not unusual, so luckily we have ways to work around this problem. One we'll just mention is called imputing the data.
# This uses the k nearest neighbors to calculate a values to use in place of the missing data. You may want to specify an integer k which indicates how many neighbors you want to average to create this replacement value. The bioconductor package (http://bioconductor.org) has an impute package which you can use to fill in missing data. One specific function in it is impute.knn.

# We'll move on now to a final example of the power of singular value decomposition and principal component analysis and how they work as a data compression technique.
# Consider this low resolution image(screenshot/Exploratory-Data-Analysis/image-9.png) file showing a face. We'll use SVD and see how the first several components contain most of the information in the file so that storing a huge matrix might not be necessary.
# The image data is stored in the matrix faceData.
> dim(faceData)
# [1] 32 32

# So it's not that big of a file but we want to show you how to use what you learned in this lesson. We've done the SVD and stored it in the object svd1 for you. Here's the plot(screenshot/Exploratory-Data-Analysis/image-10.png) of the variance explained.
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
# see screenshot/Exploratory-Data-Analysis/image-11.png

# It might not look like much but it's a good start. Now we'll try the same experiment but this time we'll use 2 elements from each of the 3 SVD terms.
# Create the matrix a2 as the product of the first 2 columns of svd1$u, a diagonal matrix using the first 2 elements of svd1$d, and the transpose of the first 2 columns of svd1$v. Since all of your multiplicands are matrices you have to use only the operator %*% AND you DON'T need parentheses. Also, you must use the R function diag with svd1$d[1:2] as its sole argument to create the proper diagonal matrix. Remember, matrix multiplication is NOT commutative so you have to put the multiplicands in the correct order. Please use the 1:2 notation and not the c(m:n), i.e., the concatenate function, when specifying the columns.
> a2 <- svd1$u[,1:2] %*% diag(svd1$d[1:2]) %*% t(svd1$v[,1:2])
> myImage(a2)
# see screenshot/Exploratory-Data-Analysis/image-12.png

# We're starting to see slightly more detail, and maybe if you squint you see a grimacing mouth. Now let's see what image results using 5 components. From our plot of the variance explained 5 components covered a sizeable percentage of the variation.
> myImage(svd1$u[,1:5] %*% diag(svd1$d[1:5]) %*% t(svd1$v[,1:5]))

# Certainly much better. Clearly a face is appearing with eyes, nose, ears, and mouth recognizable. Again, use the up arrow to recall the last command (calling myImage with a matrix product argument) and change the 5's to 10's. We'll see how this image looks.
> myImage(svd1$u[,1:10] %*% diag(svd1$d[1:10]) %*% t(svd1$v[,1:10]))

# Now that's pretty close to the original which was low resolution to begin with, but you can see that 10 components really do capture the essence of the image. Singular value decomposition is a good way to approximate data without having to store a lot.
# We'll close now with a few comments. First, when reducing dimensions you have to pay attention to the scales on which different variables are measured and make sure that all your data is in consistent units. In other words, scales of your data matter. Second, principal components and singular values may mix real patterns, as we saw in our simple 2-pattern example, so finding and separating out the real patterns require some detective work. Let's do a quick review now.

# Q: A matrix X has the singular value decomposition UDV^t. The principal components of X are ?
# the columns of V

# Q: A matrix X has the singular value decomposition UDV^t. The singular values of X are found where?
# the diagonal elements of D

# Q: True or False? PCA and SVD are totally unrelated.
# FALSE

# Q: True or False? D gives the singular values of a matrix in decreasing order of weight.
# TRUE



##########################################################################
# 14: Clustering Example                                                 #
##########################################################################
# Slides for this and other Data Science courses may be found at github https://github.com/DataScienceSpecialization/courses/. If you care to use them, they must be downloaded as a zip file and viewed locally. This lesson corresponds to 04_ExploratoryAnalysis/clusteringExample
# In this lesson we'll apply some of the analytic techniques we learned in this course to data from the University of California, Irvine. Specifically, the data we'll use is from UCI's Center for Machine Learning and Intelligent Systems. You can find out more about the data at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones. As this address indicates, the data involves smartphones and recognizing human activity. Cool, right?
# Our goal is to show you how to use exploratory data analysis to point you in fruitful directions of research, that is, towards answerable questions. Exploratory data analysis is a "rough cut" or filter which helps you to find the most beneficial areas of questioning so you can set your priorities accordingly.
> dim(ssd)
[1] 7352 563

# The study creating this database involved 30 volunteers "performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors. ... Each person performed six activities ... wearing a smartphone (Samsung Galaxy S II) on the waist. ... The experiments have been video-recorded to label the data manually.  The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data."
> names(ssd[562:563])
# [1] "subject"  "activity"

# These last 2 columns contain subject and activity information. We saw above that the gathered data had "been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data."
> table(ssd$subject)
# 1   3   5   6   7   8  11  14  15  16  17  19  21  22  23  25  26  27  28  29  30
# 347 341 302 325 308 281 316 323 328 366 368 360 408 321 372 409 392 376 382 344 383
# So ssd contains only training data.
# So we're looking at training data from a machine learning repository. We can infer that this data is supposed to train machines to recognize activity collected from the accelerometers and gyroscopes built into the smartphones that the subjects had strapped to their waists.
> table(ssd$activity)
# laying  sitting standing     walk walkdown   walkup 
# 1407     1286     1374     1226      986     1073 

# Because it's training data, each row is labeled with the correct activity (from the 6 possible) and associated with the column measurements (from the accelerometer and gyroscope). We're interested in questions such as, "Is the correlation between the measurements and activities good enough to train a machine?" so that "Given a set of 561 measurements, would a trained machine be able to determine which of the 6 activities the person was doing?"
# First, let's massage the data a little so it's easier to work with. We've already run the R command transform on the data so that activities are factors. This will let us color code them when we generate plots.
> sub1 <- subset(ssd, subject == 1)
> dim(sub1)
# [1] 347 563

# So sub1 has fewer than 400 rows now, but still a lot of columns which contain measurements. Use names on the first 12 columns of sub1 to see what kind of data we have.
> names(sub1[,1:12])
# [1] "tBodyAcc.mean...X" "tBodyAcc.mean...Y" "tBodyAcc.mean...Z"
# [4] "tBodyAcc.std...X"  "tBodyAcc.std...Y"  "tBodyAcc.std...Z" 
# [7] "tBodyAcc.mad...X"  "tBodyAcc.mad...Y"  "tBodyAcc.mad...Z" 
# [10] "tBodyAcc.max...X"  "tBodyAcc.max...Y"  "tBodyAcc.max...Z" 

# We see X, Y, and Z (3 dimensions) of different aspects of body acceleration measurements, such as mean and standard deviation. Let's do some comparisons of activities now by looking at plots of mean body acceleration in the X and Y directions.

# the code generating the plots:
# par(mfrow=c(1, 2), mar = c(5, 4, 1, 1))
# plot(sub1[, 1], col = sub1$activity, ylab = names(sub1)[1])
# plot(sub1[, 2], col = sub1$activity, ylab = names(sub1)[2])
# legend("bottomright",legend=unique(sub1$activity),col=unique(sub1$activity), pch = 1)
# par(mfrow=c(1,1))


# The plots(screenshot/Exploratory-Data-Analysis/image-13.png) are a little squished, but we see that the active activities related to walking (shown in the two blues and magenta) show more variability than the passive activities (shown in black, red, and green), particularly in the X dimension.
# The colors are a little hard to distinguish. Just for fun, call the function showMe (we used it in the Working_with_Colors lesson) which displays color vectors. Use the vector 1:6 as its argument, and hopefully this will clarify the colors you see in the XY comparison plot.
> showMe(1:6)
# see screenshot/Exploratory-Data-Analysis/image-14.png

# Nice! We just wanted to show you the beauty and difference in colors. The colors at the bottom, black, red and green, mark the passive activities, while the true blues and magenta near the top show the walking activities. Let's try clustering to see if we can distinguish the activities more.
# We'll still focus on the 3 dimensions of mean acceleration. (The plot we just saw looked at the first 2 dimensions.) Create a distance matrix, mdist, of the first 3 columns of sub1, by using the R command dist. Use the x[,1:3] notation to specify the columns.
> mdist <- dist(sub1[,1:3])

# Now create the hirarical clustring of mdist. Note: <hclust> use the Euclidean distance as its default metric.
> hclustering <- hclust(mdist)

> myplclust <- function( hclust, lab=hclust$labels, lab.col=rep(1,length(hclust$labels)), hang=0.1,...){
  ## modifiction of plclust for plotting hclust objects *in colour*!
  ## Copyright Eva KF Chan 2009
  ## Arguments:
  ##    hclust:    hclust object
  ##    lab:        a character vector of labels of the leaves of the tree
  ##    lab.col:    colour for the labels; NA=default device foreground colour
  ##    hang:     as in hclust & plclust
  ## Side effect:
  ##    A display of hierarchical cluster with coloured leaf labels.
  y <- rep(hclust$height,2)
  x <- as.numeric(hclust$merge)
  y <- y[which(x<0)]
  x <- x[which(x<0)]
  x <- abs(x)
  y <- y[order(x)]
  x <- x[order(x)]
  plot( hclust, labels=FALSE, hang=hang, ... )
  text( x=x, y=y[hclust$order]-(max(hclust$height)*hang), labels=lab[hclust$order], col=lab.col[hclust$order], srt=90, adj=c(1,0.5), xpd=NA, ... )}

> myplclust(hclustering, lab.col = unclass(sub1$activity))
# see screenshot/Exploratory-Data-Analysis/image-15.png

# Well that dendrogram doesn't look too helpful, does it? There's no clear grouping of colors, except that active colors (blues and magenta) are near each other as are the passive (black, red, and green). So average acceleration doesn't tell us much. How about maximum acceleration? Let's look at that for the first subject (in our array sub1) for the X and Y dimensions. These are in column 10 and 11.
# Here (screenshot/Exploratory-Data-Analysis/image-16.png) they are plotted side by side, X dimension on the left and Y on the right. The x-axis of each show the 300+ observations and the y-axis indicates the maximum acceleration.

# Q: From the 2 plots, what separation, if any, do you see?
# passive activities mostly fall below the walking activities

# Finally we're seeing something vaguely interesting! Let's focus then on the 3 dimensions of maximum acceleration, stored in columns 10 through 12 of sub1.
> mdist <- dist(sub1[,10:12])
> hclustering <- hclust(mdist)
> myplclust(hclustering, lab.col = unclass(sub1$activity))
# see screenshot/Exploratory-Data-Analysis/image-17.png
# Now we see clearly that the data splits into 2 clusters, active and passive activities. Moreover, the light blue (walking down) is clearly distinct from the other walking activities. The dark blue (walking level) also seems to be somewhat clustered. The passive activities, however, seem all jumbled together with no clear pattern visible.
svd1 <- svd(scale(sub1[, -c(562, 563)]))# Recall that the last 2 columns contain activity and subject information which we won't need.

# Q: To see LEFT singular vectors of sub1, which component of svd1 would we examine?
# u

> dim(svd1$u)
# [1] 347 347
# We see that the u matrix is a 347 by 347 matrix. Each row in u corresponds to a row in the matrix sub1. Recall that in sub1 each row has an associated activity.

# Here(screenshot/Exploratory-Data-Analysis/image-18.png) we're looking at the 2 left singular vectors of svd1 (the first 2 columns of svd1$u). Each entry of the columns belongs to a particular row with one of the 6 activities assigned to it. We see the activities distinguished by color. Moving from left to right, the first section of rows are green (standing), the second red (sitting), the third black (laying), etc.  The first column of u shows separation of the nonmoving (black, red, and green) from the walking activities. The second column is harder to interpret. However, the magenta cluster, which represents walking up, seems separate from the others.
# We'll try to figure out why that is. To do that we'll have to find which of the 500+ measurements (represented by the columns of sub1) contributes to the variation of that component. Since we're interested in sub1 columns, we'll look at the RIGHT singular vectors (the columns of svd1$v), and in particular, the second one since the separation of the magenta cluster stood out in the second column of svd1$u.
# Here's(screenshot/Exploratory-Data-Analysis/image-19.png) a plot of the second column of svd1$v. We used transparency in our plotting but nothing clearly stands out here. Let's use clustering to find the feature (out of the 500+) which contributes the most to the variation of this second column of svd1$v.
> maxCon <- which.max(svd1$v[,2])
> mdist <- dist(sub1[,c(10:12,maxCon)])
> hclustering <- hclust(mdist)
> myplclust(hclustering, lab.col = unclass(sub1$activity))
# see screenshot/Exploratory-Data-Analysis/image-20.png

# Now we see some real separation. Magenta (walking up) is on the far left, and the two other walking activities, the two blues, are on the far right, but in separate clusters from one another. The nonmoving activities still are jumbled together.
# see what measurement is associated with this maximum contributor.
> names(sub1[maxCon])
# [1] "fBodyAcc.meanFreq...Z"

# So the mean body acceleration in the frequency domain in the Z direction is the main contributor to this clustering phenomenon we're seeing. Let's move on to k-means clustering to see if this technique can distinguish between the activities.
> kClust <- kmeans(sub1[,-c(562, 563)], centers = 6) # (Recall last 2 columns don't have pertinent information for clustering analysis.), # The second argument to kmeans is centers set equal to 6, the number of activities we know we have.

# Recall that without specifying coordinates for the cluster centroids (as we did), kmeans will generate starting points randomly. Here we did only 1 random start (the default).
> table(kClust$cluster, sub1$activity)

laying sitting standing walk walkdown walkup
# 1      0       0        0    0       49      0
# 2      0       0        0   95        0      0
# 3     29       0        0    0        0      0
# 4      0      37       51    0        0      0
# 5     18      10        2    0        0      0
# 6      3       0        0    0        0     53

# Your exact output will depend on the state of your random number generator. We notice that when we just run with 1 random start, the clusters tend to group the nonmoving activities together in one cluster. The walking activities seem to cluster individually by themselves. You could run the call to kmeans with one random start again and you'll probably get a slightly different result, but instead call kmeans with 3 arguments, the last of which will tell it to try more random starts and return the best one.
> kClust <- kmeans(sub1[,-c(562, 563)], centers = 6, nstart = 100)
> table(kClust$cluster, sub1$activity)
# We see that even with 100 random starts, the passive activities tend to cluster together. One of the clusters contains only laying, but in another cluster, standing and sitting group together.

> dim(kClust$centers)
[1]6  561

# So the centers are a 6 by 561 array. Sometimes it's a good idea to look at the features (columns) of these centers to see if any dominate.
> laying <- which(kClust$size == 29)
> plot(kClust$centers[laying, 1:12], pch = 19, ylab = "Laying Cluster")
# We see the first 3 columns dominate this cluster center.

> names(sub1[,1:3])
# [1] "tBodyAcc.mean...X" "tBodyAcc.mean...Y" "tBodyAcc.mean...Z"
# So the 3 directions of mean body acceleration seem to have the biggest effect on laying.

> walkdown <- which(kClust$size == 49)
> plot(kClust$centers[walkdown, 1:12], pch = 19, ylab = "Walkdown Cluster")
# see screenshot/Exploratory-Data-Analysis/image-22.png
# We see an interesting pattern here. From left to right, looking at the 12 acceleration measurements in groups of 3, the points decrease in value. The X direction dominates, followed by Y then Z. This might tell us something more about the walking down activity.
# We'll wrap up here and hope this example convinced you that real world analysis can be frustrating sometimes and not always obvious. You might have to try several techniques of exploratory data analysis before you hit one that pays off and leads you to the questioms that will be the most promising to explore.
# We saw here that the sensor measurements were pretty good at discriminating between the 3 walking activities, but the passive activities were harder to distinguish from one another. These might require more analysis or an entirely different set of sensory measurements.


######################################################################
# 15: CaseStudy                                                      #
######################################################################

# Slides for this and other Data Science courses may be found at github https://github.com/DataScienceSpecialization/courses/. If you care to use them, they must be downloaded as a zip file and viewed locally. This lesson corresponds to 04_ExploratoryAnalysis/CaseStudy
# In this lesson we'll apply some of the techniques we learned in this course to study air pollution data, specifically particulate matter (we'll call it pm25 sometimes), collected by the U.S. Environmental Protection Agency. This website https://www.health.ny.gov/environmental/indoors/air/pmq_a.htm from New York State offers some basic information on this topic if you're interested.
# Particulate matter (less than 2.5 microns in diameter) is a fancy name for dust, and breathing in dust might pose health hazards to the population. We'll study data from two years, 1999 (when monitoring of particulate matter started) and 2012. Our goal is to see if there's been a noticeable decline in this type of air pollution between these two years.
# We've read in 2 large zipped files for you using the R command read.table (which is smart enough to unzip the files).  We stored the 1999 data in the array pm0 for you.
> dim(pm0)
# [1] 117421      5

> head(pm0)
# V1 V2 V3       V4     V5
# 1  1 27  1 19990103     NA
# 2  1 27  1 19990106     NA
# 3  1 27  1 19990109     NA
# 4  1 27  1 19990112  8.841
# 5  1 27  1 19990115 14.920
# 6  1 27  1 19990118  3.878

# We created the variable cnames containing the 28 column names of the original file.
> cnames
# [1] "# RD|Action Code|State Code|County Code|Site ID|Parameter|POC|Sample Duration|Unit|Method|Date|Start Time|Sample Value|Null Data Code|Sampling Frequency|Monitor Protocol (MP) ID|Qualifier - 1|Qualifier - 2|Qualifier - 3|Qualifier - 4|Qualifier - 5|Qualifier - 6|Qualifier - 7|Qualifier - 8|Qualifier - 9|Qualifier - 10|Alternate Method Detectable Limit|Uncertainty"
cnames <- strsplit(cnames, "|", fixed = TRUE)
> cnames
# [[1]]
# [1] "# RD"                              "Action Code"                      
# [3] "State Code"                        "County Code"                      
# [5] "Site ID"                           "Parameter"                        
# [7] "POC"                               "Sample Duration"                  
# [9] "Unit"                              "Method"                           
# [11] "Date"                              "Start Time"                       
# [13] "Sample Value"                      "Null Data Code"                   
# [15] "Sampling Frequency"                "Monitor Protocol (MP) ID"         
# [17] "Qualifier - 1"                     "Qualifier - 2"                    
# [19] "Qualifier - 3"                     "Qualifier - 4"                    
# [21] "Qualifier - 5"                     "Qualifier - 6"                    
# [23] "Qualifier - 7"                     "Qualifier - 8"                    
# [25] "Qualifier - 9"                     "Qualifier - 10"                   
# [27] "Alternate Method Detectable Limit" "Uncertainty"  

# Nice, but we don't need all these. Assign to names(pm0) the output of a call to the function make.names with cnames[[1]][wcol] as the argument. The variable wcol holds the indices of the 5 columns we selected (from the 28) to use in this lesson, so those are the column names we'll need. As the name suggests, the function "makes syntactically valid names".
names(pm0) <- make.names(cnames[[1]][wcol])
> head(pm0)
# State.Code County.Code Site.ID     Date Sample.Value
# 1          1          27       1 19990103           NA
# 2          1          27       1 19990106           NA
# 3          1          27       1 19990109           NA
# 4          1          27       1 19990112        8.841
# 5          1          27       1 19990115       14.920
# 6          1          27       1 19990118        3.878
# The measurements of particulate matter (pm25) are in the column named Sample.Value.

> x0 <- pm0$Sample.Value
> str(x0)
# num [1:117421] NA NA NA 8.84 14.92 ...

> mean(is.na(x0))
[1] 0.1125608

# Now let's start processing the 2012 data which we stored for you in the array pm1.
> names(pm1) <- make.names(cnames[[1]][wcol])
> dim(pm1)
# [1] 1304287       5

# Wow! Over 1.3 million entries. Particulate matter was first collected in 1999 so perhaps there weren't as many sensors collecting data then as in 2012 when the program was more mature. If you ran head on pm1 you'd see that it looks just like pm0.
> x1 <- pm1$Sample.Value
> mean(is.na(x1))
# [1] 0.05607125

> summary(x0)
# Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's 
#    0.00    7.20   11.50   13.74   17.90  157.10   13217 

> summary(x1)
# Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's 
#  -10.00    4.00    7.63    9.14   12.00  908.97   73133 

# We see that both the median and the mean of measured particulate matter have declined from 1999 to 2012. In fact, all of the measurements, except for the maximum and missing values (Max and NA's), have decreased. Even the Min has gone down from 0 to -10.00! We'll address what a negative measurment might mean a little later. Note that the Max has increased from 157 in 1999 to 909 in 2012. This is quite high and might reflect an error in the table or malfunctions in some monitors.
> boxplot(x0, x1)
# see image-23.png

# Huh? Did somebody step on the boxes? It's hard to see what's going on here. There are so many values outside the boxes and the range of x1 is so big that the boxes are flattened. It might be more informative to call boxplot on the logs (base 10) of x0 and x1.
> boxplot(log10(x0), log10(x1))
# see image-24.png

# A bonus! Not only do we get a better looking boxplot we also get some warnings from R in Red. These let us know that some values in x0 and x1 were "unloggable", no doubt the 0 (Min) we saw in the summary of x0 and the negative values we saw in the Min of the summary of x1.

# Let's return to the question of the negative values in x1. Let's count how many negative values there are.
> negative <- x1 < 0
> sum(negative, na.rm = TRUE)
# [1] 26474

> mean(negative, na.rm = TRUE)
# [1] 0.0215034

# We see that just 2% of the x1 values are negative. Perhaps that's a small enough percentage that we can ignore them. Before we ignore them, though, let's see if they occur during certain times of the year.
> dates <- pm1$Date
> str(dates)
# int [1:1304287] 20120101 20120104 20120107 20120110 20120113 20120116 20120119 20120122 20120125 20120128 ...

# We see dates is a very long vector of integers. However, the format of the entries is hard to read.
> dates <- as.Date(as.character(dates), "%Y%m%d")
> head(dates)
# [1] "2012-01-01" "2012-01-04" "2012-01-07" "2012-01-10" "2012-01-13"
# [6] "2012-01-16

# Let's plot a histogram of the months when the particulate matter measurements are negative.
> hist(dates[negative], "month")
# see image-25.png

# We see the bulk of the negative measurements were taken in the winter months, with a spike in May. Not many of these negative measurements occurred in summer months. We can take a guess that because particulate measures tend to be low in winter and high in summer, coupled with the fact that higher densities are easier to measure, that measurement errors occurred when the values were low. For now we'll attribute these negative measurements to errors. Also, since they account for only 2% of the 2012 data, we'll ignore them.
# Now we'll change focus a bit and instead of looking at all the monitors throughout the country and the data they recorded, we'll try to find one monitor that was taking measurements in both 1999 and 2012. This will allow us to control for different geographical and environmental variables that might have affected air quality in different areas. We'll narrow our search and look just at monitors in New York State.

# We subsetted off the New York State monitor identification data for 1999 and 2012 into 2 vectors, site0 and site1.
> str(site0)
# chr [1:33] "1.5" "1.12" "5.73" "5.80" "5.83" "5.110" "13.11" "27.1004" "29.2" "29.5" ...

# We see that site0 (the IDs of monitors in New York State in 1999) is a vector of 33 strings, each of which has the form "x.y". We've created these from the county codes (the x portion of the string) and the monitor IDs (the y portion). If you ran str on site1 you'd see 18 similar values.
> both <- intersect(site0, site1)
> both
# [1] "1.5"     "1.12"    "5.80"    "13.11"   "29.5"    "31.3"    "63.2008" "67.1015"  "85.55"   "101.3"  
# We see that 10 monitors in New York State were active in both 1999 and 2012.

# To save you some time and typing, we modified the data frames pm0 and pm1 slightly by adding to each of them a new component, county.site. This is just a concatenation of two original components County.Code and Site.ID. We did this to facilitate the next step which is to find out how many measurements were taken by the 10 New York monitors working in both of the years of interest.
> head(pm0)
> head(pm0)
# State.Code County.Code Site.ID     Date Sample.Value county.site
# 1          1          27       1 19990103           NA        27.1
# 2          1          27       1 19990106           NA        27.1
# 3          1          27       1 19990109           NA        27.1
# 4          1          27       1 19990112        8.841        27.1
# 5          1          27       1 19990115       14.920        27.1
# 6          1          27       1 19990118        3.878        27.1
# Now pm0 and pm1 have 6 columns instead of 5, and the last column is a concatenation of two other columns, County and Site.

# Now let's see how many measurements each of the 10 New York monitors that were active in both 1999 and 2012 took in those years. We'll create 2 subsets (one for each year), one of pm0 and the other of pm1.
# The subsets will filter for 2 characteristics. The first is State.Code equal to 36 (the code for New York), and the second is that the county.site (the component we added) is in the vector both.
> cnt0 <- subset(pm0, State.Code == 36 & county.site %in% both)
> cnt1 <- subset(pm1, State.Code == 36 & county.site %in% both)

# split cnt0 into several data frames according to county.site (that is, monitor IDs) and tell us how many measurements each monitor recorded.
> sapply(split(cnt0, cnt0$county.site), nrow)
# 1.12     1.5   101.3   13.11    29.5    31.3    5.80 63.2008 67.1015   85.55 
# 61     122     152      61      61     183      61     122     122       7 

> sapply(split(cnt1, cnt1$county.site), nrow)
# 1.12     1.5   101.3   13.11    29.5    31.3    5.80 63.2008 67.1015   85.55 
# 31      64      31      31      33      15      31      30      31      31 

# We want to examine a monitor with a reasonable number of measurements so let's look at the monitor with ID 63.2008. Create a variable pm0sub which is the subset of cnt0 (this contains just New York data) which has County.Code equal to 63 and Site.ID 2008.
> pm0sub <- subset(cnt0, County.Code == 63 & Site.ID == 2008)
> pm1sub <- subset(cnt1, County.Code == 63 & Site.ID == 2008)

#  Now we'd like to compare the pm25 measurements of this particular monitor (63.2008) for the 2 years. First, create the vector x0sub by assigning to it the Sample.Value component of pm0sub.
> x0sub <- pm0sub$Sample.Value
> x1sub <- pm1sub$Sample.Value

# We'd like to make our comparison visually so we'll have to create a time series of these pm25 measurements. First, create a dates0 variable by assigning to it the output of a call to as.Date. This will take 2 arguments. The first is a call to as.character with pm0sub$Date as the argument. The second is the format string "%Y%m%d".
> dates0 <- as.Date(as.character(pm0sub$Date), "%Y%m%d")
> dates1 <- as.Date(as.character(pm1sub$Date), "%Y%m%d")

# Now we'll plot these 2 time series in the same panel using the base plotting system.
> par(mfrow = c(1,2), mar = c(4,4,2,1))
> plot(dates0, x0sub, pch = 20)
# Now we'll mark the median.
> abline(h = median(x0sub, na.rm=TRUE), lwd = 2)
> plot(dates1, x1sub, pch = 20)
> abline(h = median(x1sub, na.rm=TRUE), lwd = 2)
# see image-26.png

# The 1999 plot shows a much bigger range of pm25 values on the y axis, from below 10 to 40, while the 2012 pm25 values are much more restricted, from around 1 to 14. We should really plot the points of both datasets on the same range of values on the y axis.
> rng <- range(x0sub, x1sub, na.rm = TRUE)
> rng
# [1]  3.0 40.1
# see image-27.png
# Here a new figure we've created showing the two plots side by side with the same range of values on the y axis. We used the argument ylim set equal to rng in our 2 calls to plot. The improvement in the medians between 1999 and 2012 is now clear. Also notice that in 2012 there are no big values (above 15). This shows that not only is there a chronic improvement in air quality, but also there are fewer days with severe pollution.


# The last avenue of this data we'll explore (and we'll do it quickly) concerns a comparison of all the states' mean pollution levels. This is important because the states are responsible for implementing the regulations set at the federal level by the EPA.

# Let's first gather the mean (average measurement) for each state in 1999. Recall that the original data for this year was stored in pm0.
> mn0 <- with(pm0, tapply(Sample.Value, State.Code, mean, na.rm = TRUE))
> str(mn0)
# num [1:53(1d)] 19.96 6.67 10.8 15.68 17.66 ...
# - attr(*, "dimnames")=List of 1
# ..$ : chr [1:53] "1" "2" "4" "5" ...

# We see mn0 is a 53 long numerical vector. Why 53 if there are only 50 states? As it happens, pm25 measurements for the District of Columbia (Washington D.C), the Virgin Islands, and Puerto Rico are included in this data. They are coded as 11, 72, and 78 respectively.

> mn1 <- with(pm1, tapply(Sample.Value, State.Code, mean, na.rm = TRUE))
> str(mn1)
# num [1:52(1d)] 10.13 4.75 8.61 10.56 9.28 ...
# - attr(*, "dimnames")=List of 1
# ..$ : chr [1:52] "1" "2" "4" "5" ...
# So mn1 has only 52 entries, rather than 53. We checked. There are no entries for the Virgin Islands in 2012.

> summary(mn0)
# Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# 4.862   9.519  12.315  12.406  15.640  19.956 

> summary(mn1)
# Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# 4.006   7.355   8.729   8.759  10.613  11.992 


# We see that in all 6 entries, the 2012 numbers are less than those in 1999. Now we'll create 2 new dataframes containing just the state names and their mean measurements for each year. 
> d0 <- data.frame(state = names(mn0), mean = mn0)
> d1 <- data.frame(state = names(mn1), mean = mn1)
> mrg <- merge(d0, d1, by = "state")
> dim(mrg)
# [1] 52  3

# We see merge has 52 rows and 3 columns. Since the Virgin Island data was missing from d1, it is excluded from mrg. 
> head(mrg)
# state    mean.x    mean.y
# 1     1 19.956391 10.126190
# 2    10 14.492895 11.236059
# 3    11 15.786507 11.991697
# 4    12 11.137139  8.239690
# 5    13 19.943240 11.321364
# 6    15  4.861821  8.749336
# Each row of mrg has 3 entries - a state identified by number, a state mean for 1999 (mean.x), and a state mean for 2012 (mean.y).

# Now we'll plot the data to see how the state means changed between the 2 years.

> with(mrg, plot(rep(1,52), mrg[,2], xlim = c(.5, 2.5)))
# plot arguments:
# rep(1,52). This tells the plot routine that the x coordinates for all 52 points are 1
# The second argument is the second column of mrg or mrg[,2] which holds the 1999 data.
# The third argument is the range of x values we want,

# We see a column of points at x=1 which represent the 1999 state means.
# For the second column of points:
# We see a column of points at x=1 which represent the 1999 state means. For the second column of points, again call with with 2 arguments. As before, the first is mrg. The second, however, is a call to the function points with 2 arguments. We need to do this since we're adding points to an already existing plot. The first argument to points is the set of x values, rep(2,52). The second argument is the set of y values, mrg[,3]. Of course, this is the third column of mrg. (We don't need to specify the range of x values again.)
> with(mrg, points(rep(2, 52), mrg[, 3]))
# see image-28.png

# We see a shorter column of points at x=2. Now let's connect the dots. Use the R function segments with 4 arguments. The first 2 are the x and y coordinates of the 1999 points and the last 2 are the x and y coordinates of the 2012 points. As in the previous calls specify the x coordinates with calls to rep and the y coordinates with references to the appropriate columns of mrg.
> segments(rep(1, 52), mrg[, 2], rep(2, 52), mrg[, 3])
# see image-29.png
# We see from the plot that the vast majority of states have indeed improved their particulate matter counts so the general trend is downward. There are a few exceptions. (The topmost point in the 1999 column is actually two points that had very close measurements.)

# For fun, let's see which states had higher means in 2012 than in 1999.
> mrg[mrg$mean.x < mrg$mean.y, ]
# state    mean.x    mean.y
# 6     15  4.861821  8.749336
# 23    31  9.167770  9.207489
# 27    35  6.511285  8.089755
# 33    40 10.657617 10.849870


