README
======

This is the validator verifіying if a LOM is compliant with Normetic profile v1.2.


Dependencies
------------

- Jing (20030619) * Not really used at the moment *
- Saxon9 (1-0-5j)
- JRE (1.6.0_03-b05)


How to use
----------

To build the project, you will need Ant 1.6 or more.

Copy sample-build.properties to build.properties and adjust it in function
of your environment if necessary.

In a command interpreter, type :

To clean all old files :

$ ant clean


To build the project :

$ ant build


To generate the javadoc :

$ ant javadoc


To test the validator :

$ ant run


To launch the unit test tool :

$ ant test
