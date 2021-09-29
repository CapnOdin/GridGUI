#Position
<figure markdown="1">
Represents a position when only `GridGUI.Position.x` and `GridGUI.Position.y` are given and a square when all four members are set.
</figure>
---
##Members

####h

> **desc**: The height of the square spanning the down from the top left corner consisting of `GridGUI.Position.x` and `GridGUI.Position.y`.

> **type**: number

####w

> **desc**: The width of the square spanning to the right of the top left corner consisting of `GridGUI.Position.x` and `GridGUI.Position.y`.

> **type**: number

####x

> **desc**: The x coordinate of the position, if the optional `GridGUI.Position.w` and `GridGUI.Position.h` are non zero then `GridGUI.Position.x` is the x coordinate of the top left corner of the square spanning `GridGUI.Position.w` and `GridGUI.Position.h` down towards the right.

> **type**: number

####y

> **desc**: The y coordinate of the position, if the optional `GridGUI.Position.w` and `GridGUI.Position.h` are non zero then `GridGUI.Position.y` is the y coordinate of the top left corner of the square spanning `GridGUI.Position.w` and `GridGUI.Position.h` down towards the right.

> **type**: number

##Methods

####__CompareX
**desc**: Compares the relative position along the x-axis with another `GridGUI.Position`.

**args**:

> **name**: pos

> **desc**: The `GridGUI.Position` to compare with.

> **type**: GridGUI.Position

**returns**:

> **desc**: Positive values are the amount of overlap, negative values are the distance and zero mean that the rangers are touching.

> **type**: number

####__CompareY
**desc**: Compares the relative position along the y-axis with another `GridGUI.Position`.

**args**:

> **name**: pos

> **desc**: The `GridGUI.Position` to compare with.

> **type**: GridGUI.Position

**returns**:

> **desc**: Positive values are the amount of overlap, negative values are the distance and zero mean that the rangers are touching.

> **type**: number

####__New
**desc**: Constructor.

**args**:

> **name**: x

> **desc**: The x coordinate of the position, if the optional `GridGUI.Position.w` and `GridGUI.Position.h` are non zero then `GridGUI.Position.x` is the x coordinate of the top left corner of the square spanning `GridGUI.Position.w` and `GridGUI.Position.h` down towards the right.

> **type**: string|number|object

> **name**: y

> **desc**: The y coordinate of the position, if the optional `GridGUI.Position.w` and `GridGUI.Position.h` are non zero then `GridGUI.Position.y` is the y coordinate of the top left corner of the square spanning `GridGUI.Position.w` and `GridGUI.Position.h` down towards the right.

> **type**: string|number|object

> **name**: w

> **desc**: The width of the square spanning to the right of the top left corner consisting of `GridGUI.Position.x` and `GridGUI.Position.y`.

> **type**: number

> **name**: h

> **desc**: The height of the square spanning the down from the top left corner consisting of `GridGUI.Position.x` and `GridGUI.Position.y`.

> **type**: number

**returns**:

> **desc**: A new `GridGUI.Position` instance.

> **type**: GridGUI.Position

####__OneDimentionalCompare
**desc**: Compares the amount of overlap between two ranges.

**args**:

> **name**: min1

> **desc**: The minimum of the first range.

> **type**: number

> **name**: max1

> **desc**: The maximum of the first range.

> **type**: number

> **name**: min2

> **desc**: The minimum of the second range.

> **type**: number

> **name**: max2

> **desc**: The maximum of the second range.

> **type**: number

**returns**:

> **desc**: Positive values are the amount of overlap, negative values are the distance and zero mean that the rangers are touching.

> **type**: number

####__OverlapX
**desc**: Compares the amount of overlap along the x-axis with another `GridGUI.Position`.

**args**:

> **name**: pos

> **desc**: The `GridGUI.Position` to compare with.

> **type**: GridGUI.Position

**returns**:

> **desc**: The amount of overlap.

> **type**: number

####__OverlapY
**desc**: Compares the amount of overlap along the y-axis with another `GridGUI.Position`.

**args**:

> **name**: pos

> **desc**: The `GridGUI.Position` to compare with.

> **type**: GridGUI.Position

**returns**:

> **desc**: The amount of overlap.

> **type**: number

####Area
**desc**: Calculates the area of the square with sides `GridGUI.Position.w` and `GridGUI.Position.h`.

**returns**:

> **desc**: The area.

> **type**: number

####Compare
**desc**: Compares the relative position along the x-axis and the y-axis with another `GridGUI.Position`.

**args**:

> **name**: pos

> **desc**: The `GridGUI.Position` to compare with.

> **type**: GridGUI.Position

**returns**:

> **desc**: An array with the result of the two one dimensional comparisons. The result of the x-axis comparison is in index 1 and the result of the y-axis comparison is in index 2.

> **type**: array

####Contains
**desc**: Check if a `GridGUI.Position` is contained within the area of this position.

**args**:

> **name**: pos

> **desc**: The `GridGUI.Position` to perform the check on.

> **type**: GridGUI.Position

**returns**:

> **desc**: Whether or not `pos` was contained within this position.

> **type**: bool

####Copy
**desc**: Copy Constructor.

**returns**:

> **desc**: An identical copy of this position.

> **type**: GridGUI.Position

####Disjoint
**desc**: Check if a `GridGUI.Position` does not touch this position.

**args**:

> **name**: pos

> **desc**: The `GridGUI.Position` to perform the check on.

> **type**: GridGUI.Position

**returns**:

> **desc**: Whether or not `pos` touches this position.

> **type**: bool

####Equal
**desc**: Check if a `GridGUI.Position` is identical to this position.

**args**:

> **name**: pos

> **desc**: The `GridGUI.Position` to compare with.

> **type**: GridGUI.Position

**returns**:

> **desc**: Whether or not `pos` is identical to this position.

> **type**: bool

####Intersect
**desc**: Check if a `GridGUI.Position` overlaps with this position, that is that at least one corner of one of the two `GridGUI.Position` is within the other `GridGUI.Position`.

**args**:

> **name**: pos

> **desc**: The `GridGUI.Position` to perform the check on.

> **type**: GridGUI.Position

**returns**:

> **desc**: Whether or not `pos` intersects with this position

> **type**: bool

####Middle
**desc**: Calculates the middle of this position.

**returns**:

> **desc**: A new `GridGUI.Position` instance with `GridGUI.Position.x` and `GridGUI.Position.y` being the middle of this position.

> **type**: GridGUI.Position

####ToStr
**desc**: Converts the object to a string.

**args**:

> **name**: indent

> **desc**: The amount of indentation to add on each line.

> **type**: string

**returns**:

> **desc**: A string representing this position.

> **type**: string

####Touch
**desc**: Check if a `GridGUI.Position` touches this position, but not overlap with it.

**args**:

> **name**: pos

> **desc**: The `GridGUI.Position` to perform the check on.

> **type**: GridGUI.Position

**returns**:

> **desc**: Whether or not `pos` is touches this position.

> **type**: bool

