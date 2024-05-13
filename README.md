First we generate a C program on which we want to do Cross compilation.

Then We generate Assembly Code of this C program using below Command in terminal:-
        
        gcc -S -o assembly.s input.c -o1
"-o1 will vary in -o1, -o2 and -o3 according to optimization we want to apply"

Then We convert Assembly.s to Assemb.txt by using ass_to_text.py file

Now we will read the Assemb.txt and generate parse tree using parse_tree_gen.py

Now we recongnize the Branch Condition and It's target instruction by branch_pred.py in text file

Now we will make batch of 4-4 instruction by running batch.py file where in every batch first instruction will target instruction and last instruction will be Branch instruction
