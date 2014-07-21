import dendropy 
from dendropy import Tree, TaxonSet
from dendropy.utility.fileutils import find_files
import itertools
import operator
import sys
import pprint
import csv

from collections import defaultdict, OrderedDict
top_file = sys.argv[1]
def read_in(list_of_files):
	rf = defaultdict(int)
	l = defaultdict(int)
	pos_l = defaultdict(int)
	neg_l = defaultdict(int)
	rf_av = []
	tree1 = dendropy.Tree.get_from_path("amph_tree.tre", "newick")
	flist = find_files(top=o_file, filename_filter="*ftre")
	for file in flist:
		filename = file[28:-5]
		treelist = dendropy.TreeList.get_from_path(file, "nexus")
	return(treelist,tree1)

def rfs()
	files = read_in()
	treelist = files[1]
	tree  = files[2]
	for tree in treelist:
		l[filename] += 1
		rf[filename] += tree1.symmetric_difference(tree)
		p_n = tree1.false_positives_and_negatives(tree)
		pos, neg = zip(p_n)
		for x in pos:
			pos_l[filename] += int(x)
		for x in neg:
			neg_l[filename] += int(x)
	rf_av = [float(rf[k]) / l[k] for k in l]
	pos_f = [float(pos_l[k]) / l[k] for k in l]
	neg_f = [float(neg_l[k]) / l[k] for k in l]
	zipped = zip(flist,rf_av,pos_f,neg_f)
	return(zipped)

def write_out()
	output = rfs()
	fpwriter = csv.writer(open('fp.csv', 'wb'))
	row=0	
	for x in zipped:
		fpwriter.writerow([x])
		row += 1	
