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

