/*
 * @(#)DomEcho01.java	1.9 98/11/10
 *
 * Copyright (c) 1998 Sun Microsystems, Inc. All Rights Reserved.
 *
 * Sun grants you ("Licensee") a non-exclusive, royalty free, license to use,
 * modify and redistribute this software in source and binary code form,
 * provided that i) this copyright notice and license appear on all copies of
 * the software; and ii) Licensee does not utilize the software in a manner
 * which is disparaging to Sun.
 *
 * This software is provided "AS IS," without a warranty of any kind. ALL
 * EXPRESS OR IMPLIED CONDITIONS, REPRESENTATIONS AND WARRANTIES, INCLUDING ANY
 * IMPLIED WARRANTY OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE OR
 * NON-INFRINGEMENT, ARE HEREBY EXCLUDED. SUN AND ITS LICENSORS SHALL NOT BE
 * LIABLE FOR ANY DAMAGES SUFFERED BY LICENSEE AS A RESULT OF USING, MODIFYING
 * OR DISTRIBUTING THE SOFTWARE OR ITS DERIVATIVES. IN NO EVENT WILL SUN OR ITS
 * LICENSORS BE LIABLE FOR ANY LOST REVENUE, PROFIT OR DATA, OR FOR DIRECT,
 * INDIRECT, SPECIAL, CONSEQUENTIAL, INCIDENTAL OR PUNITIVE DAMAGES, HOWEVER
 * CAUSED AND REGARDLESS OF THE THEORY OF LIABILITY, ARISING OUT OF THE USE OF
 * OR INABILITY TO USE SOFTWARE, EVEN IF SUN HAS BEEN ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGES.
 *
 * This software is not designed or intended for use in on-line control of
 * aircraft, air traffic, aircraft navigation or aircraft communications; or in
 * the design, construction, operation or maintenance of any nuclear
 * facility. Licensee represents and warrants that it will not use or
 * redistribute the Software for such purposes.
 */
package com.metratech.sdk.samples;

import javax.xml.parsers.DocumentBuilder; 
import javax.xml.parsers.DocumentBuilderFactory;  
import javax.xml.parsers.FactoryConfigurationError;  
import javax.xml.parsers.ParserConfigurationException;
 
import org.xml.sax.SAXException;  
import org.xml.sax.SAXParseException;  

import java.io.File;
import java.io.IOException;

import org.w3c.dom.*;
//import org.w3c.dom.Document;
//import org.w3c.dom.Element;
//import org.w3c.dom.DOMException;

public class LoadBatchXMLTest
{
  // Global value so it can be ref'd by the tree-adapter
  static Document document; 
  public static void main(String argv[])
  {
		if (argv.length != 1) 
		{
			System.err.println("Usage: java DomEcho filename");
      System.exit(1);
    }

    DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
    //factory.setValidating(true);   
    //factory.setNamespaceAware(true);
    try 
		{
			DocumentBuilder builder = factory.newDocumentBuilder();
      document = builder.parse(new File(argv[0]) );

      Node nID = findNode(document, "ID");
      Node nName = findNode(document, "Name");
      Node nNamespace = findNode(document, "Namespace");
      Node nStatus = findNode(document, "Status");
      Node nCreationDate = findNode(document, "CreationDate");
      Node nSource = findNode(document, "Source");
      Node nCompletedCount = findNode(document, "CompletedCount");
      Node nExpectedCount = findNode(document, "ExpectedCount");
      Node nFailureCount = findNode(document, "FailureCount");
      Node nSequenceNumber = findNode(document, "SequenceNumber");
      Node nSourceCreationDate = findNode(document, "SourceCreationDate");
      Node nUID = findNode(document, "UID");
      Node nMeteredCount = findNode(document, "MeteredCount");

      //initial all variable
      String ID  = nID.getFirstChild().getNodeValue();
      String Name = nName.getFirstChild().getNodeValue();
      String Namespace = nNamespace.getFirstChild().getNodeValue();
      String Status = nStatus.getFirstChild().getNodeValue();
      String CreationDate = nCreationDate.getFirstChild().getNodeValue();
      String Source = nSource.getFirstChild().getNodeValue();
      String CompletedCount = nCompletedCount.getFirstChild().getNodeValue();
      String ExpectedCount = nExpectedCount.getFirstChild().getNodeValue();
      String FailureCount = nFailureCount.getFirstChild().getNodeValue();
      String SequenceNumber = nSequenceNumber.getFirstChild().getNodeValue();
      String SourceCreationDate = nSourceCreationDate.getFirstChild().getNodeValue();
      String UID = nUID.getFirstChild().getNodeValue();
      String MeteredCount = nMeteredCount.getFirstChild().getNodeValue();

			System.out.println("---- ID = " + ID + "----");
			System.out.println("---- Name = " + Name + "----");
			System.out.println("---- Namespace = " + Namespace + "----");
			System.out.println("---- Status = " + Status + "----");
			System.out.println("---- CreationDate = " + CreationDate + "----");
			System.out.println("---- Source = " + Source + "----");
			System.out.println("---- CompletedCount = " + CompletedCount + "----");
			System.out.println("---- ExpectedCount = " + ExpectedCount + "----");
			System.out.println("---- FailureCount = " + FailureCount + "----");
			System.out.println("---- SequenceNumber = " + SequenceNumber + "----");
			System.out.println("---- SourceCreationDate = " + SourceCreationDate + "----");
			System.out.println("---- UID = " + UID + "----");
			System.out.println("---- MeteredCount = " + MeteredCount + "----");
		} 
		catch (SAXException sxe) 
		{
			// Error generated during parsing)
      Exception  x = sxe;
      if (sxe.getException() != null)
				x = sxe.getException();
			x.printStackTrace();

    } 
		catch (ParserConfigurationException pce) 
		{
			// Parser with specified options can't be built
      pce.printStackTrace();
    } 
		catch (IOException ioe) 
		{
			// I/O error
      ioe.printStackTrace();
    }
	} // main

	public static Node findNode(Node node, String name) 
	{
		if (node.getNodeName().equals(name))
     	return node;
    if (node.hasChildNodes()) 
    {
      NodeList list = node.getChildNodes();
      int size = list.getLength();
      for (int i = 0; i<size ; i++) 
     	{
       	Node found = findNode(list.item(i), name);
        if (found != null) return found;
      }
    }
    return null;
  }
}
