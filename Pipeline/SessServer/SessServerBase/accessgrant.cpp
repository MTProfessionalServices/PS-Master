/**************************************************************************
 * @doc ACCESSGRANT
 *
 * Copyright 1999 by MetraTech Corporation
 * All rights reserved.
 *
 * THIS SOFTWARE IS PROVIDED "AS IS", AND MetraTech Corporation MAKES
 * NO REPRESENTATIONS OR WARRANTIES, EXPRESS OR IMPLIED. By way of
 * example, but not limitation, MetraTech Corporation MAKES NO
 * REPRESENTATIONS OR WARRANTIES OF MERCHANTABILITY OR FITNESS FOR ANY
 * PARTICULAR PURPOSE OR THAT THE USE OF THE LICENSED SOFTWARE OR
 * DOCUMENTATION WILL NOT INFRINGE ANY THIRD PARTY PATENTS,
 * COPYRIGHTS, TRADEMARKS OR OTHER RIGHTS.
 *
 * Title to copyright in this software and any associated
 * documentation shall at all times remain with MetraTech Corporation,
 * and USER agrees to preserve the same.
 *
 * Created by: Derek Young
 *
 * $Date$
 * $Author$
 * $Revision$
 ***************************************************************************/

#include "StdAfx.h"

#include <accessgrant.h>

#include <mtglobal_msg.h>

BOOL SharedAccess::GainAccess()
{
	const char * functionName = "SharedAccess::GainAccess";
	DWORD result;
	// 25 second timeout
	if (mpHandle->WaitForAccess(25000, &result) != NULL)
		return TRUE;
	if (result == WAIT_FAILED)
		SetError(::GetLastError(), ERROR_MODULE, ERROR_LINE, functionName);
	else
		SetError(PIPE_ERR_MUTEX_TIMEOUT, ERROR_MODULE, ERROR_LINE, functionName);

	return FALSE;
}
