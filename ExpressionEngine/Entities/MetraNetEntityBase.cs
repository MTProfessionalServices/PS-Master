﻿using System.Globalization;
using MetraTech.ExpressionEngine.TypeSystem;
using MetraTech.ExpressionEngine.TypeSystem.Enumerations;
using System.Runtime.Serialization;

namespace MetraTech.ExpressionEngine.Entities
{
    [DataContract]
    public abstract class MetraNetEntityBase : Entity
    {
        #region Properties

        /// <summary>
        /// The extension that the Entity is associated with
        /// </summary>
        public string Extension { get; set; }

        #endregion

        #region Constructor
        protected MetraNetEntityBase(string name, ComplexType complexType, string description) : base(name, complexType, null, true, description)
        {
        }
        #endregion

        #region Methods
        public string GetFileNameGivenExtensionsDirectory(string extensionsDir)
        {
            return Helper.GetMetraNetConfigPath(extensionsDir, Extension, ((VectorType) Type).ComplexType + "s");
         }

        public void SaveInExtensionsDirectory(string extensionsDir)
        {
            var file = GetFileNameGivenExtensionsDirectory(extensionsDir);
            Save(file);
        }
        #endregion
    }
}
