#ExpanderArbitrator
<figure markdown="1">

</figure>
---
##Members

!!! info ""

    ####ConflictLst
    !!! info ""

        **desc**: Two collections of which expanding [`GridGUI.Cell`](../Cell/)s needs to share the available GUI size with a specific expanding [`GridGUI.Cell`](../Cell/). That is for an expanding [`GridGUI.Cell`](../Cell/) `c` the horizontally expanding [`GridGUI.Cell`](../Cell/)s `o` in another column will be stored under `["W"][c][i]` where `i` is the index of `o` and similar for the vertically expanding cells they are stored under `"H"`.

        **type**: associative array

        **default**: {"W": {}, "H": {}}

!!! info ""

    ####ConflictMap
    !!! info ""

        **desc**: Two collections of which expanding [`GridGUI.Cell`](../Cell/)s needs to share the available GUI size with a specific expanding [`GridGUI.Cell`](../Cell/). That is for an expanding [`GridGUI.Cell`](../Cell/) `c` the horizontally expanding [`GridGUI.Cell`](../Cell/)s `o` in another column will be stored under `["W"][c][o]` and similar for the vertically expanding cells they are stored under `"H"`.

        **type**: associative array

        **default**: {"W": {}, "H": {}}

!!! info ""

    ####Expanders
    !!! info ""

        **desc**: Array of all expanding [`GridGUI.Cell`](../Cell/)s in the grid.

        **type**: array

        **default**: []

!!! info ""

    ####Ignore
    !!! info ""

        **desc**: Two collections of which expanding [`GridGUI.Cell`](../Cell/)s are similar to cells that have already been accounted for in relation to a specific cell.

        **type**: associative array

        **default**: {"W": {}, "H": {}}

!!! info ""

    ####IsReduced
    !!! info ""

        **desc**: Whether or not [`GridGUI.ExpanderArbitrator.ConflictMap`](../ExpanderArbitrator/#conflictmap) has been reduced yet. If true then the entries in [`GridGUI.ExpanderArbitrator.ReducedConflict`](../ExpanderArbitrator/#reducedconflict) will be populated with a sub set of the entries in [`GridGUI.ExpanderArbitrator.ConflictMap`](../ExpanderArbitrator/#conflictmap).

        **type**: bool

        **default**: false

!!! info ""

    ####Overlapping
    !!! info ""

        **desc**: Two collections of which expanding [`GridGUI.Cell`](../Cell/)s overlap a given expanding [`GridGUI.Cell`](../Cell/). That is for an expanding [`GridGUI.Cell`](../Cell/) `c` the horizontally overlapping [`GridGUI.Cell`](../Cell/)s `o` will be stored under `["W"][c][o]` and similar for the vertically overlapping cells they are stored under `"H"`.

        **type**: associative array

        **default**: {"W": {}, "H": {}}

!!! info ""

    ####ReducedConflict
    !!! info ""

        **desc**: Two collections of only the expanding [`GridGUI.Cell`](../Cell/)s in [`GridGUI.ExpanderArbitrator.ConflictMap`](../ExpanderArbitrator/#conflictmap) that can't be ignored in relation to an expanding [`GridGUI.Cell`](../Cell/). That is for an expanding [`GridGUI.Cell`](../Cell/) `c` the horizontally expanding [`GridGUI.Cell`](../Cell/)s `o` in another column will be stored under `["W"][c][o]` and similar for the vertically expanding cells they are stored under `"H"`.

        **type**: associative array

        **default**: {"W": {}, "H": {}}

##Methods

!!! note ""
    ####__New
    !!! tip ""

        ```AutoHotKey
        __New()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Constructor.



    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: A new [`GridGUI.ExpanderArbitrator`](../ExpanderArbitrator/) instance.

            **type**: [GridGUI.ExpanderArbitrator](../ExpanderArbitrator/)

!!! note ""
    ####Add
    !!! tip ""

        ```AutoHotKey
        Add(c)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Adds a [`GridGUI.Cell`](../Cell/) to the [`GridGUI.ExpanderArbitrator`](../ExpanderArbitrator/) members if the cell expands, that is if either [`GridGUI.Cell.exW`](../Cell/#exw) or [`GridGUI.Cell.exH`](../Cell/#exh) are non zero.



    ??? example "parameters"

        !!! info ""

            **name**: c

            **desc**: The [`GridGUI.Cell`](../Cell/) to add to the [`GridGUI.ExpanderArbitrator`](../ExpanderArbitrator/).

            **type**: [GridGUI.Cell](../Cell/)

!!! note ""
    ####CheckConflicts
    !!! tip ""

        ```AutoHotKey
        CheckConflicts(c, expander)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Checks if the an expanding [`GridGUI.Cell`](../Cell/) is in conflict with one another expanding cell and updates [`GridGUI.ExpanderArbitrator.ConflictLst`](../ExpanderArbitrator/#conflictlst) and [`GridGUI.ExpanderArbitrator.ConflictMap`](../ExpanderArbitrator/#conflictmap) if they are. This function is intended for checking new expanding cells against already managed expanding cells.



    ??? example "parameters"

        !!! info ""

            **name**: c

            **desc**: The expanding [`GridGUI.Cell`](../Cell/) to check for a conflict.

            **type**: [GridGUI.Cell](../Cell/)

        !!! info ""

            **name**: expander

            **desc**: The expanding [`GridGUI.Cell`](../Cell/) to check for a conflict against.

            **type**: [GridGUI.Cell](../Cell/)

!!! note ""
    ####CheckOverlapping
    !!! tip ""

        ```AutoHotKey
        CheckOverlapping(c, expander)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Checks if the an expanding [`GridGUI.Cell`](../Cell/) overlaps another expanding cell and updates [`GridGUI.ExpanderArbitrator.Overlapping`](../ExpanderArbitrator/#overlapping) if they are. This function is intended for checking new expanding cells against already managed expanding cells.



    ??? example "parameters"

        !!! info ""

            **name**: c

            **desc**: The expanding [`GridGUI.Cell`](../Cell/) to check if it overlaps `expander`.

            **type**: [GridGUI.Cell](../Cell/)

        !!! info ""

            **name**: expander

            **desc**: The expanding [`GridGUI.Cell`](../Cell/) to check if it overlaps `c`.

            **type**: [GridGUI.Cell](../Cell/)

!!! note ""
    ####Init
    !!! tip ""

        ```AutoHotKey
        Init(c)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Adds a expanding [`GridGUI.Cell`](../Cell/) to the members of this [`GridGUI.ExpanderArbitrator`](../ExpanderArbitrator/) so that they can be populated with data later.



    ??? example "parameters"

        !!! info ""

            **name**: c

            **desc**: The expanding [`GridGUI.Cell`](../Cell/) to add to the [`GridGUI.ExpanderArbitrator`](../ExpanderArbitrator/) members.

            **type**: [GridGUI.Cell](../Cell/)

!!! note ""
    ####InitCheck
    !!! tip ""

        ```AutoHotKey
        InitCheck(c)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Runs [`GridGUI.ExpanderArbitrator.CheckConflicts`](../ExpanderArbitrator/#checkconflicts) and [`GridGUI.ExpanderArbitrator.CheckOverlapping`](../ExpanderArbitrator/#checkoverlapping) for an expanding [`GridGUI.Cell`](../Cell/) against each cell in [`GridGUI.ExpanderArbitrator.Expanders`](../ExpanderArbitrator/#expanders)



    ??? example "parameters"

        !!! info ""

            **name**: c

            **desc**: The expanding [`GridGUI.Cell`](../Cell/) to check against the already managed expanding cells.

            **type**: [GridGUI.Cell](../Cell/)

!!! note ""
    ####IsExpander
    !!! tip ""

        ```AutoHotKey
        IsExpander(c)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Check if a [`GridGUI.Cell`](../Cell/) expands.



    ??? example "parameters"

        !!! info ""

            **name**: c

            **desc**: The [`GridGUI.Cell`](../Cell/) to check.

            **type**: [GridGUI.Cell](../Cell/)

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: Returns `true` if either [`GridGUI.Cell.exW`](../Cell/#exw) or [`GridGUI.Cell.exH`](../Cell/#exh) of `c` are non zero otherwise `false` is returned.

            **type**: bool

!!! note ""
    ####IsInHeightConflictWith
    !!! tip ""

        ```AutoHotKey
        IsInHeightConflictWith(c1, c2)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Checks if two [`GridGUI.Cell`](../Cell/)s are in vertical expanding conflict with each other.



    ??? example "parameters"

        !!! info ""

            **name**: c1

            **desc**: A [`GridGUI.Cell`](../Cell/) to compare with `c2`.

            **type**: [GridGUI.Cell](../Cell/)

        !!! info ""

            **name**: c2

            **desc**: A [`GridGUI.Cell`](../Cell/) to compare with `c1`.

            **type**: [GridGUI.Cell](../Cell/)

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: Returns `true` if both `c1` and `c2` have non zero [`GridGUI.Cell.exH`](../Cell/#exh) and their [`GridGUI.Cell.gridpos`](../Cell/#gridpos) does not overlap along the y-axis. Otherwise `false` is returned.

            **type**: bool

!!! note ""
    ####IsInWidthConflictWith
    !!! tip ""

        ```AutoHotKey
        IsInWidthConflictWith(c1, c2)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Checks if two [`GridGUI.Cell`](../Cell/)s are in horizontal expanding conflict with each other.



    ??? example "parameters"

        !!! info ""

            **name**: c1

            **desc**: A [`GridGUI.Cell`](../Cell/) to compare with `c2`.

            **type**: [GridGUI.Cell](../Cell/)

        !!! info ""

            **name**: c2

            **desc**: A [`GridGUI.Cell`](../Cell/) to compare with `c1`.

            **type**: [GridGUI.Cell](../Cell/)

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: Returns `true` if both `c1` and `c2` have non zero [`GridGUI.Cell.exW`](../Cell/#exw) and their [`GridGUI.Cell.gridpos`](../Cell/#gridpos) does not overlap along the x-axis. Otherwise `false` is returned.

            **type**: bool

!!! note ""
    ####ReCalculate
    !!! tip ""

        ```AutoHotKey
        ReCalculate()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Checks if the expanding [`GridGUI.ExpanderArbitrator.ReducedConflict`](../ExpanderArbitrator/#reducedconflict) has already been calculated, if not then it calculates it and updates the managed [`GridGUI.Cell`](../Cell/)s.



!!! note ""
    ####Reduce
    !!! tip ""

        ```AutoHotKey
        Reduce()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Checks the [`GridGUI.ExpanderArbitrator.ConflictMap`](../ExpanderArbitrator/#conflictmap) for expanders that can be ignored in certain cased and populates [`GridGUI.ExpanderArbitrator.ReducedConflict`](../ExpanderArbitrator/#reducedconflict) with the reduced conflict data.



!!! note ""
    ####Remove
    !!! tip ""

        ```AutoHotKey
        Remove(c)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Removes a [`GridGUI.Cell`](../Cell/) from the [`GridGUI.ExpanderArbitrator`](../ExpanderArbitrator/) members.



    ??? example "parameters"

        !!! info ""

            **name**: c

            **desc**: The [`GridGUI.Cell`](../Cell/) to remove from the [`GridGUI.ExpanderArbitrator`](../ExpanderArbitrator/).

            **type**: [GridGUI.Cell](../Cell/)

!!! note ""
    ####SortConflicts
    !!! tip ""

        ```AutoHotKey
        SortConflicts()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Sorts the [`GridGUI.ExpanderArbitrator.ConflictLst`](../ExpanderArbitrator/#conflictlst) by the grid size of the [`GridGUI.Cell`](../Cell/)s, that is by how many column and rows the cell spans over.



!!! note ""
    ####UnInit
    !!! tip ""

        ```AutoHotKey
        UnInit(c)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Undoes what [`GridGUI.ExpanderArbitrator.Init`](../ExpanderArbitrator/#init) does, that is it Deletes all the objects that are indexed in the [`GridGUI.ExpanderArbitrator`](../ExpanderArbitrator/) members under a [`GridGUI.Cell`](../Cell/).



    ??? example "parameters"

        !!! info ""

            **name**: c

            **desc**: The [`GridGUI.Cell`](../Cell/) to remove from the [`GridGUI.ExpanderArbitrator`](../ExpanderArbitrator/) members.

            **type**: [GridGUI.Cell](../Cell/)

!!! note ""
    ####UnInitCheck
    !!! tip ""

        ```AutoHotKey
        UnInitCheck(c)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Undoes what [`GridGUI.ExpanderArbitrator.InitCheck`](../ExpanderArbitrator/#initcheck) does, that is it removes the [`GridGUI.Cell`](../Cell/) from the other cells managed by this [`GridGUI.ExpanderArbitrator`](../ExpanderArbitrator/).



    ??? example "parameters"

        !!! info ""

            **name**: c

            **desc**: The [`GridGUI.Cell`](../Cell/) to remove from the [`GridGUI.ExpanderArbitrator`](../ExpanderArbitrator/) members indexed under other cells.

            **type**: [GridGUI.Cell](../Cell/)

!!! note ""
    ####Update
    !!! tip ""

        ```AutoHotKey
        Update(c)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Updates the [`GridGUI.Cell.othersW`](../Cell/#othersw) and [`GridGUI.Cell.othersH`](../Cell/#othersh) members of a [`GridGUI.Cell`](../Cell/) that is managed by this [`GridGUI.ExpanderArbitrator`](../ExpanderArbitrator/).



    ??? example "parameters"

        !!! info ""

            **name**: c

            **desc**: The [`GridGUI.Cell`](../Cell/) to update.

            **type**: [GridGUI.Cell](../Cell/)

