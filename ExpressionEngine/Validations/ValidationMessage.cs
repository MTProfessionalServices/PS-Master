﻿using System;
using System.Runtime.Serialization;
using MetraTech.ExpressionEngine.Components.Enumerations;
using MetraTech.ExpressionEngine.Validations.Enumerations;
using System.Globalization;

namespace MetraTech.ExpressionEngine.Validations
{
    [DataContract(Namespace = "MetraTech")]
    public class ValidationMessage
    {
        #region Properties

        [DataMember]
        public string ComponentName { get; set; }

        /// <summary>
        /// An ID that in unique to the type of message. This is presented to the user so that they can get help, etc.
        /// </summary>
        [DataMember]
        public int CategoryId { get; set; }

        /// <summary>
        /// The severity of the message
        /// </summary>
        [DataMember]
        public SeverityType Severity { get; set; }

        /// <summary>
        /// The message to be presented to the user. It is assumed that it is already localized by the time that it reaches this point
        /// TODO this should be replaced with an ID
        /// </summary>
        [DataMember]
        public string Message { get; set; }

        [DataMember]
        public int LineNumber { get; set; }

        [DataMember]
        public int ColumnNumber { get; set; }

        [DataMember]
        public Exception Exception { get; set; }

        #endregion

        #region Constructors
        public ValidationMessage(SeverityType severity, string message)
        {
            Severity = severity;
            Message = message;
        }
        public ValidationMessage(SeverityType severity, string message, int lineNumber, int columnNumber):this(severity, message)
        {
            LineNumber = lineNumber;
            ColumnNumber = columnNumber;
        }
        #endregion

        #region Methods

        public override string ToString()
        {
            var str = string.Format(CultureInfo.CurrentUICulture, "[{0}] {1}", Severity, Message);
            if (LineNumber != ValidationMessageCollection.NoPosition)
                str += (string.Format(CultureInfo.CurrentUICulture, "Line {0} Column {1}", LineNumber, ColumnNumber));
            return str;
        }

        #endregion
    }
}
