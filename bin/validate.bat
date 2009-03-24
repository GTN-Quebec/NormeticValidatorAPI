::
:: Before using this script file, make sure that the environment variable VALIDATOR_HOME is properly initialized.
::
:: Here is a sample call : 
::
:: cd %VALIDATOR_HOME%
:: bin\validate.bat ..\..\LOM\specimens fr
::
:: The first parameter may be either a xml file or a directory containing a control file (e.g.: control.txt).
::
java -Dfile.encoding=UTF-8 -cp %VALIDATOR_HOME%\build\NormeticValidator.jar;%VALIDATOR_HOME%\lib\jing.jar;%VALIDATOR_HOME%\lib\saxon9.jar ca.licef.validator.NormeticValidator -location %1 -lang %2
