﻿using System;
using System.Runtime.Serialization;
using MetraTech.ExpressionEngine.Flows.Enumerations;
using MetraTech.ExpressionEngine.MTProperties;
using MetraTech.ExpressionEngine.Validations;

namespace MetraTech.ExpressionEngine.Flows
{
    /// <summary>
    /// Simple prototype for transaction flows to replace pipelines
    /// </summary>
    [DataContract(Namespace = "MetraTech")]
    public class FlowStepBase
    {
        #region properties

        /// <summary>
        /// The parent collection to which the flow belongs
        /// </summary>
        public FlowCollection FlowCollection { get; private set; }

        [DataMember]
        public FlowStepType FlowItemType { get; private set; }

        [DataMember]
        public string Name { get; set; }

        [DataMember]
        public string Description { get; set; }

        public PropertyCollection InputsAndOutputs { get; private set; }

        public PropertyCollection AvailableProperties { get; private set; }
        #endregion

        #region Constructor
        public FlowStepBase(FlowCollection flowCollection, FlowStepType flowItemType)
        {
            if (flowCollection == null)
                throw new ArgumentException("flowCollection is null");
            FlowCollection = flowCollection;
            FlowItemType = flowItemType;

            InputsAndOutputs = new PropertyCollection(this);
            AvailableProperties = new PropertyCollection(this);
        }
        #endregion

        #region Methods

        /// <summary>
        /// Updates the InputsAndOutputs property. This must be overridden in every FlowItem
        /// </summary>
        public virtual void UpdateInputsAndOutputs(Context context)
        {
            
        }

        public void Validate(ValidationMessageCollection messages, Context context)
        {
            //TODO: add validation
        }
        #endregion
    }
}
