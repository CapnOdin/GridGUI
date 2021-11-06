#Position
<figure markdown="1">

</figure>
---
##Members

!!! info ""

    ####h
    !!! info ""

        **desc**: The height of the square spanning the down from the top left corner consisting of [`GridGUI.Position.x`](../Position/#x) and [`GridGUI.Position.y`](../Position/#y).

        **type**: number

        **default**: 0

!!! info ""

    ####w
    !!! info ""

        **desc**: The width of the square spanning to the right of the top left corner consisting of [`GridGUI.Position.x`](../Position/#x) and [`GridGUI.Position.y`](../Position/#y).

        **type**: number

        **default**: 0

!!! info ""

    ####x
    !!! info ""

        **desc**: The x coordinate of the position, if the optional [`GridGUI.Position.w`](../Position/#w) and [`GridGUI.Position.h`](../Position/#h) are non zero then [`GridGUI.Position.x`](../Position/#x) is the x coordinate of the top left corner of the square spanning [`GridGUI.Position.w`](../Position/#w) and [`GridGUI.Position.h`](../Position/#h) down towards the right.

        **type**: number

!!! info ""

    ####y
    !!! info ""

        **desc**: The y coordinate of the position, if the optional [`GridGUI.Position.w`](../Position/#w) and [`GridGUI.Position.h`](../Position/#h) are non zero then [`GridGUI.Position.y`](../Position/#y) is the y coordinate of the top left corner of the square spanning [`GridGUI.Position.w`](../Position/#w) and [`GridGUI.Position.h`](../Position/#h) down towards the right.

        **type**: number

##Methods

!!! note ""
    ####__CompareX
    !!! tip ""

        ```AutoHotKey
        __CompareX(pos)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Compares the relative position along the x-axis with another [`GridGUI.Position`](../Position/).



    ??? example "parameters"

        !!! info ""

            **name**: pos

            **desc**: The [`GridGUI.Position`](../Position/) to compare with.

            **type**: [GridGUI.Position](../Position/)

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: Positive values are the amount of overlap, negative values are the distance and zero mean that the ranges are touching.

            **type**: number

!!! note ""
    ####__CompareY
    !!! tip ""

        ```AutoHotKey
        __CompareY(pos)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Compares the relative position along the y-axis with another [`GridGUI.Position`](../Position/).



    ??? example "parameters"

        !!! info ""

            **name**: pos

            **desc**: The [`GridGUI.Position`](../Position/) to compare with.

            **type**: [GridGUI.Position](../Position/)

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: Positive values are the amount of overlap, negative values are the distance and zero mean that the ranges are touching.

            **type**: number

!!! note ""
    ####__New
    !!! tip ""

        ```AutoHotKey
        __New(x, y, w := 0, h := 0)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Constructor.



    ??? example "parameters"

        !!! info ""

            **name**: x

            **desc**: The x coordinate of the position, if the optional [`GridGUI.Position.w`](../Position/#w) and [`GridGUI.Position.h`](../Position/#h) are non zero then [`GridGUI.Position.x`](../Position/#x) is the x coordinate of the top left corner of the square spanning [`GridGUI.Position.w`](../Position/#w) and [`GridGUI.Position.h`](../Position/#h) down towards the right.

            **type**: string|number|object

        !!! info ""

            **name**: y

            **desc**: The y coordinate of the position, if the optional [`GridGUI.Position.w`](../Position/#w) and [`GridGUI.Position.h`](../Position/#h) are non zero then [`GridGUI.Position.y`](../Position/#y) is the y coordinate of the top left corner of the square spanning [`GridGUI.Position.w`](../Position/#w) and [`GridGUI.Position.h`](../Position/#h) down towards the right.

            **type**: string|number|object

        !!! info ""

            **name**: w

            **desc**: The width of the square spanning to the right of the top left corner consisting of [`GridGUI.Position.x`](../Position/#x) and [`GridGUI.Position.y`](../Position/#y).

            **type**: number

            **default**: 0

        !!! info ""

            **name**: h

            **desc**: The height of the square spanning the down from the top left corner consisting of [`GridGUI.Position.x`](../Position/#x) and [`GridGUI.Position.y`](../Position/#y).

            **type**: number

            **default**: 0

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: A new [`GridGUI.Position`](../Position/) instance.

            **type**: [GridGUI.Position](../Position/)

!!! note ""
    ####__OneDimentionalCompare
    !!! tip ""

        ```AutoHotKey
        __OneDimentionalCompare(min1, max1, min2, max2)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Compares the amount of overlap between two ranges.



    ??? example "parameters"

        !!! info ""

            **name**: min1

            **desc**: The minimum of the first range.

            **type**: number

        !!! info ""

            **name**: max1

            **desc**: The maximum of the first range.

            **type**: number

        !!! info ""

            **name**: min2

            **desc**: The minimum of the second range.

            **type**: number

        !!! info ""

            **name**: max2

            **desc**: The maximum of the second range.

            **type**: number

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: Positive values are the amount of overlap, negative values are the distance and zero mean that the ranges are touching.

            **type**: number

!!! note ""
    ####__OverlapX
    !!! tip ""

        ```AutoHotKey
        __OverlapX(pos)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Compares the amount of overlap along the x-axis with another [`GridGUI.Position`](../Position/).



    ??? example "parameters"

        !!! info ""

            **name**: pos

            **desc**: The [`GridGUI.Position`](../Position/) to compare with.

            **type**: [GridGUI.Position](../Position/)

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: The amount of overlap.

            **type**: number

!!! note ""
    ####__OverlapY
    !!! tip ""

        ```AutoHotKey
        __OverlapY(pos)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Compares the amount of overlap along the y-axis with another [`GridGUI.Position`](../Position/).



    ??? example "parameters"

        !!! info ""

            **name**: pos

            **desc**: The [`GridGUI.Position`](../Position/) to compare with.

            **type**: [GridGUI.Position](../Position/)

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: The amount of overlap.

            **type**: number

!!! note ""
    ####Area
    !!! tip ""

        ```AutoHotKey
        Area()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Calculates the area of the square with sides [`GridGUI.Position.w`](../Position/#w) and [`GridGUI.Position.h`](../Position/#h).



    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: The area.

            **type**: number

!!! note ""
    ####Compare
    !!! tip ""

        ```AutoHotKey
        Compare(pos)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Compares the relative position along the x-axis and the y-axis with another [`GridGUI.Position`](../Position/).



    ??? example "parameters"

        !!! info ""

            **name**: pos

            **desc**: The [`GridGUI.Position`](../Position/) to compare with.

            **type**: [GridGUI.Position](../Position/)

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: An array with the result of the two one dimensional comparisons. The result of the x-axis comparison is in index 1 and the result of the y-axis comparison is in index 2.

            **type**: array

!!! note ""
    ####Contains
    !!! tip ""

        ```AutoHotKey
        Contains(pos)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Check if a [`GridGUI.Position`](../Position/) is contained within the area of this position.



    ??? example "parameters"

        !!! info ""

            **name**: pos

            **desc**: The [`GridGUI.Position`](../Position/) to perform the check on.

            **type**: [GridGUI.Position](../Position/)

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: Whether or not `pos` was contained within this position.

            **type**: bool

!!! note ""
    ####Copy
    !!! tip ""

        ```AutoHotKey
        Copy()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Copy Constructor.



    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: An identical copy of this position.

            **type**: [GridGUI.Position](../Position/)

!!! note ""
    ####Disjoint
    !!! tip ""

        ```AutoHotKey
        Disjoint(pos)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Check if a [`GridGUI.Position`](../Position/) does not touch this position.



    ??? example "parameters"

        !!! info ""

            **name**: pos

            **desc**: The [`GridGUI.Position`](../Position/) to perform the check on.

            **type**: [GridGUI.Position](../Position/)

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: Whether or not `pos` touches this position.

            **type**: bool

!!! note ""
    ####Equal
    !!! tip ""

        ```AutoHotKey
        Equal(pos)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Check if a [`GridGUI.Position`](../Position/) is identical to this position.



    ??? example "parameters"

        !!! info ""

            **name**: pos

            **desc**: The [`GridGUI.Position`](../Position/) to compare with.

            **type**: [GridGUI.Position](../Position/)

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: Whether or not `pos` is identical to this position.

            **type**: bool

!!! note ""
    ####Intersect
    !!! tip ""

        ```AutoHotKey
        Intersect(pos)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Check if a [`GridGUI.Position`](../Position/) overlaps with this position, that is that at least one corner of one of the two [`GridGUI.Position`](../Position/) is within the other [`GridGUI.Position`](../Position/).



    ??? example "parameters"

        !!! info ""

            **name**: pos

            **desc**: The [`GridGUI.Position`](../Position/) to perform the check on.

            **type**: [GridGUI.Position](../Position/)

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: Whether or not `pos` intersects with this position

            **type**: bool

!!! note ""
    ####Middle
    !!! tip ""

        ```AutoHotKey
        Middle()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Calculates the middle of this position.



    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: A new [`GridGUI.Position`](../Position/) instance with [`GridGUI.Position.x`](../Position/#x) and [`GridGUI.Position.y`](../Position/#y) being the middle of this position.

            **type**: [GridGUI.Position](../Position/)

!!! note ""
    ####ToStr
    !!! tip ""

        ```AutoHotKey
        ToStr(indent := "")
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Converts the object to a string.



    ??? example "parameters"

        !!! info ""

            **name**: indent

            **desc**: The amount of indentation to add on each line.

            **type**: string

            **default**: ""

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: A string representing this position.

            **type**: string

!!! note ""
    ####Touch
    !!! tip ""

        ```AutoHotKey
        Touch(pos)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Check if a [`GridGUI.Position`](../Position/) touches this position, but does not overlap with it.



    ??? example "parameters"

        !!! info ""

            **name**: pos

            **desc**: The [`GridGUI.Position`](../Position/) to perform the check on.

            **type**: [GridGUI.Position](../Position/)

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: Whether or not `pos` is touching this position.

            **type**: bool

