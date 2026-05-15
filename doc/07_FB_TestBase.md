[[_TOC_]]

## FB_TestBase

returns : -   
#### Description  
  
...  
  
 
#### Input  
- 
#### Output  
|Name |Type |Comment| 
|---- |---- |----   | 
|o_eResult |EResult_t || 

### Method _cleanup  
returns : ERetCode_t  
  
#### Description  
  
...  
  
 
#### Input  
- 
#### Output  
- 
### Method _execute  
returns : ERetCode_t  
  
#### Description  
  
...  
  
 
#### Input  
- 
#### Output  
- 
### Method _prepare  
returns : ERetCode_t  
  
#### Description  
  
...  
  
 
#### Input  
- 
#### Output  
- 
### Method cleanup  
returns : ERetCode_t  
  
#### Description  
  
...  
  
 
#### Input  
- 
#### Output  
- 
### Method execute  
returns : ERetCode_t  
  
#### Description  
  
...  
  
 
#### Input  
- 
#### Output  
- 
### Method FB_init  
returns : BOOL  
  
#### Description  
  
...  
  
 
#### Input  
|Name |Type |Comment| 
|---- |---- |----   | 
|bInitRetains |BOOL |if TRUE, the retain variables are initialized (warm start / cold start)| 
|bInCopyCode |BOOL |if TRUE, the instance afterwards gets moved into the copy code (online change)| 
|i_strId |ObjectId_t || 
|i_strClassName |ObjectId_t || 
|i_strPath |ObjectId_t || 
|i_iTestSuite |ITestSuite_t || 
|i_bExecute |BOOL || 

#### Output  
- 
### Method getClassName  
returns : ObjectId_t  
  
#### Description  
  
...  
  
 
#### Input  
- 
#### Output  
- 
### Method getFailed  
returns : UDINT  
  
#### Description  
  
...  
  
 
#### Input  
- 
#### Output  
- 
### Method getId  
returns : ObjectId_t  
  
#### Description  
  
...  
  
 
#### Input  
- 
#### Output  
- 
### Method getMessage  
returns : StrMessage_t  
  
#### Description  
  
...  
  
 
#### Input  
- 
#### Output  
- 
### Method getPassed  
returns : UDINT  
  
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
### Method getSystemTime  
returns : UDINT  
  
#### Description  
  
...  
  
 
#### Input  
- 
#### Output  
- 
### Method getTime  
returns : UDINT  
  
#### Description  
  
...  
  
 
#### Input  
- 
#### Output  
- 
### Method logError  
returns : BOOL  
  
#### Description  
  
...  
  
 
#### Input  
|Name |Type |Comment| 
|---- |---- |----   | 
|i_strMessage |StrMessage_t || 

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
### Method prepare  
returns : ERetCode_t  
  
#### Description  
  
...  
  
 
#### Input  
- 
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
returns : STestcase_t  
  
#### Description  
  
...  
  
 
#### Input  
- 
#### Output  
- 
### Method Get  
returns : STestcase_t  
  
#### Description  
 
#### Input  
- 
#### Output  
- 
### Method setEndTime  
returns : BOOL  
  
#### Description  
  
...  
  
 
#### Input  
- 
#### Output  
- 
### Method setMessage  
returns : BOOL  
  
#### Description  
  
...  
  
 
#### Input  
|Name |Type |Comment| 
|---- |---- |----   | 
|strValue |StrMessage_t || 

#### Output  
- 
### Method setStartTime  
returns : BOOL  
  
#### Description  
  
...  
  
 
#### Input  
- 
#### Output  
- 
### Method strncmp  
returns : BOOL  
  
#### Description  
  
...  
  
 
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
  
...  
  
 
#### Input  
|Name |Type |Comment| 
|---- |---- |----   | 
|var1 |ANY || 
|var2 |ANY || 

#### Output  
- 

