# Class Schedule Generator
The Purpose of this project is to aid students with class selection at my university (University of Massachusetts Dartmouth).

Students will be able to select up to eight courses, and from that information the matlab script will search for those courses
from the course listing and create an array of possible schedules.

####So far I have been able to:
1 Read the course listing file and save it to a matlab .mat file.

2 Create a search routine that will return all the classes given its three letter subject code (e.g. BIO) and its three numbers
  level (e.g. 101).

3 Sort the classes found in a two dimensional array.

####Things that still need work:

• Create all the possible combinations matrix.

• Check for overlapping classes in each combination, if overlap occurs discard combination.

• Display possible combinations in a calendar style.
