::
:: Before using this script file, make sure that the environment variable VALIDATOR_HOME is properly initialized.
::
:: Here is a sample call : 
::
:: cd %VALIDATOR_HOME%
:: bin\launchValidator.bat
::
java -Dfile.encoding=UTF-8 -cp %VALIDATOR_HOME%\build\NormeticValidator.jar;%VALIDATOR_HOME%\lib\jing.jar;%VALIDATOR_HOME%\lib\saxon9.jar;%VALIDATOR_HOME%\lib\licef-utils-0.1.0.jar ca.licef.validator.GraphicalNormeticValidator -lang fr
