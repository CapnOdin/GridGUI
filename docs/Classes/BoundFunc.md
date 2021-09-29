#BoundFunc
<figure markdown="1">
A custom bound function class that allows changing the bound arguments and retrieve them.
</figure>
---
##Members

####arguments

> **desc**: The array of arguments bound to this function.

> **type**: array

> **default**: empty array

####function

> **desc**: The function that has arguments bound to it.

> **type**: Func|BoundFunc

##Methods

####__Get
**desc**: Meta function allowing access to the underlying bound function as thought it was this function except if the arguments member is retrieved.

**args**:

> **name**: key

> **desc**: The key to look up in the object.

> **type**: any

**returns**:

> **desc**: The looked up value.

> **type**: any

####__GetInstanceType
**desc**: Constructs the class path of a class instance.

**args**:

> **name**: object

> **desc**: The object to retrieve the class path from.

> **type**: object

**returns**:

> **desc**: Class path.

> **type**: string

####__IsInstanceOf
**desc**: Checks if a class is in the class path of an object.

**args**:

> **name**: object

> **desc**: The class instance to search.

> **type**: string|number|object

> **name**: class

> **desc**: The class name to search for.

> **type**: string|number|object

**returns**:

> **desc**: Whether or not the class path of `object` contains `class`.

> **type**: bool

####__New
**desc**: Constructor.

**args**:

> **name**: fun

> **desc**: The function or method that arguments are bound to.

> **type**: Func|BoundFunc|string

> **name**: arguments

> **desc**: The arguments that will be passed to the `GridGUI.BoundFunc.function` when it is called. If the function is a method then the class instance is passed as the first variadic arg.

> **type**: any

**returns**:

> **desc**: A new GridGUI.BoundFunc` instance.

> **type**: GridGUI.BoundFunc`

####ToStr
**desc**: Converts the object to a string.

**args**:

> **name**: indent

> **desc**: The amount of indentation to add on each line.

> **type**: string

**returns**:

> **desc**: A string representing the bound function.

> **type**: string

