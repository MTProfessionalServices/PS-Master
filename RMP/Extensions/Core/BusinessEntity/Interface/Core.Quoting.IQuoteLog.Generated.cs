//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.296
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Core.Quoting.Interface
{
  using System;
  using System.Collections.Generic;
  using System.Collections.ObjectModel;
  using MetraTech.BusinessEntity.Core.Model;
  using MetraTech.BusinessEntity.DataAccess.Metadata;
  
  
  public interface IQuoteLog : global::MetraTech.BusinessEntity.DataAccess.Metadata.IDataObject
  {
    
    System.Nullable<System.DateTime> DateAdded
    {
      get;
      set;
    }
    
    string Message
    {
      get;
      set;
    }
    
    string QuoteIdentifier
    {
      get;
      set;
    }
    
    void Save();
  }
  
  public interface IQuoteLogBusinessKey : global::MetraTech.BusinessEntity.DataAccess.Metadata.IBusinessKey
  {
    
    System.Guid InternalKey
    {
      get;
      set;
    }
  }
}
