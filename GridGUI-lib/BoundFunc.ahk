
;instance := new MyClass("ahk")

;fun := new BoundFunc("MyClass.Print", instance)

;MsgBox, % fun.Name

;MsgBox, % fun.Arguments[1].__Class

;fun.Call("kha")

;fun.Call()
;fun.Call("kha", 6)

/*
Class MyClass {
	__New(str) {
		this.str := str
	}
	
	Print(str) {
		MsgBox, % this.str "`n" str
	}
}
*/

Class BoundFunc {
	__New(fun, arguments*) {
		local namesegments, requiredClass, recived
		this.function := IsObject(fun) ? fun : Func(fun)
		if(!IsFunc(this.function)) {
			throw Exception("Function not Found", -1, """" fun """ is not a function.")
		}
		if(InStr(this.function.Name, ".")) {
			namesegments := StrSplit(this.function.Name, ".")
			requiredClass := namesegments[namesegments.Length() - 1]
			recived := arguments[1].__Class
			if(!this.__IsInstanceOf(arguments[1], requiredClass)) {
				throw Exception("An Instance is Required for Bound Methods", -1, "Expected an instance of """ requiredClass """ as second argument, but got " (recived ? "an instance of """ this.__GetInstanceType(arguments[1]) """" : "no object") ".")
			}
		}
		this.Arguments := arguments
	}
	
	__IsInstanceOf(object, class) {
		local classnameParts
		While(object.__Class) {
			classnameParts := StrSplit(object.__Class, ".")
			if(classnameParts[classnameParts.Length()] = class) {
				return True
			}
			object := object.Base
		}
		return False
	}
	
	__GetInstanceType(object) {
		local typePath
		typePath := ""
		While(object.__Class) {
			typePath .= object.__Class "."
			object := object.Base
		}
		return SubStr(typePath, 1, -1)
	}
	
	__Get(key) {
		if(key = "arguments") {
			return this.Arguments
		}
		return this.function[key]
	}
	
	Call(arguments*) {
		local numOfArguments, args
		numOfArguments := this.Arguments.Length() + arguments.Length()
		if(this.function.MinParams <= numOfArguments && numOfArguments <= this.function.MaxParams) {
			args := Array(this.Arguments*)
			args.Push(arguments*)
			this.function.Call(args*)
		} else {
			throw Exception("Too " (this.function.MinParams < numOfArguments ? "Many" : "Few") " Arguments Given", -1, "Function " this.Name ", takes a minimum of " this.function.MinParams " and a maximum of " this.function.MaxParams " argument(s) but " numOfArguments " argument(s) were given.")
		}
	}
	
	ToStr(indent := "`t") {
		return indent "Name:`t`t" this.Name "`n" indent "NumOfArg:`t" this.MaxParams
	}
}
