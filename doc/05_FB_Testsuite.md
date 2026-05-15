[[_TOC_]]

## FB_Testsuite

returns : -   
#### Description  
  
Dieser Baustein enthält alle zugeordneten Testfälle. Ein Testfall  
ist ein abgeleiteter Baustein (FB) von FB_TestBase.  
### Interfaces  
- ITestsuite_t  
  
 
#### Input  
- 
#### Output  
|Name |Type |Comment| 
|---- |---- |----   | 
|o_eState |EState_t |state of testsuite| 
|o_eResult |EResult_t |last result| 

### Method addTestcase  
returns : BOOL  
  
#### Description  
  
add testcase to suite  
  
 
#### Input  
|Name |Type |Comment| 
|---- |---- |----   | 
|i_iTestCase |ITestBase_t |new testcase| 

#### Output  
- 
### Method execute  
returns : BOOL  
  
#### Description  
  
...  
  
 
#### Input  
|Name |Type |Comment| 
|---- |---- |----   | 
|i_bStart |BOOL || 

#### Output  
- 
### Method FB_init  
returns : BOOL  
  
#### Description  
 
#### Input  
|Name |Type |Comment| 
|---- |---- |----   | 
|bInitRetains |BOOL |if TRUE, the retain variables are initialized (warm start / cold start)| 
|bInCopyCode |BOOL |if TRUE, the instance afterwards gets moved into the copy code (online change)| 
|i_strId |ObjectId_t || 
|i_strPath |ObjectId_t || 

#### Output  
- 
### Method getFirstTestCase  
returns : ITestBase_t  
  
#### Description  
  
...  
  
 
#### Input  
- 
#### Output  
- 
### Method getId  
returns : STRING  
  
#### Description  
  
...  
  
 
#### Input  
- 
#### Output  
- 
### Method getNextTestCase  
returns : ITestBase_t  
  
#### Description  
  
...  
  
 
#### Input  
- 
#### Output  
- 
### Method getPath  
returns : ObjectId_t  
  
#### Description  
  
...  
  
 
#### Input  
- 
#### Output  
- 
### Method getResult  
returns : EResult_t  
  
#### Description  
  
...  
  
 
#### Input  
- 
#### Output  
- 
### Method getState  
returns : EState_t  
  
#### Description  
  
...  
  
 
#### Input  
- 
#### Output  
- 
### Method logInfo  
returns : BOOL  
  
#### Description  
  
...  
  
 
#### Input  
|Name |Type |Comment| 
|---- |---- |----   | 
|i_strMessage |StrMessage_t || 

#### Output  
- 
### Method register  
returns : BOOL  
  
#### Description  
  
...  
  
 
#### Input  
- 
#### Output  
- 
### Method Result  
returns : SStatistic_t  
  
#### Description  
  
...  
  
 
#### Input  
- 
#### Output  
- 
### Method Get  
returns : SStatistic_t  
  
#### Description  
 
#### Input  
- 
#### Output  
- 

