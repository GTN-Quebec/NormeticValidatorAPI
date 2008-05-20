README
======

This is the validator verifіying if a LOM is compliant with Normetic profile v1.2.

Dependencies
------------

- Jing (20030619)
- Saxon8 (8-9-0-4j)
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

To test the validator :

$ ant run
