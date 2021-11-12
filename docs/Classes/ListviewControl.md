#ListviewControl
<figure markdown="1">

</figure>
---
##Members

!!! info ""

    ####gui
    !!! info ""

        **desc**: The parent GUI of the `ListView`.

        **type**: [GridGUI.GUI](../GUI/)

        **meta**: [object]

##Methods

!!! note ""
    ####__GetRow
    !!! tip ""

        ```AutoHotKey
        __GetRow(index)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Retrieves a row as an array of strings, without changing the currently selected ListView.



    ??? example "parameters"

        !!! info ""

            **name**: index

            **desc**: The index of the row to retrieve.

            **type**: number

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: The contents of the row at `index`.

            **type**: array

!!! note ""
    ####__New
    !!! tip ""

        ```AutoHotKey
        __New(guiHwnd, options := "", text := "")
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Constructor.



    ??? example "parameters"

        !!! info ""

            **name**: guiHwnd

            **desc**: The hwnd of the gui that the GuiControl should be added to.

            **type**: hwnd

        !!! info ""

            **name**: options

            **desc**: The options that the ListView will be created with. Does not accept vVars.

            **type**: string

            **default**: ""

            **link**: [link](https://www.autohotkey.com/docs/commands/ListView.htm#Options)

        !!! info ""

            **name**: text

            **desc**: A list of the initial column titles separated by `|`, e.g. "ColumnTitle1|ColumnTitle2|...".

            **type**: string

            **default**: ""

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: A new [`GridGUI.ListviewControl`](../ListviewControl/) instance.

            **type**: [GridGUI.ListviewControl](../ListviewControl/)

!!! note ""
    ####__ResetCurrentLV
    !!! tip ""

        ```AutoHotKey
        __ResetCurrentLV(previous)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Sets the default `GUI` and `ListView`. Used to restore the old default `GUI` and `ListView`, so that using the methods of the class won't have any side effects.



    ??? example "parameters"

        !!! info ""

            **name**: previous

            **desc**: An object of the hwnds that should be set as the default `GUI` and `ListView` indexed under the keys "gui" and "lv".

            **type**: object

!!! note ""
    ####__SetCurrentLV
    !!! tip ""

        ```AutoHotKey
        __SetCurrentLV()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Selects this `ListView` and sets the default `GUI` to [`GridGUI.ListviewControl.gui`](../ListviewControl/#gui) so that the [LV_Functions](https://www.autohotkey.com/docs/commands/ListView.htm#BuiltIn) work on the right `ListView`.



    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: The hwnd of the previous default `GUI` and `ListView` as an object with the keys "gui" and "lv".

            **type**: object

!!! note ""
    ####Add
    !!! tip ""

        ```AutoHotKey
        Add(Options := "", Fields*)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Adds a new row to the bottom of the list.



    ??? example "parameters"

        !!! info ""

            **name**: Options

            **desc**: The row options to apply to the new row. See link for a list of available options.

            **type**: string

            **default**: ""

            **link**: [link](https://www.autohotkey.com/docs/commands/ListView.htm#RowOptions)

        !!! info ""

            **name**: Fields

            **desc**: The columns of the new row, which can be text or numeric. If there are too few fields to fill all the columns, the columns at the end are left blank. If there are too many fields, the fields at the end are completely ignored.

            **type**: string|number

            **meta**: [variadic]

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: Returns **0** upon failure. Upon success, it returns the new row number, which is not necessarily the last row if the ListView has the `Sort` or `SortDesc` style.

            **type**: number

    **link**: [link](https://www.autohotkey.com/docs/commands/ListView.htm#LV_Add)

!!! note ""
    ####AddArray
    !!! tip ""

        ```AutoHotKey
        AddArray(lst)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Adds an array of rows to the `ListView`.



    ??? example "parameters"

        !!! info ""

            **name**: lst

            **desc**: The array of rows to add. Each row should be an array of the text that should be in each column.

            **type**: array

!!! note ""
    ####Delete
    !!! tip ""

        ```AutoHotKey
        Delete(RowNumber := Null)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Deletes the specified row or all rows.



    ??? example "parameters"

        !!! info ""

            **name**: RowNumber

            **desc**: The index of the row to delete. If the parameter is omitted, all rows in the ListView are deleted.

            **type**: number

            **default**: Null

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: Returns **1** upon success and **0** upon failure.

            **type**: number

    **link**: [link](https://www.autohotkey.com/docs/commands/ListView.htm#LV_Delete)

!!! note ""
    ####DeleteCol
    !!! tip ""

        ```AutoHotKey
        DeleteCol(ColumnNumber)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Deletes the specified column and all of the contents beneath it.



    ??? example "parameters"

        !!! info ""

            **name**: ColumnNumber

            **desc**: The index of the column to delete. Once a column is deleted, the column numbers of any that lie to its right are reduced by **1**. Consequently, calling LV_DeleteCol(**2**) twice would delete the second and third columns.

            **type**: number

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: It returns **1** upon success and **0** upon failure.

            **type**: number

    **link**: [link](https://www.autohotkey.com/docs/commands/ListView.htm#LV_DeleteCol)

!!! note ""
    ####DeleteHeaders
    !!! tip ""

        ```AutoHotKey
        DeleteHeaders()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Deletes all headers of the `ListView`.



    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: Returns **1** if all the headers where removed successfully or **0**  if one or more headers could not be deleted.

            **type**: bool

!!! note ""
    ####FindItem
    !!! tip ""

        ```AutoHotKey
        FindItem(text, index := 0, partial := false)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Finds the index of a row containing a given string.



    ??? example "parameters"

        !!! info ""

            **name**: text

            **desc**: The text to search for.

            **type**: string

            **link**: [link]()

        !!! info ""

            **name**: index

            **desc**: The index to start the search from, the index itself won't be part of the search. **0** searches from the top of the list.

            **type**: number

            **default**: 0

            **link**: [link]()

        !!! info ""

            **name**: partial

            **desc**: Whether or not to detect partial matches.

            **type**: bool

            **default**: false

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: The index of the found row or **-1** on failure.

            **type**: number

    **link**: [link](https://docs.microsoft.com/en-us/windows/win32/controls/lvm-finditem)

!!! note ""
    ####GetCount
    !!! tip ""

        ```AutoHotKey
        GetCount(Mode := "")
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Retrieves the total number of rows or columns, or the number of selected rows only.



    ??? example "parameters"

        !!! info ""

            **name**: Mode

            **desc**: When the parameter is omitted, the function returns the total number of rows in the control. When the parameter is "S" or "Selected", the count includes only the selected/highlighted rows. When the parameter is "Col" or "Column", the function returns the number of columns in the control. This function is always instantaneous because the control keeps track of these counts.

            **type**: string

            **default**: ""

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: The number of rows or columns of the type specified in `Mode`.

            **type**: number

    **link**: [link](https://www.autohotkey.com/docs/commands/ListView.htm#LV_GetCount)

!!! note ""
    ####GetHeaders
    !!! tip ""

        ```AutoHotKey
        GetHeaders()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Retrieves the column titles as an array.



    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: The column titles in an array.

            **type**: array

!!! note ""
    ####GetNext
    !!! tip ""

        ```AutoHotKey
        GetNext(StartingRowNumber := "", RowType := "")
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Retrieves the row number of the next selected, checked, or focused row.



    ??? example "parameters"

        !!! info ""

            **name**: StartingRowNumber

            **desc**: The row index to search from. If `StartingRowNumber` is omitted or less than **1**, the search begins at the top of the list. Otherwise, the search begins at the row after `StartingRowNumber`.

            **type**: string

            **default**: ""

        !!! info ""

            **name**: RowType

            **desc**: The type of row to find. If RowType is omitted, the function searches for the next selected/highlighted row. Otherwise, specify "C" or "Checked" to find the next checked row; or "F" or "Focused" to find the focused row.

            **type**: string

            **default**: ""

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: The row number of the next selected, checked, or focused row.

            **type**: number

    **link**: [link](https://www.autohotkey.com/docs/commands/ListView.htm#LV_GetNext)

!!! note ""
    ####GetRow
    !!! tip ""

        ```AutoHotKey
        GetRow(index)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Retrieves a row as an array of strings.



    ??? example "parameters"

        !!! info ""

            **name**: index

            **desc**: The index of the row to retrieve.

            **type**: number

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: The contents of the row at `index`.

            **type**: array

!!! note ""
    ####GetSelection
    !!! tip ""

        ```AutoHotKey
        GetSelection()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Retrieves an array of the selected rows.



    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: The selected rows in an array.

            **type**: array

!!! note ""
    ####GetText
    !!! tip ""

        ```AutoHotKey
        GetText(ByRef OutputVar, RowNumber, ColumnNumber := 1)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Retrieves the text at the specified RowNumber and ColumnNumber and stores it in OutputVar.



    ??? example "parameters"

        !!! info ""

            **name**: OutputVar

            **desc**: The variable to put the text in to. Upon failure, OutputVar is made blank.

            **type**: string

            **meta**: [ByRef]

        !!! info ""

            **name**: RowNumber

            **desc**: The index of the row to retrieve the text from. If RowNumber is **0**, the column header text is retrieved. If the text is longer than 8191, only the first **8191** characters are retrieved.

            **type**: number

        !!! info ""

            **name**: ColumnNumber

            **desc**: The index of the column to retrieve the text from. Column numbers seen by the script are not altered by any dragging and dropping of columns the user may have done.

            **type**: number

            **default**: 1

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: returns **1** upon success and **0** upon failure.

            **type**: number

    **link**: [link](https://www.autohotkey.com/docs/commands/ListView.htm#LV_GetText)

!!! note ""
    ####Insert
    !!! tip ""

        ```AutoHotKey
        Insert(RowNumber, Options := "", Cols*)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Inserts a new row at the specified row number.



    ??? example "parameters"

        !!! info ""

            **name**: RowNumber

            **desc**: The index to insert the new row at. Any rows at or beneath RowNumber are shifted downward to make room for the new row. If RowNumber is greater than the number of rows in the list (even as high as 2147483647), the new row is added to the end of the list.

            **type**: number

        !!! info ""

            **name**: Options

            **desc**: The row options to apply to the new row. See link for a list of available options.

            **type**: string

            **default**: ""

            **link**: [link](https://www.autohotkey.com/docs/commands/ListView.htm#RowOptions)

        !!! info ""

            **name**: Cols

            **desc**: The columns of the new row, which can be text or numeric. If there are too few fields to fill all the columns, the columns at the end are left blank. If there are too many fields, the fields at the end are completely ignored.

            **type**: string|number

            **meta**: [variadic]

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: Returns **0** upon failure. Upon success, it returns the new row number, which is not necessarily the last row if the ListView has the `Sort` or `SortDesc` style.

            **type**: number

    **link**: [link](https://www.autohotkey.com/docs/commands/ListView.htm#LV_Insert)

!!! note ""
    ####InsertCol
    !!! tip ""

        ```AutoHotKey
        InsertCol(ColumnNumber, Options := "", ColumnTitle := "")
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Inserts a new column at the specified column number and shifting any other columns to the right to make room



    ??? example "parameters"

        !!! info ""

            **name**: ColumnNumber

            **desc**: The index to place the new column at. If ColumnNumber is larger than the number of columns currently in the control, the new column is added to the end of the list.

            **type**: number

        !!! info ""

            **name**: Options

            **desc**: The options to apply to the new column. The new column's attributes always start off at their defaults unless changed via `Options`.

            **type**: string

            **default**: ""

            **link**: [link](https://www.autohotkey.com/docs/commands/ListView.htm#ColOptions)

        !!! info ""

            **name**: ColumnTitle

            **desc**: The title of the column.

            **type**: string

            **default**: ""

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: The index of the newly added column or **0** on failure.

            **type**: number

    **link**: [link](https://www.autohotkey.com/docs/commands/ListView.htm#LV_InsertCol)

!!! note ""
    ####Modify
    !!! tip ""

        ```AutoHotKey
        Modify(RowNumber, Options := "", NewCols*)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Modifies the attributes and/or text of a row. See link for details.



    ??? example "parameters"

        !!! info ""

            **name**: RowNumber

            **desc**: The index of the row to modify. If RowNumber is **0**, all rows in the control are modified.

            **type**: number

        !!! info ""

            **name**: Options

            **desc**: The row options to apply to the row. See link for a list of available options.

            **type**: string

            **default**: ""

            **link**: [link](https://www.autohotkey.com/docs/commands/ListView.htm#RowOptions)

        !!! info ""

            **name**: NewCols

            **desc**: The optional new text to set each column to.

            **type**: string

            **meta**: [variadic]

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: Returns 1 upon success and 0 upon failure. If `RowNumber` is **0** then **1** is returned on complete success and **0** is returned if any part of the operation failed.

            **type**: number

    **link**: [link](https://www.autohotkey.com/docs/commands/ListView.htm#LV_Modify)

!!! note ""
    ####ModifyCol
    !!! tip ""

        ```AutoHotKey
        ModifyCol(ColumnNumber := Null, Options := Null, ColumnTitle := Null)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Modifies the attributes and/or text of the specified column and its header. If all parameters are omitted, the width of every column is adjusted to fit the contents of the rows. If only the first parameter is present, only the specified column is auto-sized. Auto-sizing has no effect when not in Report (Details) view.



    ??? example "parameters"

        !!! info ""

            **name**: ColumnNumber

            **desc**: The index of the column to modify.

            **type**: number

            **default**: Null

        !!! info ""

            **name**: Options

            **desc**: The options to apply to the column.

            **type**: string

            **default**: Null

            **link**: [link](https://www.autohotkey.com/docs/commands/ListView.htm#ColOptions)

        !!! info ""

            **name**: ColumnTitle

            **desc**: The title of the column.

            **type**: string

            **default**: Null

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: Returns **1** upon success and **0** upon failure.

            **type**: number

    **link**: [link](https://www.autohotkey.com/docs/commands/ListView.htm#LV_ModifyCol)

!!! note ""
    ####Redraw
    !!! tip ""

        ```AutoHotKey
        Redraw(bool)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Enables or disables redrawing of the [`GridGUI.ListviewControl`](../ListviewControl/). While redrawing is disabled then any changes to the rows or columns won't be shown in the GUI. Used to improve performance when performing lots of changes at once.



    ??? example "parameters"

        !!! info ""

            **name**: bool

            **desc**: Whether to enable or disable redrawing of the [`GridGUI.ListviewControl`](../ListviewControl/).

            **type**: bool

!!! note ""
    ####ScrollTo
    !!! tip ""

        ```AutoHotKey
        ScrollTo(index := 0, text := "", partial := false)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Scrolls the `ListView` so that a given row index is visible, or so that a row with a given string is visible.



    ??? example "parameters"

        !!! info ""

            **name**: index

            **desc**: The row index to ensure the viability of. If `index` is negative then it will count from the bottom of the `ListView`. If `text` is `true` then `index` will be where the search is started from. See [`GridGUI.ListviewControl.FindItem`](../ListviewControl/#finditem).

            **type**: number

            **default**: 0

        !!! info ""

            **name**: text

            **desc**: Ignored if left unset otherwise it is the text of the row that should be visible. See [`GridGUI.ListviewControl.FindItem`](../ListviewControl/#finditem).

            **type**: string

            **default**: ""

        !!! info ""

            **name**: partial

            **desc**: If `text` is `true` then `partial` is whether or not a complete match is need. See [`GridGUI.ListviewControl.FindItem`](../ListviewControl/#finditem).

            **type**: bool

            **default**: false

    **link**: [link](https://docs.microsoft.com/en-us/windows/win32/controls/lvm-ensurevisible)

!!! note ""
    ####SetHeaders
    !!! tip ""

        ```AutoHotKey
        SetHeaders(headers)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Sets the column titles to the ones passed in the argument `headers`. The number of columns after this call will be equal to the length of `headers`, meaning that columns will be deleted or added as needed.



    ??? example "parameters"

        !!! info ""

            **name**: headers

            **desc**: An array of the new header titles to set.

            **type**: array

!!! note ""
    ####SetImageList
    !!! tip ""

        ```AutoHotKey
        SetImageList(ImageListID, IconType := "")
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Sets or replaces an ImageList for displaying icons. See link for details.



    ??? example "parameters"

        !!! info ""

            **name**: ImageListID

            **desc**: The id of an image list returned from a previous call to `IL_Create()`.

            **type**: number

        !!! info ""

            **name**: IconType

            **desc**: The type of the icons in the image list. specify **0** for large icons, **1** for small icons, and **2** for state icons. If omitted, the type of icons in the ImageList is detected automatically as large or small.

            **type**: string

            **default**: ""

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: If successful, LV_SetImageList() returns the ImageListID that was previously associated with the ListView (or 0 if none).

            **type**: number

    **link**: [link](https://www.autohotkey.com/docs/commands/ListView.htm#LV_SetImageList)

