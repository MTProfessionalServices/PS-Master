﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.1008
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace VertexServerTest.Properties {
    using System;
    
    
    /// <summary>
    ///   A strongly-typed resource class, for looking up localized strings, etc.
    /// </summary>
    // This class was auto-generated by the StronglyTypedResourceBuilder
    // class via a tool like ResGen or Visual Studio.
    // To add or remove a member, edit your .ResX file then rerun ResGen
    // with the /str option, or rebuild your VS project.
    [global::System.CodeDom.Compiler.GeneratedCodeAttribute("System.Resources.Tools.StronglyTypedResourceBuilder", "4.0.0.0")]
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
    [global::System.Runtime.CompilerServices.CompilerGeneratedAttribute()]
    internal class Resources {
        
        private static global::System.Resources.ResourceManager resourceMan;
        
        private static global::System.Globalization.CultureInfo resourceCulture;
        
        [global::System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")]
        internal Resources() {
        }
        
        /// <summary>
        ///   Returns the cached ResourceManager instance used by this class.
        /// </summary>
        [global::System.ComponentModel.EditorBrowsableAttribute(global::System.ComponentModel.EditorBrowsableState.Advanced)]
        internal static global::System.Resources.ResourceManager ResourceManager {
            get {
                if (object.ReferenceEquals(resourceMan, null)) {
                    global::System.Resources.ResourceManager temp = new global::System.Resources.ResourceManager("VertexServerTest.Properties.Resources", typeof(Resources).Assembly);
                    resourceMan = temp;
                }
                return resourceMan;
            }
        }
        
        /// <summary>
        ///   Overrides the current thread's CurrentUICulture property for all
        ///   resource lookups using this strongly typed resource class.
        /// </summary>
        [global::System.ComponentModel.EditorBrowsableAttribute(global::System.ComponentModel.EditorBrowsableState.Advanced)]
        internal static global::System.Globalization.CultureInfo Culture {
            get {
                return resourceCulture;
            }
            set {
                resourceCulture = value;
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to &lt;VertexTaxParams&gt;&lt;OriginLocationMode&gt;G&lt;/OriginLocationMode&gt;&lt;OriginGeoCode&gt;220171040&lt;/OriginGeoCode&gt;&lt;TerminationLocationMode&gt;G&lt;/TerminationLocationMode&gt;&lt;TerminationGeoCode&gt;090010010&lt;/TerminationGeoCode&gt;&lt;OriginIncorporatedCode&gt;I&lt;/OriginIncorporatedCode&gt;&lt;TerminationIncorporatedCode&gt;I&lt;/TerminationIncorporatedCode&gt;&lt;InvoiceDate&gt;20130501&lt;/InvoiceDate&gt;&lt;InvoiceNumber&gt;1001&lt;/InvoiceNumber&gt;&lt;TaxableAmount&gt;100&lt;/TaxableAmount&gt;&lt;BilledLines&gt;0&lt;/BilledLines&gt;&lt;ServiceCode&gt;04&lt;/ServiceCode&gt;&lt;CategoryCode&gt;05&lt;/CategoryCode&gt;&lt;FederalE [rest of string was truncated]&quot;;.
        /// </summary>
        internal static string TestRequest {
            get {
                return ResourceManager.GetString("TestRequest", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to &lt;Success&gt;&lt;TaxResults&gt;&lt;InvoiceNumber&gt;1001&lt;/InvoiceNumber&gt;&lt;InvoiceDate&gt;20130501&lt;/InvoiceDate&gt;&lt;TaxedGeoCode&gt;220171040&lt;/TaxedGeoCode&gt;&lt;TaxedCityName&gt;WALTHAM&lt;/TaxedCityName&gt;&lt;TaxedCountyName&gt;MIDDLESEX&lt;/TaxedCountyName&gt;&lt;TaxedGeoCodeIncorporatedCode&gt;I&lt;/TaxedGeoCodeIncorporatedCode&gt;&lt;TaxedStateCode&gt;MA&lt;/TaxedStateCode&gt;&lt;BundleCategoryCode&gt;&lt;/BundleCategoryCode&gt;&lt;BundleFlag&gt;&lt;/BundleFlag&gt;&lt;BundleServiceCode&gt;&lt;/BundleServiceCode&gt;&lt;TaxRecords&gt;&lt;TaxRecord&gt;&lt;TaxAuthority&gt;1&lt;/TaxAuthority&gt;&lt;TaxType&gt;95&lt;/TaxType&gt;&lt;TaxCode&gt;R&lt;/TaxCode&gt;&lt;TaxR [rest of string was truncated]&quot;;.
        /// </summary>
        internal static string TestResponse {
            get {
                return ResourceManager.GetString("TestResponse", resourceCulture);
            }
        }
    }
}
