
/* ===========================================================
Insert data.
============================================================== */
 INSERT into mt_audioconfconnection 
       (c_ConferenceID,
        c_Payer,
        c_UserBilled,
        c_UserName,
        c_UserRole,
        c_OrganizationName,
        c_userphonenumber,
        c_specialinfo,
        c_CallType,
        c_transport,
        c_Mode,
        c_ConnectTime,
        c_EnteredConferenceTime,
        c_ExitedConferenceTime,
        c_DisconnectTime,
        c_Transferred,
        c_TerminationReason,
        c_ISDNDisconnectCause,
        c_TrunkNumber,
        c_LineNumber,
        c_DNISDigits,
        c_ANIDigits,
        c_ConnectionMinutes,
        c_CalendarCode,
        c_CountryNameID,
        c_ServiceLevel,
        c_BridgeAmount,
        c_TransportAmount,
        c_MTBatchID,
        c_MTBatchNameSpace) 
       VALUES 
       (%%CONFERENCE_ID%%,
        '%%ACCOUNT_NAME%%',
        'N',
        '%%TEST_NAME%%',
        'CSR',
        'Metratech Inc.',
        '001-9856777',
        'Expo Update',
        'Dial-In',
        'Domestic',
        'Direct-Dialed',
        %%CONNECT_TIME%%,
        %%%SYSTEMDATE%%%,
        %%%SYSTEMDATE%%%,
        %%%SYSTEMDATE%%%,
        'N',
        'Normal',
        0,
        10,
        35,
        '781 398 2000',
        '781 398 2242',
        30.000000,
        1047,
        613,
        830,
        25.000000,
        23.000000,
        '2',
        'MT        ')

 