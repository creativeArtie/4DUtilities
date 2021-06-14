//%attributes = {"invisible":true}
C_BOOLEAN:C305(assertLocalParameter; $0)
C_OBJECT:C1216(assertLocalParameter; $1)
C_POINTER:C301(assertLocalParameter; $2)
C_VARIANT:C1683(assertLocalParameter; $3)
C_BOOLEAN:C305(assertObjectParameter; $0)
C_OBJECT:C1216(assertObjectParameter; $1)
C_OBJECT:C1216(assertObjectParameter; $2)
C_TEXT:C284(assertObjectParameter; $3)
C_VARIANT:C1683(assertObjectParameter; $4)
C_OBJECT:C1216(assertParameterCount; $1)
C_TEXT:C284(getMethodCallerText; $0)
C_VARIANT:C1683(getValueFromObject; $0)
C_TEXT:C284(getValueFromObject; ${3})
C_OBJECT:C1216(getValueFromObject; $1)
C_VARIANT:C1683(getValueFromObject; $2)
C_OBJECT:C1216(assertParameterSetup; $0)
C_LONGINT:C283(assertParameterSetup; $1)
C_OBJECT:C1216(setValueToObject; $0)
C_TEXT:C284(setValueToObject; ${3})
C_OBJECT:C1216(setValueToObject; $1)
C_VARIANT:C1683(setValueToObject; $2)

//assertNoParameters
C_LONGINT:C283(assertNoParameters; $1)

//assertParameterAtLeast
C_OBJECT:C1216(assertParameterAtLeast; $1)
C_LONGINT:C283(assertParameterAtLeast; $2)

//error_addException
C_OBJECT:C1216(error_addException; $1)

//error_create
C_OBJECT:C1216(error_create; $0)
C_TEXT:C284(error_create; $1)
C_LONGINT:C283(error_create; $2)
C_OBJECT:C1216(error_create; $3)

//error_listUncaught
C_COLLECTION:C1488(error_listUncaught; $0)

//getMethodCaller
C_OBJECT:C1216(getMethodCaller; $0)

//setupToolbox
C_TEXT:C284(setupToolbox; $1)

//error_addException
C_BOOLEAN:C305(error_addException; $2)
C_BOOLEAN:C305(error_addException; $3)

//error_assert
C_OBJECT:C1216(error_assert; $0)
C_OBJECT:C1216(error_assert; $1)

//error_assertIf
C_OBJECT:C1216(error_assertIf; $0)
C_BOOLEAN:C305(error_assertIf; $1)
C_TEXT:C284(error_assertIf; $2)

//error_catch
C_BOOLEAN:C305(error_catch; $0)
C_POINTER:C301(error_catch; $1)

//error_throw
C_OBJECT:C1216(error_throw; $0)
C_TEXT:C284(error_throw; $1)
C_OBJECT:C1216(error_throw; $2)