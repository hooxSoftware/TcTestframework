[[_TOC_]]

## FB_FileBase

returns : -   
#### Description  
 
#### Input  
- 
#### Output  
|Name |Type |Comment| 
|---- |---- |----   | 
|o_bOpen |BOOL || 
|o_bError |BOOL || 
|o_bEmpty |BOOL || 

### Method addCrlf  
returns : ERetCode_t  
  
#### Description  
 
#### Input  
- 
#### Output  
- 
### Method addData  
returns : BOOL  
  
#### Description  
 
#### Input  
|Name |Type |Comment| 
|---- |---- |----   | 
|pData |POINTER || 
|u32Size |UDINT || 

#### Output  
- 
### Method addString  
returns : ERetCode_t  
  
#### Description  
METHOD PUBLIC addString : ERetCode_t  
VAR_INPUT  
 
#### Input  
|Name |Type |Comment| 
|---- |---- |----   | 
|i_strData |STRING(255) || 

#### Output  
- 
### Method addTimeMs  
returns : ERetCode_t  
  
#### Description  
      <Declaration><![CDATA[METHOD PUBLIC addTimeMs : ERetCode_t  
VAR_INPUT  
VAR  
 
#### Input  
|Name |Type |Comment| 
|---- |---- |----   | 
|i_u32Value |UDINT || 

#### Output  
- 
### Method addValue  
returns : ERetCode_t  
  
#### Description  
      <Declaration><![CDATA[(******************************************************************************  
Baustein: FB_TestReportBase.addValue  
Spezifikation: doc/Spezifikation.pdf, Kap. x.y.z  
-------------------------------------------------------------------------------  
erstellt:  
von:  
Geändert:  
von:  
-------------------------------------------------------------------------------  
Beschreibung  
  
-------------------------------------------------------------------------------  
Input  
	i_anyValue : ANY;  
  
Output  
-  
 
#### Input  
|Name |Type |Comment| 
|---- |---- |----   | 
|i_anyValue |ANY || 

#### Output  
- 
### Method clearBuffer  
returns : ERetCode_t  
  
#### Description  
set internal buffer to 0  
returns always ERetCode_t.eRetDone   
 
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
|Name |Type |Comment| 
|---- |---- |----   | 
|i_strPath |StrPathName_t || 
|i_strName |StrFileName_t || 

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

