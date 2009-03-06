::
:: Before using this script file, make sure that the environment variable VALIDATOR_HOME is properly initialized.
::
:: Here is a sample call : 
::
:: cd %VALIDATOR_HOME%
:: bin\launchValidator.bat
::
java -cp %VALIDATOR_HOME%\build\NormeticValidator.jar;%VALIDATOR_HOME%\lib\jing.jar;%VALIDATOR_HOME%\lib\saxon9.jar ca.licef.validator.GraphicalNormeticValidator -lang fr
