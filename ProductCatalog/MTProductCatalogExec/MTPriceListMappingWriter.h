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
// MTPriceListMappingWriter.h : Declaration of the CMTPriceListMappingWriter

#ifndef __MTPRICELISTMAPPINGWRITER_H_
#define __MTPRICELISTMAPPINGWRITER_H_

#include "resource.h"       // main symbols
#include <comsvcs.h>

/////////////////////////////////////////////////////////////////////////////
// CMTPriceListMappingWriter
class ATL_NO_VTABLE CMTPriceListMappingWriter : 
	public CComObjectRootEx<CComSingleThreadModel>,
	public CComCoClass<CMTPriceListMappingWriter, &CLSID_MTPriceListMappingWriter>,
	public ISupportErrorInfo,
	public IObjectControl,
	public IDispatchImpl<IMTPriceListMappingWriter, &IID_IMTPriceListMappingWriter, &LIBID_MTPRODUCTCATALOGEXECLib>
{
public:
	CMTPriceListMappingWriter()
	{
	}

DECLARE_REGISTRY_RESOURCEID(IDR_MTPRICELISTMAPPINGWRITER)

DECLARE_PROTECT_FINAL_CONSTRUCT()

DECLARE_NOT_AGGREGATABLE(CMTPriceListMappingWriter)

BEGIN_COM_MAP(CMTPriceListMappingWriter)
	COM_INTERFACE_ENTRY(IMTPriceListMappingWriter)
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

// IMTPriceListMappingWriter
public:
	STDMETHOD(Update)(/*[in]*/ IMTSessionContext* apCtxt, /*[in]*/ IMTPriceListMapping* apPrcLstMap);

// data
private:
	CComPtr<IObjectContext> mpObjectContext;
};

#endif //__MTPRICELISTMAPPINGWRITER_H_
