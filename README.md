## What's in this?

The actual project is located in the [code](code/). It contains several
sub projects:

1. Generate documentation
2. Exception handling
3. Value assertions 
4. Validation

## Generating Documentation

The documentation generation generate documents directly from the source code and
get be read from 4D code Explorer -> Documentation and from the web browser.

To use it just call `doc_run`.

Without any additional comments, this will generates
1. Class inherance diagram
2. A list of class methods names and its parameters, return values and local value
3. Method's parameters, return values and local value, with a better hover tool tip.
4. Methods and classes that ends with an underscore is marked as "private"
5. (more to come...)

### Documentation support

All documentation for the generator must starts with `\\!`. It can accept markdown,
and even the web browser will parse it using a javascript library.

Documentation in the same line as a `var` or methods starts with `C_` will become 
the documentation of the variable declared.

### Hashtags

There are hashtags that can be use when documenting the code. Hashtags comment must
have the following syntax:

```4D

//! #name details
```

This is the current list of hashtags:

|Hashtag Name|Description|
|------------|-----------|
|#author     |the author of this file|
|#brief      |the documentation to add into a class, class method, or function tooltip|
|#todo       |the todo item, with a different file listing all of them|
|#abstract   |that the class method is a abstract and need implementation in the subclass|

## Exception handling

Exceptions are logged into a table call \[Exceptions\]. It is also being 
monitored in the `Storage.utils_except` object.

Things it can do:

### Handle 4D thrown errors
```4D
except_trapError
// Method calle on error = "except_onErrCall_" (method to handle 4D errors)
```

### Try Catch

```4D
var $exception : cs.Exception
If (except_try(Forumla(True); ->$exception)) 
    // code if no error
Else
    // code if there is an exception 
End if
```

### Handle exceptions not catched throw "Try Catch"

```4D
While (except_catch(->$exception))
    // code for the exception find for the current process
End while 
```

### Check for exceptions

```4D
If (except_hasExceptions)
    // exceptions find for the current process
Else
    // no exceptions find for the current process
End if
```

It is also can be used for unit testing

```4D
var $test : Object
$test:=AJ_UnitTest.new("..."; Current method name)

// some tests

// assert fails if there are exceptions here
except_hasExceptions($test) 

// continue testing with a clean exception list
```

### throws your own exceptions

```4D
except_throw("Your error message")
```

### Monitor the exceptions

This is useful when you are using this project and want to find a 4D error.

When you are using `except_trapError`, if there are new 4D error, the code
will not call `Trace` nor `Abort`. The `ExceptionMonitor` form along 
with the debugger will let you know when the error is being thrown.

The `ExceptionMonitor` form will work by clicking run form.


## Validator

The validator checks the fields for optional and mandatory data. There are three base classes:

1. `Validator` manages a group of validations:
    - Sorts the mandatory and optional checkers
    - Loads the data into the `Check` object, and results into `Use` objects
    - Stores the results
    - Gives a summary of the results
2. `Check` handles a single validation:
    - Runs the vaildation
    - Stores the data needed for validating
    - Provides a template for error messages
3. `Use` handles a single value and its vaildation result:
    - extracts the value from form object
    - formats the form object
    - produce an error message for the user
    - stores a vaildated result for the data
    - (future) returns the form object/pointer

### Check class

There are 6 subclasses for `Check`:
- `CheckAge` : checks an age between two numbers or dates
- `CheckFilled` : check if a field is filled
- `CheckFormat` : check if a format is correct
- `CheckNot`  : checks if a validation returns false
- `CheckReal` : checks if a number is between two numbers
- `CheckWhen` : checks only if a certain condition is fulfilled

To extends the `Check` class, the following are required:

- [ ] add the function `test() -> boolean` where:
    - [ ] `This.getValue()` will return the value to validate
    - [ ] the return value `True` means vaildation passes
- [ ] add the fucntion `getTemplateMessage() -> Text` where the return value:
    - [ ] be phrased with the word "not" so that `CheckNot` message can work.
    - [ ] use `$1` to indicate the location of the field name

Here are the optional methods

- [ ] if using a constructor, pass nothing to `Super()`
- [ ] if overriding `setValue($input;Variant)`, `Super.setValue($1)` must be called

## Use Class

There are 4 classes for `Use`:

- `UseCombo` : for combo box form widget
- `UseField` : for input form widget
- `UsePhoneField` : for input form widget which stores a phone number
- `UseValue` : for data that isn't tied to any form widgets

To extend a `Use` classes, the following are required:

- [ ] Function `getValue()` must exist to get the value
- [ ] The constructor must have `Super($feildName : Text)`

The following are optional but are recommanded to override

- [ ] `setError($message : Text)`
- [ ] `setWarning($message : Text)`
- [ ] `setPass()`

In all of these methods their super method must be called. If possible,
extend the class from `UseCombo` and `UseField` which already overried 
these methods and change the colours of the form widget.

## Utilities

### Paramter setting

For parameters will do several things on top of the current `#DECLARE`. For the
best result, the structure setting "Compilation Path" should set to 
"All variables are typed"

- Adds a defualt value
- counts the parameters
- make sure that the required value are being filled.

To use this use the following code

```4D
#DECLARE($param1: Text; $param2: Integer; $param3 : 4D.Function)->$result : Boolean

var $count : Real
$param1:=utils_assertParameter($1; ->$count; Count parameters; "default value")
$param2:=utils_assertParameter($2; ->$count; Count parameters; 23)
$param3:=utils_assertParameter($3; ->$count; Count paramters; Formula(True))
utils_assertParameterCount($count; Count parameters)
```

### Object variable getter

Normally if you don't know if a key exists in a object's child, you'd need to:

```4D

If (Ob is defined($object;"child"))
    If (Ob is defined($object.child; "key"))
        $value:=$object.child.key
    Else
        $value:="default"
Else
    $value:="default"
End If
```

With `utils_getValueFromObject`, you can now do this to produce the same result:

```4D
$value:=utils_getValueFromObject($object; "default"; "child"; "key")
```
