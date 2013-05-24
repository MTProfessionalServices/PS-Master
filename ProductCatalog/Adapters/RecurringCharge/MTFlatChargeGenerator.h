// MTFlatChargeGenerator.h : Declaration of the CMTFlatChargeGenerator

#pragma once
#include "resource.h"       // main symbols

#include "RecurringChargeAdapter.h"

class IMTRecurringChargeVisitor;

// CMTFlatChargeGenerator

class ATL_NO_VTABLE CMTFlatChargeGenerator : 
	public CComObjectRootEx<CComMultiThreadModel>,
	public CComCoClass<CMTFlatChargeGenerator, &CLSID_MTFlatChargeGenerator>,
	public ISupportErrorInfo,
	public IDispatchImpl<IMTChargeGenerator, &IID_IMTChargeGenerator, &LIBID_RECURRINGCHARGEADAPTERLib, /*wMajor =*/ 1, /*wMinor =*/ 0>
{
public:
	CMTFlatChargeGenerator()
	{
		m_pUnkMarshaler = NULL;
	}

DECLARE_REGISTRY_RESOURCEID(IDR_MTFLATCHARGEGENERATOR)


BEGIN_COM_MAP(CMTFlatChargeGenerator)
	COM_INTERFACE_ENTRY(IMTChargeGenerator)
	COM_INTERFACE_ENTRY(IDispatch)
	COM_INTERFACE_ENTRY(ISupportErrorInfo)
	COM_INTERFACE_ENTRY_AGGREGATE(IID_IMarshal, m_pUnkMarshaler.p)
END_COM_MAP()

// ISupportsErrorInfo
	STDMETHOD(InterfaceSupportsErrorInfo)(REFIID riid);

	DECLARE_PROTECT_FINAL_CONSTRUCT()
	DECLARE_GET_CONTROLLING_UNKNOWN()

	HRESULT FinalConstruct()
	{
		return CoCreateFreeThreadedMarshaler(
			GetControllingUnknown(), &m_pUnkMarshaler.p);
	}

	void FinalRelease()
	{
		m_pUnkMarshaler.Release();
	}

	CComPtr<IUnknown> m_pUnkMarshaler;

public:

	STDMETHOD(GetArrearsCharges)(long aPITypeID, long aIntervalID, long aBillingGroupID, long aRunID, BSTR aConfigPath, IMTSQLRowset** apCharges);
	STDMETHOD(GetAdvanceCharges)(long aPITypeID, long aIntervalID, long aBillingGroupID, long aRunID, BSTR aConfigPath, IMTSQLRowset** apCharges);
	STDMETHOD(GetArrearsChargesScript)(long aPITypeID, long aIntervalID, long aBillingGroupID, long aRunID, BSTR aConfigPath, BSTR * apScript);
	STDMETHOD(GetAdvanceChargesScript)(long aPITypeID, long aIntervalID, long aBillingGroupID, long aRunID, BSTR aConfigPath, BSTR * apScript);

private:
  STDMETHOD(InternalGetArrearsCharges)(long aPITypeID, long aIntervalID, long aBillingGroupID, long aRunID, BSTR aConfigPath, IMTRecurringChargeVisitor * pVisitor);
  STDMETHOD(InternalGetAdvanceCharges)(long aPITypeID, long aIntervalID, long aBillingGroupID, long aRunID, BSTR aConfigPath, IMTRecurringChargeVisitor * pVisitor);
};

OBJECT_ENTRY_AUTO(__uuidof(MTFlatChargeGenerator), CMTFlatChargeGenerator)
