#ExpanderArbitrator
<figure markdown="1">

</figure>
---
##Members

####ConflictLst

> **desc**: Two collections of which expanding [`GridGUI.Cell`](../Cell/)s needs to share the available GUI size with a specific expanding [`GridGUI.Cell`](../Cell/). That is for an expanding [`GridGUI.Cell`](../Cell/) `c` the horisontally expanding [`GridGUI.Cell`](../Cell/)s `o` in another column will be stored under `["W"][c][i]` where `i` is the index of `o` and similar for the vertically expanding cells they are stored under `"H"`.

> **type**: associative array

> **default**: {"W": {}, "H": {}}

####ConflictMap

> **desc**: Two collections of which expanding [`GridGUI.Cell`](../Cell/)s needs to share the available GUI size with a specific expanding [`GridGUI.Cell`](../Cell/). That is for an expanding [`GridGUI.Cell`](../Cell/) `c` the horisontally expanding [`GridGUI.Cell`](../Cell/)s `o` in another column will be stored under `["W"][c][o]` and similar for the vertically expanding cells they are stored under `"H"`.

> **type**: associative array

> **default**: {"W": {}, "H": {}}

####Expanders

> **desc**: Array of all expanding [`GridGUI.Cell`](../Cell/)s in the grid.

> **type**: array

> **default**: []

####Ignore

> **desc**: Two collections of which expanding [`GridGUI.Cell`](../Cell/)s are similar to cells that have already been accounted for in relation to a specific cell.

> **type**: associative array

> **default**: {"W": {}, "H": {}}

####IsReduced

> **desc**: Whether or not [`GridGUI.ExpanderArbitrator.ConflictMap`](../ExpanderArbitrator/#conflictmap) has been reduced yet. If true then the entries in [`GridGUI.ExpanderArbitrator.ReducedConflict`](../ExpanderArbitrator/#reducedconflict) will be populated with a sub set of the entries in [`GridGUI.ExpanderArbitrator.ConflictMap`](../ExpanderArbitrator/#conflictmap).

> **type**: bool

####Overlapping

> **desc**: Two collections of which expanding [`GridGUI.Cell`](../Cell/)s overlap a given expanding [`GridGUI.Cell`](../Cell/). That is for an expanding [`GridGUI.Cell`](../Cell/) `c` the horisontally overlapping [`GridGUI.Cell`](../Cell/)s `o` will be stored under `["W"][c][o]` and similar for the vertically overlapping cells they are stored under `"H"`.

> **type**: associative array

> **default**: {"W": {}, "H": {}}

####ReducedConflict

> **desc**: Two collections of only the expanding [`GridGUI.Cell`](../Cell/)s in [`GridGUI.ExpanderArbitrator.ConflictMap`](../ExpanderArbitrator/#conflictmap) that can't be ignored in relation to an expanding [`GridGUI.Cell`](../Cell/). That is for an expanding [`GridGUI.Cell`](../Cell/) `c` the horisontally expanding [`GridGUI.Cell`](../Cell/)s `o` in another column will be stored under `["W"][c][o]` and similar for the vertically expanding cells they are stored under `"H"`.

> **type**: associative array

> **default**: {"W": {}, "H": {}}

##Methods

####__New
**desc**: Constructor.

**returns**:

> **desc**: A new [`GridGUI.ExpanderArbitrator`](../ExpanderArbitrator/) instance.

> **type**: GridGUI.ExpanderArbitrator

####Add
**desc**: Adds a [`GridGUI.Cell`](../Cell/) to the [`GridGUI.ExpanderArbitrator`](../ExpanderArbitrator/) members if the cell expands, that is if either [`GridGUI.Cell.exW`](../Cell/#exw) or [`GridGUI.Cell.exH`](../Cell/#exh) are non zero.

**args**:

> **name**: c

> **desc**: The [`GridGUI.Cell`](../Cell/) to add to the [`GridGUI.ExpanderArbitrator`](../ExpanderArbitrator/).

> **type**: [GridGUI.Cell](../Cell/)

####CheckConflicts
**desc**: Checks if the an expanding [`GridGUI.Cell`](../Cell/) is in conflict with one another expanding cell and updates [`GridGUI.ExpanderArbitrator.ConflictLst`](../ExpanderArbitrator/#conflictlst) and [`GridGUI.ExpanderArbitrator.ConflictMap`](../ExpanderArbitrator/#conflictmap) if they are. This function is intended for checking new expanding cells against already managed expanding cells.

**args**:

> **name**: c

> **desc**: The expanding [`GridGUI.Cell`](../Cell/) to check for a conflict.

> **type**: [GridGUI.Cell](../Cell/)

> **name**: expander

> **desc**: The expanding [`GridGUI.Cell`](../Cell/) to check for a conflict against.

> **type**: [GridGUI.Cell](../Cell/)

####CheckOverlapping
**desc**: Checks if the an expanding [`GridGUI.Cell`](../Cell/) overlaps another expanding cell and updates [`GridGUI.ExpanderArbitrator.Overlapping`](../ExpanderArbitrator/#overlapping) if they are. This function is intended for checking new expanding cells against already managed expanding cells.

**args**:

> **name**: c

> **desc**: The expanding [`GridGUI.Cell`](../Cell/) to check if it overlaps `expander`.

> **type**: [GridGUI.Cell](../Cell/)

> **name**: expander

> **desc**: The expanding [`GridGUI.Cell`](../Cell/) to check if it overlaps `c`.

> **type**: [GridGUI.Cell](../Cell/)

####Init
**desc**: Adds a expanding [`GridGUI.Cell`](../Cell/) to the members of this [`GridGUI.ExpanderArbitrator`](../ExpanderArbitrator/) so that they can be populated with data later.

**args**:

> **name**: c

> **desc**: The expanding [`GridGUI.Cell`](../Cell/) to add to the [`GridGUI.ExpanderArbitrator`](../ExpanderArbitrator/) members.

> **type**: [GridGUI.Cell](../Cell/)

####InitCheck
**desc**: Runs [`GridGUI.ExpanderArbitrator.CheckConflicts`](../ExpanderArbitrator/#checkconflicts) and [`GridGUI.ExpanderArbitrator.CheckOverlapping`](../ExpanderArbitrator/#checkoverlapping) for an expanding [`GridGUI.Cell`](../Cell/) against each cell in [`GridGUI.ExpanderArbitrator.Expanders`](../ExpanderArbitrator/#expanders)

**args**:

> **name**: c

> **desc**: The expanding [`GridGUI.Cell`](../Cell/) to check against the already managed expanding cells.

> **type**: [GridGUI.Cell](../Cell/)

####IsExpander
**desc**: Check if a [`GridGUI.Cell`](../Cell/) expands.

**args**:

> **name**: c

> **desc**: The [`GridGUI.Cell`](../Cell/) to check.

> **type**: [GridGUI.Cell](../Cell/)

**returns**:

> **desc**: Returns `true` if either [`GridGUI.Cell.exW`](../Cell/#exw) or [`GridGUI.Cell.exH`](../Cell/#exh) of `c` are non zero otherwise `false` is returned.

> **type**: bool

####IsInHeightConflictWith
**desc**: Checks if two [`GridGUI.Cell`](../Cell/)s are in vertical expanding conflict with each other.

**args**:

> **name**: c1

> **desc**: A [`GridGUI.Cell`](../Cell/) to compare with `c2`.

> **type**: [GridGUI.Cell](../Cell/)

> **name**: c2

> **desc**: A [`GridGUI.Cell`](../Cell/) to compare with `c1`.

> **type**: [GridGUI.Cell](../Cell/)

**returns**:

> **desc**: Returns `true` if both `c1` and `c2` have non zero [`GridGUI.Cell.exH`](../Cell/#exh) and their [`GridGUI.Cell.gridpos`](../Cell/#gridpos) does not overlap along the y-axis. Otherwise `false` is returned.

> **type**: bool

####IsInWidthConflictWith
**desc**: Checks if two [`GridGUI.Cell`](../Cell/)s are in horisontal expanding conflict with each other.

**args**:

> **name**: c1

> **desc**: A [`GridGUI.Cell`](../Cell/) to compare with `c2`.

> **type**: [GridGUI.Cell](../Cell/)

> **name**: c2

> **desc**: A [`GridGUI.Cell`](../Cell/) to compare with `c1`.

> **type**: [GridGUI.Cell](../Cell/)

**returns**:

> **desc**: Returns `true` if both `c1` and `c2` have non zero [`GridGUI.Cell.exW`](../Cell/#exw) and their [`GridGUI.Cell.gridpos`](../Cell/#gridpos) does not overlap along the x-axis. Otherwise `false` is returned.

> **type**: bool

####ReCalculate
**desc**: Checks if the expanding [`GridGUI.ExpanderArbitrator.ReducedConflict`](../ExpanderArbitrator/#reducedconflict) has already been calculated, if not then it calculates it and updates the managed [`GridGUI.Cell`](../Cell/)s.

####Reduce
**desc**: Checks the [`GridGUI.ExpanderArbitrator.ConflictMap`](../ExpanderArbitrator/#conflictmap) for expanders that can be ignored in certain cased and populates [`GridGUI.ExpanderArbitrator.ReducedConflict`](../ExpanderArbitrator/#reducedconflict) with the reduced conflict data.

####Remove
**desc**: Removes a [`GridGUI.Cell`](../Cell/) from the [`GridGUI.ExpanderArbitrator`](../ExpanderArbitrator/) members.

**args**:

> **name**: c

> **desc**: The [`GridGUI.Cell`](../Cell/) to remove from the [`GridGUI.ExpanderArbitrator`](../ExpanderArbitrator/).

> **type**: [GridGUI.Cell](../Cell/)

####SortConflicts
**desc**: Sorts the [`GridGUI.ExpanderArbitrator.ConflictLst`](../ExpanderArbitrator/#conflictlst) by the grid size of the [`GridGUI.Cell`](../Cell/)s, that is by how many column and rows the cell spans over.

####UnInit
**desc**: Undoes what [`GridGUI.ExpanderArbitrator.Init`](../ExpanderArbitrator/#init) does, that is it Deletes all the objects that are indexed in the [`GridGUI.ExpanderArbitrator`](../ExpanderArbitrator/) members under a [`GridGUI.Cell`](../Cell/).

**args**:

> **name**: c

> **desc**: The [`GridGUI.Cell`](../Cell/) to remove from the [`GridGUI.ExpanderArbitrator`](../ExpanderArbitrator/) members.

> **type**: [GridGUI.Cell](../Cell/)

####UnInitCheck
**desc**: Undoes what [`GridGUI.ExpanderArbitrator.InitCheck`](../ExpanderArbitrator/#initcheck) does, that is it removes the [`GridGUI.Cell`](../Cell/) from the other cells managed by this [`GridGUI.ExpanderArbitrator`](../ExpanderArbitrator/).

**args**:

> **name**: c

> **desc**: The [`GridGUI.Cell`](../Cell/) to remove from the [`GridGUI.ExpanderArbitrator`](../ExpanderArbitrator/) members indexed under other cells.

> **type**: [GridGUI.Cell](../Cell/)

####Update
**desc**: Updates the [`GridGUI.Cell.othersW`](../Cell/#othersw) and [`GridGUI.Cell.othersH`](../Cell/#othersh) members of a [`GridGUI.Cell`](../Cell/) that is managed by this [`GridGUI.ExpanderArbitrator`](../ExpanderArbitrator/).

**args**:

> **name**: c

> **desc**: The [`GridGUI.Cell`](../Cell/) to update.

> **type**: [GridGUI.Cell](../Cell/)

