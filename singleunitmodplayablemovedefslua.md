# Introduction #

Add your content here.


# Details #

Add your content here.  Format your content with:
  * Text in **bold** or _italic_
  * Headings, paragraphs, and lists
  * Automatic links to other wiki pages
```

local moveDefs ={
{
Name="roler3",--name of the movinfo in the unit file lua
MaxWaterDepth=25,--the deep where the unit can move (near totally submersed for this 3*3)
--MaxWaterSlope=20,--maybe obsolete
--BadWaterSlope=15,--maybe obsolete
MaxSlope=25,--21,--the max angular slope than the unit can move 25 = 45°
--BadSlope=5,--maybe obsolete was the slope where the unit slow
footprintx = 3,--large of the unit(mobile unit get dificut to found way in labyrinth at 3 and + and get dificult to found way in  cross at 5and more
footprintz = 3,--lenght of the unit
--minwaterdepth = 15,
crushstrength = 300,--the damage that the unit inflict to dead corpses as tree and obstacle less than was killed(not sure about alive units
--subMarine = 1,--unknow
--slopemod = 36.7,--unknow
--depthmod = 0,--unknow
},


}return moveDefs

```
not sure about half of the tags if they exist or not ?