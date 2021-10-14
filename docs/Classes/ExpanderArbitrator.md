#ExpanderArbitrator
<figure markdown="1">
A class that try to find expanding cells that conflict and resolve the conflicts.
</figure>
---
##Members

####ConflictLst

> **desc**: Two collections of which expanding `GridGUI.Cell`s needs to share the available GUI size with a specific expanding `GridGUI.Cell`. That is for an expanding `GridGUI.Cell` `c` the horisontally expanding `GridGUI.Cell`s `o` in another column will be stored under `["W"][c][i]` where `i` is the index of `o` and similar for the vertically expanding cells they are stored under `"H"`.

> **type**: associative array

> **default**: {"W": {}, "H": {}}

####ConflictMap

> **desc**: Two collections of which expanding `GridGUI.Cell`s needs to share the available GUI size with a specific expanding `GridGUI.Cell`. That is for an expanding `GridGUI.Cell` `c` the horisontally expanding `GridGUI.Cell`s `o` in another column will be stored under `["W"][c][o]` and similar for the vertically expanding cells they are stored under `"H"`.

> **type**: associative array

> **default**: {"W": {}, "H": {}}

####Expanders

> **desc**: Array of all expanding `GridGUI.Cell`s in the grid.

> **type**: array

> **default**: []

####Ignore

> **desc**: Two collections of which expanding `GridGUI.Cell`s are similar to cells that have already been accounted for in relation to a specific cell.

> **type**: associative array

> **default**: {"W": {}, "H": {}}

####IsReduced

> **desc**: Whether or not `GridGUI.ExpanderArbitrator.ConflictMap` has been reduced yet. If true then the entries in `GridGUI.ExpanderArbitrator.ReducedConflict` will be populated with a sub set of the entries in `GridGUI.ExpanderArbitrator.ConflictMap`.

> **type**: bool

####Overlapping

> **desc**: Two collections of which expanding `GridGUI.Cell`s overlap a given expanding `GridGUI.Cell`. That is for an expanding `GridGUI.Cell` `c` the horisontally overlapping `GridGUI.Cell`s `o` will be stored under `["W"][c][o]` and similar for the vertically overlapping cells they are stored under `"H"`.

> **type**: associative array

> **default**: {"W": {}, "H": {}}

####ReducedConflict

> **desc**: Two collections of only the expanding `GridGUI.Cell`s in `GridGUI.ExpanderArbitrator.ConflictMap` that can't be ignored in relation to an expanding `GridGUI.Cell`. That is for an expanding `GridGUI.Cell` `c` the horisontally expanding `GridGUI.Cell`s `o` in another column will be stored under `["W"][c][o]` and similar for the vertically expanding cells they are stored under `"H"`.

> **type**: associative array

> **default**: {"W": {}, "H": {}}

##Methods

####__New
**desc**: Constructor.

**returns**:

> **desc**: A new `GridGUI.ExpanderArbitrator` instance.

> **type**: GridGUI.ExpanderArbitrator

####Add
**desc**: Adds a `GridGUI.Cell` to the `GridGUI.ExpanderArbitrator` members if the cell expands, that is if either `GridGUI.Cell.exW` or `GridGUI.Cell.exH` are non zero.

**args**:

> **name**: c

> **desc**: The `GridGUI.Cell` to add to the `GridGUI.ExpanderArbitrator`.

> **type**: GridGUI.Cell

####CheckConflicts
**desc**: Checks if the an expanding `GridGUI.Cell` is in conflict with one another expanding cell and updates `GridGUI.ExpanderArbitrator.ConflictLst` and `GridGUI.ExpanderArbitrator.ConflictMap` if they are. This function is intended for checking new expanding cells against already managed expanding cells.

**args**:

> **name**: c

> **desc**: The expanding `GridGUI.Cell` to check for a conflict.

> **type**: GridGUI.Cell

> **name**: expander

> **desc**: The expanding `GridGUI.Cell` to check for a conflict against.

> **type**: GridGUI.Cell

####CheckOverlapping
**desc**: Checks if the an expanding `GridGUI.Cell` overlaps another expanding cell and updates `GridGUI.ExpanderArbitrator.Overlapping` if they are. This function is intended for checking new expanding cells against already managed expanding cells.

**args**:

> **name**: c

> **desc**: The expanding `GridGUI.Cell` to check if it overlaps `expander`.

> **type**: GridGUI.Cell

> **name**: expander

> **desc**: The expanding `GridGUI.Cell` to check if it overlaps `c`.

> **type**: GridGUI.Cell

####Init
**desc**: Adds a expanding `GridGUI.Cell` to the members of this `GridGUI.ExpanderArbitrator` so that they can be populated with data later.

**args**:

> **name**: c

> **desc**: The expanding `GridGUI.Cell` to add to the `GridGUI.ExpanderArbitrator` members.

> **type**: GridGUI.Cell

####InitCheck
**desc**: Runs `GridGUI.ExpanderArbitrator.CheckConflicts` and `GridGUI.ExpanderArbitrator.CheckOverlapping` for an expanding `GridGUI.Cell` against each cell in `GridGUI.ExpanderArbitrator.Expanders`

**args**:

> **name**: c

> **desc**: The expanding `GridGUI.Cell` to check against the already managed expanding cells.

> **type**: GridGUI.Cell

####IsExpander
**desc**: Check if a `GridGUI.Cell` expands.

**args**:

> **name**: c

> **desc**: The `GridGUI.Cell` to check.

> **type**: GridGUI.Cell

**returns**:

> **desc**: Returns `true` if either `GridGUI.Cell.exW` or `GridGUI.Cell.exH` of `c` are non zero otherwise `false` is returned.

> **type**: bool

####IsInHeightConflictWith
**desc**: Checks if two `GridGUI.Cell`s are in vertical expanding conflict with each other.

**args**:

> **name**: c1

> **desc**: A `GridGUI.Cell` to compare with `c2`.

> **type**: GridGUI.Cell

> **name**: c2

> **desc**: A `GridGUI.Cell` to compare with `c1`.

> **type**: GridGUI.Cell

**returns**:

> **desc**: Returns `true` if both `c1` and `c2` have non zero `GridGUI.Cell.exH` and their `GridGUI.Cell.gridpos` does not overlap along the y-axis. Otherwise `false` is returned.

> **type**: bool

####IsInWidthConflictWith
**desc**: Checks if two `GridGUI.Cell`s are in horisontal expanding conflict with each other.

**args**:

> **name**: c1

> **desc**: A `GridGUI.Cell` to compare with `c2`.

> **type**: GridGUI.Cell

> **name**: c2

> **desc**: A `GridGUI.Cell` to compare with `c1`.

> **type**: GridGUI.Cell

**returns**:

> **desc**: Returns `true` if both `c1` and `c2` have non zero `GridGUI.Cell.exW` and their `GridGUI.Cell.gridpos` does not overlap along the x-axis. Otherwise `false` is returned.

> **type**: bool

####ReCalculate
**desc**: Checks if the expanding `GridGUI.ExpanderArbitrator.ReducedConflict` has already been calculated, if not then it calculates it and updates the managed `GridGUI.Cell`s.

####Reduce
**desc**: Checks the `GridGUI.ExpanderArbitrator.ConflictMap` for expanders that can be ignored in certain cased and populates `GridGUI.ExpanderArbitrator.ReducedConflict` with the reduced conflict data.

####Remove
**desc**: Removes a `GridGUI.Cell` from the `GridGUI.ExpanderArbitrator` members.

**args**:

> **name**: c

> **desc**: The `GridGUI.Cell` to remove from the `GridGUI.ExpanderArbitrator`.

> **type**: GridGUI.Cell

####SortConflicts
**desc**: Sorts the `GridGUI.ExpanderArbitrator.ConflictLst` by the grid size of the `GridGUI.Cell`s, that is by how many column and rows the cell spans over.

####UnInit
**desc**: Undoes what `GridGUI.ExpanderArbitrator.Init` does, that is it Deletes all the objects that are indexed in the `GridGUI.ExpanderArbitrator` members under a `GridGUI.Cell`.

**args**:

> **name**: c

> **desc**: The `GridGUI.Cell` to remove from the `GridGUI.ExpanderArbitrator` members.

> **type**: GridGUI.Cell

####UnInitCheck
**desc**: Undoes what `GridGUI.ExpanderArbitrator.InitCheck` does, that is it removes the `GridGUI.Cell` from the other cells managed by this `GridGUI.ExpanderArbitrator`.

**args**:

> **name**: c

> **desc**: The `GridGUI.Cell` to remove from the `GridGUI.ExpanderArbitrator` members indexed under other cells.

> **type**: GridGUI.Cell

####Update
**desc**: Updates the `GridGUI.Cell.othersW` and `GridGUI.Cell.othersH` members of a `GridGUI.Cell` that is managed by this `GridGUI.ExpanderArbitrator`.

**args**:

> **name**: c

> **desc**: The `GridGUI.Cell` to update.

> **type**: GridGUI.Cell

