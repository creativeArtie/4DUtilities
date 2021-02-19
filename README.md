## What's in this?

The actual project is located in the [code](code/). It contains several
sub projects:

1. Exception handling
2. Value assertions 
3. Validation

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

## Value assertions

This project will do several things on top of the current `#DECLARE`.

- Adds a defualt value
- Adds limits to a parameter (ie. a parameter must be between 3 to 5)
- Make sure there is an argument and it is the right class.
- Assert that the pointer is pointing to the right value type.
- Produces a more meaningful assert message
- Check if there is parameter count is not too many
- Do the same for objects

These methods are:
- `utils_countParam`: Counts the paramters
- `utils_getOptionValue`: Use either a defualt value or from the parameter
- `utils_getRequireValue` : make sure there is a value to use
- `utils_getObjectValue` : do the same for objects


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



