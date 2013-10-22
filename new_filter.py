#!/usr/bin/env python

import glob
import os
import pandas as pd

def read_in_pd():
	f_list_csv = []
	for file in glob.glob("*.csv"):
         f_list_csv.append(file)
	f = [pd.read_csv(val, header=None) for val in f_list_csv]
	return(f)
	
def grab_filename():
	'''get the filenames associated with these files, minus extensions'''
	f_name = []
	for file in glob.glob("*.csv"):
		f_name.append(file[:-5])
	return(f_name)

def read_in_txt():
	'''take list of characters obtained from paup. these characters are not parsimony informative'''
	f_list_txt = []
	char_vecs = []
	for file in glob.glob("*txt"):
         f_list_txt.append(file)	
	p = [pd.read_csv(fi, header=None) for fi in f_list_txt]
	for obj in p:
		char_vecs.append(obj[0])
	return(char_vecs)		

def strip_invar():
	'''remove columns with no variation'''
	obj_list = []
	pandas_obj = read_in_pd()
	for obj in pandas_obj:
		df = obj
		mena = df.mean(1)
		for value in mena:
			if value == 1:
				del df[value]
			elif value == 2:
				del df[value]
		obj_list.append(df)
	return(obj_list)

def strip_paup():
        mat_list = []
        paired_list = []
        drop_cols = []
        new_mat = []
        drop_cols = read_in_txt()
        mat_list = strip_invar()
        for mat,cols in zip(mat_list, drop_cols):
                cols = cols.tolist()
                new_mat.append(mat.drop(cols, axis=1))
        return(new_mat)  	

def io_time():
	'''print stripped data frame to csv'''
	mat_list = []
	name_list = []
	mat_list = strip_paup()
	name_list = grab_filename()
	for mat, name in zip(mat_list, name_list):
		mat.to_csv('pi/%s.csv' %name, header=None, index=None)

io_time()
