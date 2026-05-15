[[_TOC_]]

## FB_Assertion

returns : -   
#### Description  
  
This functionblock contains different types  
of assertions to use.  
  
 
#### Input  
- 
#### Output  
|Name |Type |Comment| 
|---- |---- |----   | 
|o_eState |EAssertion_t |actual state PASSED, FAILED,..| 
|o_u32Passed |UDINT |nb of assertions passed | 
|o_u32Failed |UDINT |nb of assertions failed| 

### Method _FALSE  
returns : BOOL  
  
#### Description  
  
internal assert value is false  
  
 
#### Input  
|Name |Type |Comment| 
|---- |---- |----   | 
|bValue |BOOL |value should be false| 

#### Output  
- 
### Method _FALSE_Fatal  
returns : BOOL  
  
#### Description  
  
internal assert fatal value is false  
if this fails the testrun will stop   
  
 
#### Input  
|Name |Type |Comment| 
|---- |---- |----   | 
|bValue |BOOL |value should be false| 

#### Output  
- 
### Method _TRUE  
returns : BOOL  
  
#### Description  
  
internal assert value is true  
  
 
#### Input  
|Name |Type |Comment| 
|---- |---- |----   | 
|bValue |BOOL |value should be true| 

#### Output  
- 
### Method _TRUE_Fatal  
returns : BOOL  
  
#### Description  
  
internal assert fatal value is true  
if this fails the testrun will stop   
  
 
#### Input  
|Name |Type |Comment| 
|---- |---- |----   | 
|bValue |BOOL |value should be true| 

#### Output  
- 
### Method addFailed  
returns : BOOL  
  
#### Description  
  
this method increments the FAILED-counter  
and set the teststate to failed  
  
 
#### Input  
|Name |Type |Comment| 
|---- |---- |----   | 
|bFatal |BOOL || 

#### Output  
- 
### Method addPassed  
returns : BOOL  
  
#### Description  
  
this method increments the PASSED-counter  
  
 
#### Input  
- 
#### Output  
- 
### Method EQUAL  
returns : BOOL  
  
#### Description  
  
assert value is equal  
both values are checked if they can be compared  
if not a FAILED-FATAL will be the result  
  
 
#### Input  
|Name |Type |Comment| 
|---- |---- |----   | 
|Actual |ANY |actual value| 
|Expected |ANY |value to compare| 

#### Output  
- 
### Method EQUAL_Fatal  
returns : BOOL  
  
#### Description  
  
assert value is equal   
both values are checked if they can be compared  
if not a FAILED-FATAL will be the result  
  
 
#### Input  
|Name |Type |Comment| 
|---- |---- |----   | 
|Actual |ANY |actual value| 
|Expected |ANY |value to compare| 

#### Output  
- 
### Method logError  
returns : BOOL  
  
#### Description  
  
assert value is  
  
 
#### Input  
|Name |Type |Comment| 
|---- |---- |----   | 
|i_strMessage |StrMessage_t || 

#### Output  
- 
### Method NotEqual  
returns : BOOL  
  
#### Description  
  
assert values are not equal  
both values are checked if they can be compared  
if not a FAILED-FATAL will be the result  
  
 
#### Input  
|Name |Type |Comment| 
|---- |---- |----   | 
|Actual |ANY |actual value| 
|Expected |ANY |value to compare| 

#### Output  
- 
### Method NotEqual_Fatal  
returns : BOOL  
  
#### Description  
  
assert values are not equal  
both values are checked if they can be compared  
if not a FAILED-FATAL will be the result  
  
 
#### Input  
|Name |Type |Comment| 
|---- |---- |----   | 
|Actual |ANY |actual value| 
|Expected |ANY |value to compare| 

#### Output  
- 
### Method PtrEqual  
returns : BOOL  
  
#### Description  
  
assert pointer are equal  
  
 
#### Input  
|Name |Type |Comment| 
|---- |---- |----   | 
|pActual |PVOID |actual value| 
|pExpected |PVOID |value to compare| 

#### Output  
- 
### Method PtrEqual_Fatal  
returns : BOOL  
  
#### Description  
  
assert value is  
  
 
#### Input  
|Name |Type |Comment| 
|---- |---- |----   | 
|pActual |PVOID |actual value| 
|pExpected |PVOID |value to compare| 

#### Output  
- 
### Method PtrNotEqual  
returns : BOOL  
  
#### Description  
  
assert value is  
  
 
#### Input  
|Name |Type |Comment| 
|---- |---- |----   | 
|pActual |PVOID |actual value| 
|pExpected |PVOID |value to compare| 

#### Output  
- 
### Method PtrNotEqual_Fatal  
returns : BOOL  
  
#### Description  
  
assert value is  
  
 
#### Input  
|Name |Type |Comment| 
|---- |---- |----   | 
|pActual |PVOID |actual value| 
|pExpected |PVOID |value to compare| 

#### Output  
- 
### Method PtrNotNull  
returns : BOOL  
  
#### Description  
  
assert pointer is not NULL  
  
 
#### Input  
|Name |Type |Comment| 
|---- |---- |----   | 
|pActual |PVOID |actual value| 

#### Output  
- 
### Method PtrNotNull_Fatal  
returns : BOOL  
  
#### Description  
  
assert value is  
  
 
#### Input  
|Name |Type |Comment| 
|---- |---- |----   | 
|pActual |PVOID |actual value| 

#### Output  
- 
### Method PtrNull  
returns : BOOL  
  
#### Description  
  
assert value is  
  
 
#### Input  
|Name |Type |Comment| 
|---- |---- |----   | 
|pActual |PVOID |actual value| 

#### Output  
- 
### Method PtrNull_Fatal  
returns : BOOL  
  
#### Description  
  
assert value is  
  
 
#### Input  
|Name |Type |Comment| 
|---- |---- |----   | 
|pActual |PVOID |actual value| 

#### Output  
- 
### Method RealEqual  
returns : BOOL  
  
#### Description  
  
assert value is  
  
 
#### Input  
|Name |Type |Comment| 
|---- |---- |----   | 
|r32Actual |REAL || 
|r32Expected |REAL || 
|r32Granularity |REAL || 

#### Output  
- 
### Method RealEqual_Fatal  
returns : BOOL  
  
#### Description  
  
assert value is  
  
 
#### Input  
|Name |Type |Comment| 
|---- |---- |----   | 
|r32Actual |REAL || 
|r32Expected |REAL || 
|r32Granularity |REAL || 

#### Output  
- 
### Method RealNotEqual  
returns : BOOL  
  
#### Description  
  
assert value is  
  
 
#### Input  
|Name |Type |Comment| 
|---- |---- |----   | 
|r32Actual |REAL || 
|r32Expected |REAL || 
|r32Granularity |REAL || 

#### Output  
- 
### Method RealNotEqual_Fatal  
returns : BOOL  
  
#### Description  
  
assert value is  
  
 
#### Input  
|Name |Type |Comment| 
|---- |---- |----   | 
|r32Actual |REAL || 
|r32Expected |REAL || 
|r32Granularity |REAL || 

#### Output  
- 
### Method reset  
returns : BOOL  
  
#### Description  
  
reset the assert instance  
  
 
#### Input  
- 
#### Output  
- 
### Method StringEqual  
returns : BOOL  
  
#### Description  
  
assert value is  
  
 
#### Input  
|Name |Type |Comment| 
|---- |---- |----   | 
|pActual |StringHandle_t || 
|pExpected |StringHandle_t || 

#### Output  
- 
### Method StringEqual_Fatal  
returns : BOOL  
  
#### Description  
  
assert value is  
  
 
#### Input  
|Name |Type |Comment| 
|---- |---- |----   | 
|pActual |StringHandle_t || 
|pExpected |StringHandle_t || 

#### Output  
- 
### Method StringNotEqual  
returns : BOOL  
  
#### Description  
  
assert value is  
  
 
#### Input  
|Name |Type |Comment| 
|---- |---- |----   | 
|pActual |StringHandle_t || 
|pExpected |StringHandle_t || 

#### Output  
- 
### Method StringNotEqual_fatal  
returns : BOOL  
  
#### Description  
  
assert value is  
  
 
#### Input  
|Name |Type |Comment| 
|---- |---- |----   | 
|pExpected |StringHandle_t || 
|pActual |StringHandle_t || 

#### Output  
- 
### Method strncmp  
returns : BOOL  
  
#### Description  
  
assert value is  
  
 
#### Input  
|Name |Type |Comment| 
|---- |---- |----   | 
|strInput |StringHandle_t || 
|strCompare |StringHandle_t || 
|s16Size |INT || 

#### Output  
- 
### Method validate  
returns : BOOL  
  
#### Description  
  
assert value is  
  
 
#### Input  
|Name |Type |Comment| 
|---- |---- |----   | 
|var1 |ANY || 
|var2 |ANY || 

#### Output  
- 

