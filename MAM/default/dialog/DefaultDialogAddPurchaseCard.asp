<%@ LANGUAGE="VBscript" CODEPAGE=65001 %>
<%
' ---------------------------------------------------------------------------------------------------------------------------------------
'  @doc $Workfile$
' 
'  Copyright 1998,2000 by MetraTech Corporation
'  All rights reserved.
' 
'  THIS SOFTWARE IS PROVIDED "AS IS", AND MetraTech Corporation MAKES
'  NO REPRESENTATIONS OR WARRANTIES, EXPRESS OR IMPLIED. By way of
'  example, but not limitation, MetraTech Corporation MAKES NO
'  REPRESENTATIONS OR WARRANTIES OF MERCHANTABILITY OR FITNESS FOR ANY
'  PARTICULAR PURPOSE OR THAT THE USE OF THE LICENSED SOFTWARE OR
'  DOCUMENTATION WILL NOT INFRINGE ANY THIRD PARTY PATENTS,
'  COPYRIGHTS, TRADEMARKS OR OTHER RIGHTS.
' 
'  Title to copyright in this software and any associated
'  documentation shall at all times remain with MetraTech Corporation,
'  and USER agrees to preserve the same.
' 
'  Created by: Kevin A. Boucher
' 
'  $Date$
'  $Author$
'  $Revision$
' ---------------------------------------------------------------------------------------------------------------------------------------
Option Explicit
%>
<!-- #INCLUDE FILE="../../auth.asp" -->
<!-- #INCLUDE FILE="../../MamIncludeMDM.asp" -->
<!-- #INCLUDE FILE="../../default/lib/MamLibrary.asp" -->
<!-- #INCLUDE FILE="../../default/lib/AccountLib.asp" -->
<!-- #INCLUDE FILE="../../default/lib/PaymentServerLib.asp" -->
<!-- #INCLUDE FILE="../../custom/Lib/CustomCode.asp" --> 
<%

' Mandatory
Form.ServiceMsixdefFileName       = "metratech.com\ps_cc_addaccountandpaymentmethod.msixdef"
Form.RouteTo                      = Mam().dictionary("PAYMENT_METHODS_DIALOG")
Form.Localize                     = FALSE
mdm_Main ' invoke the mdm framework

' ---------------------------------------------------------------------------------------------------------------------------------------
' FUNCTION   :  Form_Initialize
' PARAMETERS :  EventArg
' DESCRIPTION:
' RETURNS    :  Return TRUE if ok else FALSE
FUNCTION Form_Initialize(EventArg) ' As Boolean
  Dim PS
  
	Service.Clear 	' Set all the property of the service to empty. 
					        ' The Product view if allocated is cleared too.
  
  ' Add internal properties that are used to build the UI logic.  These properties will not be metered.
  Service.Properties.Add "defaultpayment", "Boolean",  0, False, TRUE  ' Add the default payment flag on the fly
  Service.Properties.Add "MONTHS",         "string",   2, TRUE, ""  
  Service.Properties.Add "YEARS",          "string",   4, TRUE, "2"  
    
  ' Setup service properties
  Service.Properties("_AccountID").Value = MAM().Subscriber("_AccountId").Value
  Service.Properties("expdateformat").Value = 3 ' (MMYYYY) 
  Service.Properties("cardid").Value              = "1111"
  Service.Properties("cardverifyvalue").Value     = "111"
  Service.Properties("companyaddress").Value      = "comp. addr."
  Service.Properties("companypostalcode").Value   = "010101"
  Service.Properties("companyphone").Value        = "1231234"
  Service.Properties("reserved1").Value           = "hello"
  Service.Properties("reserved2").Value           = "world"
  Service.Properties("email").Value               = MAM().Subscriber("email")

  Service.Properties("customerreferenceid").Value = ""
  Service.Properties("customervatnumber").Value   = ""
      
  Service("Country").SetPropertyType "ENUM","global","CountryName"
  Service("country").Value = MAM().Subscriber("Country") 
  Service("creditcardtype").SetPropertyType "ENUM", "metratech.com/paymentserver", "PurchaseCard"
  
  Service.Properties("MONTHS").AddValidListOfValues Array("01","02","03","04","05","06","07","08","09","10","11","12")
  
  set PS = CreateObject("MTPaymentServerHelper.PaymentServer")
  Service.Properties("YEARS").AddValidListOfValues PS.GetYearsArray()
        
  ' required fields that get populated in the OK_CLICK, so set dummy values for 
  Service.Properties("expdate").Value = "111111"

  SetRequiredProperties(EventArg) 

  Service.Properties("creditcardtype").Caption = mam_GetDictionary("TEXT_CREDIT_CARD_TYPE")
  Service.Properties("creditcardnum_").Caption = mam_GetDictionary("TEXT_CREDIT_CARD_NUM")
  Service.Properties("creditcardseccode_").Caption = mam_GetDictionary("TEXT_CARD_VERIFY_VALUE")  
  Service.Properties("customername").Caption   = mam_GetDictionary("TEXT_CUSTOMER_NAME")
  Service.Properties("address").Caption        = mam_GetDictionary("TEXT_ADDRESS")
  Service.Properties("city").Caption           = mam_GetDictionary("TEXT_CITY")
  Service.Properties("state").Caption          = mam_GetDictionary("TEXT_STATE")
  Service.Properties("zip").Caption            = mam_GetDictionary("TEXT_ZIP")
  Service.Properties("COUNTRY").Caption        = mam_GetDictionary("TEXT_COUNTRY")
  Service.Properties("customerreferenceid").Caption = mam_GetDictionary("TEXT_CUSTOMER_REFERENCE_ID")
  Service.Properties("customervatnumber").Caption   = mam_GetDictionary("TEXT_CUSTOMER_VAT_NUMBER")
      
  Form_Initialize = TRUE
END FUNCTION

' ---------------------------------------------------------------------------------------------------------------------------------------
' FUNCTION   :  SetRequiredProperties
' PARAMETERS :  EventArg
' DESCRIPTION:
' RETURNS    :  Return TRUE if ok else FALSE
FUNCTION SetRequiredProperties(EventArg) ' As Boolean

  Service.Properties("creditcardtype").Required = TRUE
  Service.Properties("creditcardnum_").Required = TRUE
  Service.Properties("MONTHS").Required         = TRUE
  Service.Properties("YEARS").Required          = TRUE
  Service.Properties("customername").Required   = TRUE
  Service.Properties("address").Required        = TRUE
  Service.Properties("city").Required           = TRUE
  Service.Properties("state").Required          = TRUE
  Service.Properties("zip").Required            = TRUE
  Service.Properties("COUNTRY").Required        = TRUE
  Service.Properties("customerreferenceid").Required = TRUE
  Service.Properties("customervatnumber").Required   = TRUE
  
  SetRequiredProperties = TRUE 
END FUNCTION


' ---------------------------------------------------------------------------------------------------------------------------------------
' FUNCTION   :  OK_Click
' PARAMETERS :  EventArg
' DESCRIPTION:
' RETURNS    :  Return TRUE if ok else FALSE
FUNCTION OK_Click(EventArg) ' As Boolean

    On Error Resume Next

    If Len(Trim(Service.Properties("creditcardseccode_"))) = 0 Then
      Service.Properties("creditcardseccode_").Enabled = false
    End If
        
    Service.Properties("expdate").Value = Service.Properties("MONTHS") & Service.Properties("YEARS")
           
    ' Meter
	  Service.Meter TRUE, , mam_getDictionary("PAYMENT_SERVER_NAME_IN_SERVERS_XML")
    If(CBool(Err.Number = 0)) then

       On Error Goto 0
       OK_Click = TRUE

       If Service.Properties("defaultpayment") Then
          OK_Click = SetAsPrimary(EventArg)
       End If

    Else        
        Service.Properties("creditcardseccode_").Enabled = true    
        EventArg.Error.Save Err  
        OK_Click = FALSE
    End If
    Err.Clear   
END FUNCTION

' ---------------------------------------------------------------------------------------------------------------------------------------
' FUNCTION   :  SetAsPrimary
' PARAMETERS :  EventArg
' DESCRIPTION:  Set as primary payment method
' RETURNS    :  Return TRUE if ok else FALSE
PRIVATE FUNCTION SetAsPrimary(EventArg) ' As Boolean
  Dim PrimaryService
  Dim strServiceMsixDefFile
  
    strServiceMsixDefFile = "metratech.com\ps_cc_updateprimaryindicator.msixdef"
    SetAsPrimary          = FALSE
    Set PrimaryService    = mdm_CreateObject(MSIXHandler_PROG_ID)
    
    If(PrimaryService.Initialize(strServiceMsixDefFile,,mdm_GetSessionVariable("mdm_APP_LANGUAGE"),mdm_GetSessionVariable("mdm_APP_FOLDER"),mdm_GetMDMFolder(),mdm_InternalCache))Then
  
        PrimaryService.Properties("_AccountID")           = Service("_AccountID")
        PrimaryService.Properties("lastfourdigits").Value = Right(Service("creditcardnum_"), 4)
        PrimaryService.Properties("creditcardtype").Value = Service("creditcardtype")
        PrimaryService.Properties("testsession").Value    = Service("testsession")
        
        On Error Resume Next
        PrimaryService.Meter TRUE, , mam_getDictionary("PAYMENT_SERVER_NAME_IN_SERVERS_XML")
        If(Err.Number)Then
            EventArg.Error.Save Err
            XService.Log EventArg.Error.ToString,eLOG_ERROR
        Else
            SetAsPrimary = UsePaymentServer
        End If
        On Error Goto 0      
    End If

END FUNCTION

%>

