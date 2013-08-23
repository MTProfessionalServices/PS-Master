@echo off

set buildTarget=All

if not '%1' == '' (set buildTarget=%1)

Echo Building %buildTarget%
Echo.
 

 
msbuild %ROOTDIR%\Build\MSBuild\MetraNetBuild.proj /m /ds /t:%buildTarget% /p:config=%VERSION%;MyTargets=Build /fl /flp:ShowTimestamp;Verbosity=DIAG;Summary;LogFile=%temp%\msbuild.log /clp:Verbosity=M;Summary
msbuild %RMPDIR%\Extensions\MVMCore_Internal\SourceCode\Mvm\MVM.sln /m /ds /p:config=%VERSION%;MyTargets=Build /fl /flp:ShowTimestamp;Verbosity=DIAG;Summary;LogFile=%temp%\MetraNetMVMBuild.log /clp:Verbosity=M;Summary