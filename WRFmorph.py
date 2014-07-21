import dendropy 
from dendropy import Tree, TaxonSet
from dendropy.utility.fileutils import find_files
import csv
import sys
o_file = sys.argv[1]
tree1 = dendropy.Tree.get_from_path("amph_tree.tre", "newick")
flist = find_files(top=o_file, filename_filter='*.tre')
tree2 = [dendropy.Tree.get_from_path(filename, "nexus") for filename in flist]
RF = [tree1.symmetric_difference(tree) for tree in tree2]
p_n = [tree1.false_positives_and_negatives(tree) for tree in tree2]
chars = [filename[5:-5] for filename in flist]
name_split = [char.split("_") for char in chars]
junk = zip(name_split, RF, p_n)
cwriter = csv.writer(open('c.csv', 'wb'))
row=0	
for x in junk:
	cwriter.writerow([x])
	row += 1	


