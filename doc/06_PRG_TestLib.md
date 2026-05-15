[[_TOC_]]

## PRG_TestLib

returns : -   
#### Description  
  
This prgoram runs all testsuites.  
It must be attached to a task in the testproject  
  
 
#### Input  
|Name |Type |Comment| 
|---- |---- |----   | 
|i_bStart |BOOL |start testrun| 

#### Output  
|Name |Type |Comment| 
|---- |---- |----   | 
|o_eState |EState_t |state of testrun| 
|o_eResult |EResult_t |overall result| 
|o_sStatistic |SStatistic_t |statistics| 

### Method addTestReport  
returns : BOOL  
  
#### Description  
  
add testreport  
  
 
#### Input  
|Name |Type |Comment| 
|---- |---- |----   | 
|i_pTestReport |TestReportHandle_t |handle for external report| 

#### Output  
- 
### Method addTestSuite  
returns : BOOL  
  
#### Description  
  
register testsuite  
  
 
#### Input  
|Name |Type |Comment| 
|---- |---- |----   | 
|i_iTestSuite |ITestSuite_t |new testsuite to register| 

#### Output  
- 
### Method createReport  
returns : ERetCode_t  
  
#### Description  
  
create report  
define unittest or external report  
  
 
#### Input  
|Name |Type |Comment| 
|---- |---- |----   | 
|i_eReporttype |EReportType_t |define which report| 

#### Output  
- 
### Method getFirstTestSuite  
returns : ITestSuite_t  
  
#### Description  
  
returns the first testsuite  
  
 
#### Input  
- 
#### Output  
- 
### Method getNextTestSuite  
returns : ITestSuite_t  
  
#### Description  
  
returns the the next testsuite  
  
 
#### Input  
- 
#### Output  
- 
### Method getTime  
returns : TimeStruct  
  
#### Description  
  
returns the actual Systemstime  
  
 
#### Input  
- 
#### Output  
- 
### Method logError  
returns : BOOL  
  
#### Description  
  
wrapper for error logging  
  
 
#### Input  
|Name |Type |Comment| 
|---- |---- |----   | 
|i_strMessage |StrMessage_t |message for output| 

#### Output  
- 
### Method logInfo  
returns : BOOL  
  
#### Description  
  
wrapper for information logging  
  
 
#### Input  
|Name |Type |Comment| 
|---- |---- |----   | 
|i_strMessage |StrMessage_t |message for output| 

#### Output  
- 

