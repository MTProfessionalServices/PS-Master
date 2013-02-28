﻿using System;
using System.Collections;
using System.IO;
using MetraTech.ExpressionEngine.MTProperties;
using MetraTech.ExpressionEngine.PropertyBags;
using MetraTech.ExpressionEngine.TypeSystem;
using MetraTech.ExpressionEngine.TypeSystem.Constants;
using MetraTech.ExpressionEngine.TypeSystem.Enumerations;
using MetraTech.ExpressionEngine.Components;
using System.Globalization;
using MetraTech.ICE.TreeFlows;
using Function = MetraTech.ICE.TreeFlows.Function;
using Type = MetraTech.ExpressionEngine.TypeSystem.Type;

namespace MetraTech.ICE.ExpressionEngine
{
  public static class EEConvert
  {
    public static Type GetMtType(DataTypeInfo dtInfo)
    {
      var baseType = TypeHelper.GetBaseType(dtInfo.ToString());
      var mtType = TypeFactory.Create(baseType);
      switch (baseType)
      {
        case BaseType.Enumeration:
          var mtEnum = (MetraTech.ExpressionEngine.TypeSystem.EnumerationType) mtType;
          mtEnum.Namespace = dtInfo.EnumSpace;
          mtEnum.Category = dtInfo.EnumType;
          break;
        case BaseType.String:
          if (dtInfo.Length == null)
            ((StringType) mtType).Length = 0;
          else
            ((StringType) mtType).Length = (int) dtInfo.Length;
          break;
      }
      return mtType;
    }

    public static MetraTech.ExpressionEngine.MTProperties.Property GetProperty(string propertyBagTypeName, Property oldProperty)
    {
        var type = GetMtType(oldProperty.DataTypeInfo);
        var property = PropertyFactory.Create(propertyBagTypeName, oldProperty.Name, type, oldProperty.Required, oldProperty.Description);
        return property;
    }

    public static void CopyProperties(string propertyBagTypeName, PropertyCollection oldCollection, MetraTech.ExpressionEngine.MTProperties.PropertyCollection newCollection)
    {
      foreach (var oldProperty in oldCollection)
      {
        //var type = GetMtType(oldProperty.DataTypeInfo);
        //var property = PropertyFactory.Create(propertyBagTypeName, oldProperty.Name, type, oldProperty.Required, oldProperty.Description);
        var property = GetProperty(propertyBagTypeName, oldProperty);
        newCollection.Add(property);
      }
    }

    public static PropertyBag GetEntity(ElementBase oldEntity)
    {
      string propertyBagTypeName;
      MetraNetEntityBase entity;
      PropertyCollection propertyCollection;
      switch(oldEntity.ElementType)
      {
        case ElementType.AccountView:
          propertyBagTypeName = PropertyBagConstants.AccountView;
          propertyCollection = ((AccountView) oldEntity).Properties;
          var avEntity = PropertyBagFactory.CreateAccountViewEntity(oldEntity.NameWithinNamespace, oldEntity.Description);
          entity = avEntity;
          break;
        case ElementType.ProductView:
          propertyBagTypeName = PropertyBagConstants.ProductView;
          propertyCollection = ((ProductView) oldEntity).Properties;
          var pvEntity = PropertyBagFactory.CreateProductViewEntity(oldEntity.NameWithinNamespace, oldEntity.Description);
          //foreach (var key in ((ProductView)oldEntity).UKConstraints)
          //{
          //  pvEntity.UniqueKey.Add(key);
          //}
          entity = pvEntity;
          break;
        case ElementType.ServiceDefinition:
          propertyBagTypeName = PropertyBagConstants.ServiceDefinition;
          propertyCollection = ((ServiceDefinition) oldEntity).Properties;
          var sdEntity = PropertyBagFactory.CreateServiceDefinitionEntity(oldEntity.NameWithinNamespace, oldEntity.Description);
          entity = sdEntity;
          break;
        default:
          throw new ArgumentException("Invalid ElementType: " + oldEntity.ElementType);
      }

      entity.Extension = oldEntity.Extension;

      CopyProperties(propertyBagTypeName, propertyCollection, entity.Properties);

      return entity;
    }

    #region Functions

    public static MetraTech.ExpressionEngine.MTProperties.Property GetPropertyFromArgument(Argument argument)
    {
      if (argument == null)
        return null;

        var type = GetMtType(argument.TypeInfo);
        var property = PropertyFactory.Create(null, argument.Name, type, !argument.IsOptional, argument.Description);
        return property;
    }


    //Export functions. This is useful to convert the functions that were prototyped for TreeFlow. It should not
    //be done on a per project basis
    public static void ExportFunctions(string dirPath)
    {
      var dirInfo = new DirectoryInfo(dirPath);
      if (!dirInfo.Exists)
        dirInfo.Create();

      //Copy the parameters
      foreach (var oldFunction in TreeFlows.Function.Functions.Values)
      {
        var newFunction = new MetraTech.ExpressionEngine.Components.Function(oldFunction.Name, oldFunction.Category.ToString(), oldFunction.Description);
        newFunction.DynamicParameterPrototype = GetPropertyFromArgument(oldFunction.VariableArgumentTemplate);
        newFunction.ReturnType = GetMtType(oldFunction.ReturnType);
        if (oldFunction.ArgumentType == Function.ArgumentListType.Fixed || oldFunction.ArgumentType == Function.ArgumentListType.FixedAndVariable)
        {
          foreach (var argument in oldFunction.FixedArguments)
          {
            var property = GetPropertyFromArgument(argument);
            newFunction.FixedParameters.Add(property);
          }
        }
        newFunction.Save(string.Format(CultureInfo.InvariantCulture, @"{0}\Functions", dirPath));
      }
    }
    #endregion

    public static void ExportExtensions(string extensionsDir)
    {
      //Enums
      foreach (var oldEnumNamespace in Config.Instance.EnumerationConfig.EnumNamespaces.Values)
      {
        var newEnumNamespace = new EnumNamespace(oldEnumNamespace.Name, oldEnumNamespace.Description);
        newEnumNamespace.Extension = oldEnumNamespace.Extension;

        foreach (var oldEnumType in oldEnumNamespace.EnumTypes.Values)
        {
          var newEnumType = newEnumNamespace.AddCategory(oldEnumType.Name, 0, oldEnumType.Description);
          foreach (var oldEnumValue in oldEnumType.EnumValues.Values)
          {
            var newEnumValue = newEnumType.AddValue(oldEnumValue.Name, 0);
            foreach (var alias in oldEnumValue._MeteringAliases)
            {
              newEnumValue.Aliases.Add(alias);
            }
          }
        }

        newEnumNamespace.SaveInExtension(extensionsDir);
      }

      //Export the MSIX definitions
      SaveInExtension(extensionsDir, ElementType.ServiceDefinition);
      SaveInExtension(extensionsDir, ElementType.ProductView);
      SaveInExtension(extensionsDir, ElementType.ServiceDefinition); 
      //TODO: eport parameter tables
    }

    public static void SaveInExtension(string extensionsDir, ElementType elementType)
    {
      var elements = Config.Instance.GetElementList(elementType);
      foreach (DictionaryEntry de in elements)
      {
        var element = (ElementBase) de.Value;
        var entity = (MetraNetEntityBase)GetEntity(element);
        entity.SaveInExtensionsDirectory(extensionsDir);
      }
    }

  }
}
