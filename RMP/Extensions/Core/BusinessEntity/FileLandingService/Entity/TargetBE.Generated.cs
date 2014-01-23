//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.296
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Core.FileLandingService
{
  using System;
  using System.Collections.Generic;
  using System.Collections.ObjectModel;
  using System.Runtime.Serialization;
  using System.Linq;
  using MetraTech.Basic;
  using MetraTech.BusinessEntity.Core;
  using MetraTech.BusinessEntity.Core.Model;
  using MetraTech.BusinessEntity.DataAccess.Metadata;
  using MetraTech.BusinessEntity.DataAccess.Persistence;
  
  
  [System.Runtime.Serialization.DataContractAttribute(IsReference=true)]
  [System.SerializableAttribute()]
  [System.Runtime.Serialization.KnownTypeAttribute("GetKnownTypes")]
  [MetraTech.BusinessEntity.Core.Model.ConfigDrivenAttribute()]
  public partial class TargetBE : MetraTech.BusinessEntity.DataAccess.Metadata.DataObject, global::Core.FileLandingService.Interface.ITargetBE
  {
    
    public const string FullName = "Core.FileLandingService.TargetBE";
    
    private int @__Version;
    
    public const string Property__Version = "_Version";
    
    private System.Nullable<System.DateTime> _creationDate;
    
    public const string Property_CreationDate = "CreationDate";
    
    private System.Nullable<System.DateTime> _updateDate;
    
    public const string Property_UpdateDate = "UpdateDate";
    
    private System.Nullable<System.Int32> _uID;
    
    public const string Property_UID = "UID";
    
    public const string Property_Id = "Id";
    
    private global::Core.FileLandingService.TargetBEBusinessKey _targetBEBusinessKey = new TargetBEBusinessKey();
    
    private string @__Description;
    
    public const string Property__Description = "_Description";
    
    private string @__Executable;
    
    public const string Property__Executable = "_Executable";
    
    private string @__Name;
    
    public const string Property__Name = "_Name";
    
    private bool @__RedirectFileToStdin = false;
    
    public const string Property__RedirectFileToStdin = "_RedirectFileToStdin";
    
    private string @__Regex;
    
    public const string Property__Regex = "_Regex";
    
    private MetraTech.DomainModel.Enums.Core.Metratech_com_FileLandingService.ETargetType @__Type = MetraTech.DomainModel.Enums.Core.Metratech_com_FileLandingService.ETargetType.EXECUTABLE;
    
    public const string Property__Type = "_Type";
    
    private IList<global::Core.FileLandingService.Interface.IArgumentBE> _argumentBEs = new List<global::Core.FileLandingService.Interface.IArgumentBE>();
    
    private IList<global::Core.FileLandingService.Interface.ITargetBE_ArgumentBE> _targetBE_ArgumentBEList = new List<global::Core.FileLandingService.Interface.ITargetBE_ArgumentBE>();
    
    private IList<global::Core.FileLandingService.Interface.IInvocationRecordBE> _invocationRecordBEs = new List<global::Core.FileLandingService.Interface.IInvocationRecordBE>();
    
    private IList<global::Core.FileLandingService.Interface.ITargetBE_InvocationRecordBE> _targetBE_InvocationRecordBEList = new List<global::Core.FileLandingService.Interface.ITargetBE_InvocationRecordBE>();
    
    private global::Core.FileLandingService.Interface.IProgramCodeBE _programCodeBE;
    
    private IList<global::Core.FileLandingService.Interface.ITargetBE_ProgramCodeBE> _targetBE_ProgramCodeBEList = new List<global::Core.FileLandingService.Interface.ITargetBE_ProgramCodeBE>();
    
    public const string Relationship_TargetBE_ArgumentBE = "TargetBE_ArgumentBE";
    
    public const string Relationship_TargetBE_InvocationRecordBE = "TargetBE_InvocationRecordBE";
    
    public const string Relationship_TargetBE_ProgramCodeBE = "TargetBE_ProgramCodeBE";
    
    public const string Property_InternalKey = "InternalKey";
    
    [System.Runtime.Serialization.DataMemberAttribute()]
    public override int _Version
    {
      get
      {
        return this.@__Version;
      }
      set
      {
        this.@__Version = value;
      }
    }
    
    [System.Runtime.Serialization.DataMemberAttribute()]
    public override System.Nullable<System.DateTime> CreationDate
    {
      get
      {
        return this._creationDate;
      }
      set
      {
        this._creationDate = value;
      }
    }
    
    [System.Runtime.Serialization.DataMemberAttribute()]
    public override System.Nullable<System.DateTime> UpdateDate
    {
      get
      {
        return this._updateDate;
      }
      set
      {
        this._updateDate = value;
      }
    }
    
    [System.Runtime.Serialization.DataMemberAttribute()]
    public virtual System.Nullable<System.Int32> UID
    {
      get
      {
        return this._uID;
      }
      set
      {
        this._uID = value;
      }
    }
    
    [MetraTech.BusinessEntity.DataAccess.Metadata.BusinessKeyAttribute()]
    [System.Runtime.Serialization.DataMemberAttribute()]
    public virtual global::Core.FileLandingService.TargetBEBusinessKey TargetBEBusinessKey
    {
      get
      {
        return this._targetBEBusinessKey;
      }
      set
      {
        this._targetBEBusinessKey = value;
      }
    }
    
    [System.Runtime.Serialization.DataMemberAttribute()]
    public virtual string _Description
    {
      get
      {
        return this.@__Description;
      }
      set
      {
        this.@__Description = value;
      }
    }
    
    [System.Runtime.Serialization.DataMemberAttribute()]
    public virtual string _Executable
    {
      get
      {
        return this.@__Executable;
      }
      set
      {
        this.@__Executable = value;
      }
    }
    
    [System.Runtime.Serialization.DataMemberAttribute()]
    public virtual string _Name
    {
      get
      {
        return this.@__Name;
      }
      set
      {
        this.@__Name = value;
      }
    }
    
    [System.Runtime.Serialization.DataMemberAttribute()]
    public virtual bool _RedirectFileToStdin
    {
      get
      {
        return this.@__RedirectFileToStdin;
      }
      set
      {
        this.@__RedirectFileToStdin = value;
      }
    }
    
    [System.Runtime.Serialization.DataMemberAttribute()]
    public virtual string _Regex
    {
      get
      {
        return this.@__Regex;
      }
      set
      {
        this.@__Regex = value;
      }
    }
    
    [System.Runtime.Serialization.DataMemberAttribute()]
    public virtual MetraTech.DomainModel.Enums.Core.Metratech_com_FileLandingService.ETargetType _Type
    {
      get
      {
        return this.@__Type;
      }
      set
      {
        this.@__Type = value;
      }
    }
    
    public virtual List<global::Core.FileLandingService.Interface.IArgumentBE> ArgumentBEs
    {
      get
      {
        return _argumentBEs as List<global::Core.FileLandingService.Interface.IArgumentBE>;
      }
      set
      {
        this._argumentBEs = value;
      }
    }
    
    public virtual IList<global::Core.FileLandingService.Interface.ITargetBE_ArgumentBE> TargetBE_ArgumentBEList
    {
      get
      {
        return this._targetBE_ArgumentBEList;
      }
      set
      {
        this._targetBE_ArgumentBEList = value;
      }
    }
    
    public virtual List<global::Core.FileLandingService.Interface.IInvocationRecordBE> InvocationRecordBEs
    {
      get
      {
        return _invocationRecordBEs as List<global::Core.FileLandingService.Interface.IInvocationRecordBE>;
      }
      set
      {
        this._invocationRecordBEs = value;
      }
    }
    
    public virtual IList<global::Core.FileLandingService.Interface.ITargetBE_InvocationRecordBE> TargetBE_InvocationRecordBEList
    {
      get
      {
        return this._targetBE_InvocationRecordBEList;
      }
      set
      {
        this._targetBE_InvocationRecordBEList = value;
      }
    }
    
    public virtual global::Core.FileLandingService.Interface.IProgramCodeBE ProgramCodeBE
    {
      get
      {
        return this._programCodeBE;
      }
      set
      {
        this._programCodeBE = value;
      }
    }
    
    public virtual IList<global::Core.FileLandingService.Interface.ITargetBE_ProgramCodeBE> TargetBE_ProgramCodeBEList
    {
      get
      {
        return this._targetBE_ProgramCodeBEList;
      }
      set
      {
        this._targetBE_ProgramCodeBEList = value;
      }
    }
    
    public override void SetupRelationships()
    {
    }
    
    public virtual object Clone()
    {
      var _targetBE = new global::Core.FileLandingService.TargetBE();
      _targetBE.TargetBEBusinessKey = (global::Core.FileLandingService.TargetBEBusinessKey)TargetBEBusinessKey.Clone();
      _targetBE._Description = _Description;
      _targetBE._Executable = _Executable;
      _targetBE._Name = _Name;
      _targetBE._RedirectFileToStdin = _RedirectFileToStdin;
      _targetBE._Regex = _Regex;
      _targetBE._Type = _Type;
      return _targetBE;
    }
    
    public virtual void Save()
    {
      var item = this;
      global::MetraTech.BusinessEntity.DataAccess.Persistence.StandardRepository.Instance.SaveInstance(ref item);
    }
    
    public override void CopyPropertiesFrom(global::MetraTech.BusinessEntity.DataAccess.Metadata.DataObject dataObject)
    {
      var item = dataObject as global::Core.FileLandingService.TargetBE;
      _Description = item._Description;
      _Executable = item._Executable;
      _Name = item._Name;
      _RedirectFileToStdin = item._RedirectFileToStdin;
      _Regex = item._Regex;
      _Type = item._Type;
      TargetBEBusinessKey = item.TargetBEBusinessKey;
    }
    
    public static new System.Type[] GetKnownTypes()
    {
      var knownTypes = new List<System.Type>();
      knownTypes.Add(typeof(MetraTech.DomainModel.Enums.Core.Metratech_com_FileLandingService.ETargetType));
      knownTypes.Add(typeof(global::Core.FileLandingService.TargetBEBusinessKey));
      return knownTypes.ToArray();
    }
  }
  
  [System.Runtime.Serialization.DataContractAttribute(IsReference=true)]
  [System.SerializableAttribute()]
  public partial class TargetBEBusinessKey : MetraTech.BusinessEntity.DataAccess.Metadata.BusinessKey, global::Core.FileLandingService.Interface.ITargetBEBusinessKey
  {
    
    private string _entityFullName = "Core.FileLandingService.TargetBE";
    
    private System.Guid _internalKey;
    
    [System.Runtime.Serialization.DataMemberAttribute()]
    public override string EntityFullName
    {
      get
      {
        return this._entityFullName;
      }
      set
      {
        this._entityFullName = "Core.FileLandingService.TargetBE";
      }
    }
    
    [System.Runtime.Serialization.DataMemberAttribute()]
    public virtual System.Guid InternalKey
    {
      get
      {
        return this._internalKey;
      }
      set
      {
        this._internalKey = value;
      }
    }
    
    public override object Clone()
    {
      var _businessKey = new TargetBEBusinessKey();
      _businessKey.InternalKey = InternalKey;
      return _businessKey;
    }
  }
}
