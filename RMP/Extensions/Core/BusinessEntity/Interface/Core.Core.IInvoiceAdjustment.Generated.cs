//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.296
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Core.Core.Interface
{
  using System;
  using System.Collections.Generic;
  using System.Collections.ObjectModel;
  using MetraTech.BusinessEntity.Core.Model;
  using MetraTech.BusinessEntity.DataAccess.Metadata;
  
  
  public interface IInvoiceAdjustment : global::MetraTech.BusinessEntity.DataAccess.Metadata.IDataObject
  {
    
    int PropId
    {
      get;
      set;
    }
    
    System.Nullable<System.Int32> PiTypeId
    {
      get;
      set;
    }
    
    System.Nullable<System.Int32> NAdjustmentType
    {
      get;
      set;
    }
    
    string SupportBulk
    {
      get;
      set;
    }
    
    System.Nullable<System.Int32> FormulaId
    {
      get;
      set;
    }
    
    System.Nullable<System.Int32> NCompositeAdjustment
    {
      get;
      set;
    }
    
    string Currency
    {
      get;
      set;
    }
    
    System.Nullable<System.Decimal> Amount
    {
      get;
      set;
    }
    
    string Description
    {
      get;
      set;
    }
    
    System.Nullable<System.Int32> ReasonCode
    {
      get;
      set;
    }
    
    System.Nullable<System.Int32> InternalId
    {
      get;
      set;
    }
    
    global::Core.Core.Interface.IDispute Dispute
    {
      get;
      set;
    }
    
    void Save();
  }
  
  public interface IInvoiceAdjustmentBusinessKey : global::MetraTech.BusinessEntity.DataAccess.Metadata.IBusinessKey
  {
    
    System.Guid InternalKey
    {
      get;
      set;
    }
  }
}
