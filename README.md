# Hamiltonian cycle
#### Prolog programming language - FLP course 2020/2021
 author: Adam Lanicek
 
 login: xlanic04

#### Program Launch
Launching the program using the Make utility:
	
- **make** - program build & launch with the assignment reference test input (testIn/0.in)

- **make test** (2 sec)
    - program build with _test_ goal & unit tests of hamCycle/5 and getAllHamCycles/5 predicates (as defined in _testModule.pl_)
    - program build with _start_ goal & 4 different program launches using the following inputs compared to the reference output using the _diff_ utility:

    -- _testIn/0.in_: reference input (provided in the assignment)
    
    -- _testIn/1.in_: a circle graph (nodes connected in a circular manner - 1 Hamiltonian cycle present)
       
    -- _testIn/2.in_: graph with nodes connected in a line (no Hamiltonian cycle present)
    
    -- _testIn/3.in_: Peterson graph (15 edges, 10 vertices, no Hamiltonian cycle present)
    
    -- _testIn/4.in_: Unit planar graph (a circle where all the nodes are connected plus one node in the
    middle connected to all the edges on a circle)

- **make test_long** (12 sec)- program build & test run on a complex input:

    -- _testIn/5.in_: complex graph input

Standard program launch (make sure the program is built):

- **./flp20-log < input**

#### Program module structure
- **main.pl**: provides the basic program structure, defines **start** (standard program run)
    and **test** (unit tests run) goals 
- **inputParser.pl**: contains the input parsing module (authored by Martin Hyrs)
- **hamCycle.pl**: contains predicates implementing the actual Hamiltonian cycle Algorithm
- **testModule.pl**: contains predicates implementing the unit tests for the two crucial predicates

#### Basic description of the proceedings
The program starts the processing with parsing the input file using the predicates provided in the assignment. 

Then the starting point for the Hamiltonian cycle(s) is set and fixed. 

After that, the **getAllHamCycles/5** is called
recursively in order to retrieve all Hamiltonian cycles using the **hamCycle/5** predicate.
