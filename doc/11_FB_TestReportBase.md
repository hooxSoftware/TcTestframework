[[_TOC_]]

## FB_TestReportBase

returns : -   
#### Description  
 
#### Input  
- 
#### Output  
- 
### Method addCrlf  
returns : BOOL  
  
#### Description  
 
#### Input  
- 
#### Output  
- 
### Method addDate  
returns : ERetCode_t  
  
#### Description  
 
#### Input  
|Name |Type |Comment| 
|---- |---- |----   | 
|i_sDate |TIMESTRUCT || 

#### Output  
- 
### Method addString  
returns : ERetCode_t  
  
#### Description  
 
#### Input  
|Name |Type |Comment| 
|---- |---- |----   | 
|i_strData |STRING(255) || 

#### Output  
- 
### Method addTime  
returns : ERetCode_t  
  
#### Description  
 
#### Input  
|Name |Type |Comment| 
|---- |---- |----   | 
|i_sTime |TIMESTRUCT || 

#### Output  
- 
### Method addValue  
returns : ERetCode_t  
  
#### Description  
 
#### Input  
|Name |Type |Comment| 
|---- |---- |----   | 
|i_anyValue |ANY || 

#### Output  
- 
### Method BuildFile  
returns : ERetCode_t  
  
#### Description  
 
#### Input  
|Name |Type |Comment| 
|---- |---- |----   | 
|i_u32Line |UDINT || 

#### Output  
- 
### Method clearBuffer  
returns : ERetCode_t  
  
#### Description  
 
#### Input  
- 
#### Output  
- 
### Method Close  
returns : ERetCode_t  
  
#### Description  
 
#### Input  
- 
#### Output  
- 
### Method create  
returns : ERetCode_t;  
  
#### Description  
 
#### Input  
- 
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

#### Output  
- 
### Method getFileName  
returns : ERetCode_t  
  
#### Description  
 
#### Input  
|Name |Type |Comment| 
|---- |---- |----   | 
|i_pFileName |NameHandle_t || 
|i_pPath |PathHandle_t || 

#### Output  
- 
### Method getTime  
returns : TimeStruct  
  
#### Description  
 
#### Input  
- 
#### Output  
- 
### Method open  
returns : ERetCode_t  
  
#### Description  
 
#### Input  
- 
#### Output  
- 
### Method reset  
returns : BOOL  
  
#### Description  
 
#### Input  
- 
#### Output  
- 
### Method writeBuffer  
returns : ERetCode_t  
  
#### Description  
 
#### Input  
- 
#### Output  
- 
### Method writeData  
returns : ERetCode_t  
  
#### Description  
 
#### Input  
|Name |Type |Comment| 
|---- |---- |----   | 
|i_pData |POINTER || 
|u32Size |UDINT || 

#### Output  
- 

