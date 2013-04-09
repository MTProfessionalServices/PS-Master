﻿using System;
using System.Runtime.Serialization;
using System.Globalization;
using MetraTech.ExpressionEngine.Components;
using MetraTech.ExpressionEngine.Components.Enumerations;
using MetraTech.ExpressionEngine.MTProperties;
using MetraTech.ExpressionEngine.TypeSystem.Enumerations;
using MetraTech.ExpressionEngine.Validations;

namespace MetraTech.ExpressionEngine.TypeSystem
{
    /// <summary>
    /// A enumeration which requires a Namespace and FixedCategory 
    /// </summary>
    [DataContract (Namespace = "MetraTech")]
    public class EnumerationType : Type
    {
        #region Constants

        public const string CategoryPropertyName = "Category";
        #endregion

        #region Properties
        /// <summary>
        /// The namespace; used to prevent FixedCategory name collisions 
        /// </summary>
        public string Namespace { get { return BasicHelper.GetNamespaceFromFullName(Category); } }

        /// <summary>
        /// The enum's category. This is a fully qualified name that includes the namespace
        /// </summary>
        [DataMember]
        public string Category { get; set; }

        /// <summary>
        /// Returns a string that can be used to determine if two types are directly compatible (which is differnt than castable)
        /// </summary>
        /// <returns></returns>
        public override string CompatibleKey
        {
            get
            {
             return string.Format(CultureInfo.InvariantCulture, "{0}|{1}|{2}", BaseType, Namespace, Category);
            }
        }
        #endregion

        #region Constructor
        public EnumerationType(string category, BaseType baseType):base(baseType)
        {
            if (!IsGeneralEnumType(baseType))
                throw new ArgumentException("invalid base typeType");
            Category = category;
        }
        #endregion

        #region Methods
        public override string ToString(bool robust)
        {
            if (robust)
                return string.Format(CultureInfo.InvariantCulture, "{0}.{1}", BaseType, Category);
            return BaseType.ToString();
        }


        public override void AddComponentLinks(ComponentLinkCollection links)
        {
            if (links == null)
                throw new ArgumentException("links is null");

            links.Add(ComponentType.EnumerationCategory, this, CategoryPropertyName, true, "Enumeration Category");
        }

        public override void Validate(string prefix, ValidationMessageCollection messages, Context context, PropertyCollection properties)
        {
            base.Validate(prefix, messages, context, properties);

            if (messages == null)
                throw new ArgumentNullException("messages");

            //Check if the FixedCategory was specified
            if (string.IsNullOrEmpty(Category))
            {
                messages.Error(string.Format(CultureInfo.CurrentCulture, Localization.EnumCategoryNotSpecified));
                return;
            }

            //Check if the FixedCategory exists         
            if (context != null)
            {
                var enumCategory = context.GetEnumCategory(Category);
                if (enumCategory == null)
                    messages.Error(string.Format(CultureInfo.InvariantCulture, Localization.UnableToFindEnumCategory, Namespace + "." + Category));
            }
        }


        public new EnumerationType Copy()
        {
            var type = (EnumerationType)base.Copy();
            InternalCopy(type);
            type.Category = Category;
            return type;
        }

        public static bool IsGeneralEnumType(BaseType baseType)
        {
            return baseType == Enumerations.BaseType.Currency ||
                baseType == Enumerations.BaseType.Enumeration ||
                baseType == Enumerations.BaseType.UnitOfMeasure;
        }
        #endregion

    }
}
