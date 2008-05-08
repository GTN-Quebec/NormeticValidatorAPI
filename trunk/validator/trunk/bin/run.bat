::
:: Before using this script file, make sure that the environment variable VALIDATOR_HOME is properly initialized.
::
:: Here is a sample call : 
::
:: cd %VALIDATOR_HOME%
:: bin\run.bat ..\..\LOM\specimens\4.xml fr
::
java -cp %VALIDATOR_HOME%\build\NormeticValidator.jar;%VALIDATOR_HOME%\lib\jing.jar;%VALIDATOR_HOME%\lib\saxon8.jar ca.licef.validator.NormeticValidator -lom %1 -lang %2
