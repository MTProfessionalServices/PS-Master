/**************************************************************************
* Copyright 1997-2001 by MetraTech
* All rights reserved.
*
* THIS SOFTWARE IS PROVIDED "AS IS", AND MetraTech MAKES NO
* REPRESENTATIONS OR WARRANTIES, EXPRESS OR IMPLIED. By way of
* example, but not limitation, MetraTech MAKES NO REPRESENTATIONS OR
* WARRANTIES OF MERCHANTABILITY OR FITNESS FOR ANY PARTICULAR PURPOSE
* OR THAT THE USE OF THE LICENCED SOFTWARE OR DOCUMENTATION WILL NOT
* INFRINGE ANY THIRD PARTY PATENTS, COPYRIGHTS, TRADEMARKS OR OTHER
* RIGHTS.
*
* Title to copyright in this software and any associated
* documentation shall at all times remain with MetraTech, and USER
* agrees to preserve the same.
*
* $Header$
* 
***************************************************************************/


#ifndef __MTCOUNTERREADER_H_
#define __MTCOUNTERREADER_H_

#include "resource.h"       // main symbols
#include <comsvcs.h>
//#include <MTCounter.h>

#define GET_ALL_COUNTERS				"__GET_ALL_COUNTERS__"
#define GET_COUNTER							"__GET_COUNTER__"
#define GET_COUNTERS_OF_TYPE		"__GET_COUNTERS_OF_TYPE__"

/////////////////////////////////////////////////////////////////////////////
// CMTCounterReader
class ATL_NO_VTABLE CMTCounterReader : 
	public CComObjectRootEx<CComSingleThreadModel>,
	public CComCoClass<CMTCounterReader, &CLSID_MTCounterReader>,
	public ISupportErrorInfo,
	public IObjectControl,
	public IDispatchImpl<IMTCounterReader, &IID_IMTCounterReader, &LIBID_MTPRODUCTCATALOGEXECLib>
{
public:
	CMTCounterReader()
	{
	}

DECLARE_REGISTRY_RESOURCEID(IDR_MTCOUNTERREADER)

DECLARE_PROTECT_FINAL_CONSTRUCT()

DECLARE_NOT_AGGREGATABLE(CMTCounterReader)

BEGIN_COM_MAP(CMTCounterReader)
	COM_INTERFACE_ENTRY(IMTCounterReader)
	COM_INTERFACE_ENTRY(ISupportErrorInfo)
	COM_INTERFACE_ENTRY(IObjectControl)
	COM_INTERFACE_ENTRY(IDispatch)
END_COM_MAP()


// ISupportsErrorInfo
	STDMETHOD(InterfaceSupportsErrorInfo)(REFIID riid);

// IObjectControl
public:
	STDMETHOD(Activate)();
	STDMETHOD_(BOOL, CanBePooled)();
	STDMETHOD_(void, Deactivate)();

	CComPtr<IObjectContext> mpObjectContext;

// IMTCounterReader
public:
	STDMETHOD(FindOfType)(/*[in]*/ IMTSessionContext* apCtxt, /*[in]*/long aDBTypeID, /*[out, retval]*/IMTCollection** apCounter);
	STDMETHOD(FindAsRowset)(/*[in]*/ IMTSessionContext* apCtxt, /*[in]*/VARIANT aFilter, /*[out, retval]*/IMTSQLRowset** apRowset);
	STDMETHOD(Find)(/*[in]*/ IMTSessionContext* apCtxt, /*[in]*/long aDBID, /*[out, retval]*/IMTCounter** apCounter);
};

#endif //__MTCOUNTERREADER_H_
