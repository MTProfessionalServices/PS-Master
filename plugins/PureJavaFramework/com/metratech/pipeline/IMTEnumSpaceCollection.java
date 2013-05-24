package com.metratech.pipeline;

/**
 * COM Interface 'IMTEnumSpaceCollection'. Generated 7/24/00 5:03:12 PM
 * from 'D:|Builds|debug|include|MTPipelineLib.tlb'<P>
 * Generated using version 1.3.4  SB002 of <B>J-Integra[tm]</B> -- pure Java/COM integration technology from Linar Ltd.
 * See  <A HREF="http://www.linar.com/">http://www.linar.com/</A><P>
 * Description: '<B>IMTEnumSpaceCollection Interface</B>'
 *
 * Generator Options:
 * PromptForTypeLibraries = True
 * AttemptNonDual = True
 * ClashPrefix = zz_
 * LowerCaseMemberNames = True
 * IDispatchOnly = False
 * RetryOnReject = True
 * GenerateDeprecatedConstructors = True
 * ArraysAsObjects = False
 * DontGenerateDisp = False
 * DontRenameSameMethods = False
 * IgnoreConflictingInterfaces = True
 */
public interface IMTEnumSpaceCollection {
  /**
   * get_NewEnum. property _NewEnum
   *
   * @return    return value.  An enumeration.
   * @exception java.io.IOException If there are communications problems.
   * @exception com.linar.jintegra.AutomationException If the remote server throws an exception.
   */
  public java.util.Enumeration get_NewEnum  () throws java.io.IOException, com.linar.jintegra.AutomationException;

  /**
   * add. method Add
   *
   * @param     enum_space An reference to a IMTEnumSpace (in)
   * @exception java.io.IOException If there are communications problems.
   * @exception com.linar.jintegra.AutomationException If the remote server throws an exception.
   */
  public void add  (
              IMTEnumSpace enum_space) throws java.io.IOException, com.linar.jintegra.AutomationException;

  /**
   * getSize. property Size
   *
   * @return    return value.  The pVal
   * @exception java.io.IOException If there are communications problems.
   * @exception com.linar.jintegra.AutomationException If the remote server throws an exception.
   */
  public int getSize  () throws java.io.IOException, com.linar.jintegra.AutomationException;

  /**
   * getCount. property Count
   *
   * @return    return value.  The pVal
   * @exception java.io.IOException If there are communications problems.
   * @exception com.linar.jintegra.AutomationException If the remote server throws an exception.
   */
  public int getCount  () throws java.io.IOException, com.linar.jintegra.AutomationException;

  /**
   * getItem. property Item
   *
   * @param     aIndex The aIndex (in)
   * @return    return value.  A Variant
   * @exception java.io.IOException If there are communications problems.
   * @exception com.linar.jintegra.AutomationException If the remote server throws an exception.
   */
  public Object getItem  (
              int aIndex) throws java.io.IOException, com.linar.jintegra.AutomationException;


  // Constants to help J-Integra dynamically map DCOM invocations to
  // interface members.  Don't worry, you will never need to explicitly use these constants.
  int IID7f834f73_067c_11d4_95a1_00b0d025b121 = 1;
  /** Dummy reference to interface proxy to make sure it gets compiled */
  int xxDummy = IMTEnumSpaceCollectionProxy.xxDummy;
  /** Used internally by J-Integra, please ignore */
  String IID = "7f834f73-067c-11d4-95a1-00b0d025b121";
  String DISPID__4_GET_NAME = "get_NewEnum";
  String DISPID_1_NAME = "add";
  String DISPID_2_GET_NAME = "getSize";
  String DISPID_3_GET_NAME = "getCount";
  String DISPID_0_GET_NAME = "getItem";
}
