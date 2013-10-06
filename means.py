#!/usr/bin/env python

import glob
import os
import pandas as pd
import numpy as np

def read_in_pd():
	f_list_csv = []
	df_list =[]
	for file in glob.glob("*.csv"):
         f_list_csv.append(file)
	f = [pd.read_csv(val, index_col=0) for val in f_list_csv]
	for val in f:
		val.sort(axis=1,inplace=True)
		df_list.append(val)
	return(df_list)
	
def grab_filename():
	'''get the filenames associated with these files, minus extensions'''
	f_name = []
	for file in glob.glob("*.csv"):
		f_name.append(file[:-5])
	return(f_name)

def create_missing():
	mat_list = []
	subbed_list = []
	mat_list = read_in_pd()
  	f_tax_vec = ["Osteolepiformes","Panderichthyidae","Acanthostega","Tulerpeton","Crassigyrinus","Baphetidae","Colosteidae","Dendrerpeton","Eryops","Ecolsonia","Tersomius","Apateon","Amphibamus","Doleserpeton","Gephyrostegidae","Solenodonsaurus","Limnoscelis","Diadectes","Captorhinidae","Procolophonidae","Westlothiana","Aistopoda","Triadobatrachus","Discoglossidae","Karaurus","Eocaecilia","Adelogyrinidae","Microbrachis","Pantylus","Rhynchonkos","Ichthyostega","Brachystelechidae","Cardiocephalus","Lysorophia","Asaphestera","Utaherpeton","Nectridea","Kotlassia","Seymouria","Ariekanerpeton","Proterogyrinus","Archeria"]
 	for mat in mat_list:
		for value in f_tax_vec:	
			for i in range(1,120):
				mat.ix[value,i] = 5				
	subbed_list.append(mat)
	return(subbed_list)
	
def io_time():
	'''print stripped data frame to csv'''
	mat_list = []
	name_list = []
	mat_list = create_missing()
	name_list = grab_filename()
	for mat, name in zip(mat_list, name_list):
		mat.to_csv('10md/%s.csv' %name)

io_time()