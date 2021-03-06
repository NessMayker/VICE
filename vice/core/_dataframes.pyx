# cython: language_level=3, boundscheck=False
"""
This file, included with the VICE package, is protected under the terms of the 
associated MIT License, and any use or redistribution of this file in original 
or altered form is subject to the copyright terms therein. 

This file handles yield settings as well as lookup features related to that. 
This includes the global dataframes like sources and solar_z. 
"""

from . import _data_utils as _du

__all__ = ["atomic_number", "solar_z", "sources"]
__all__ = [str(i) for i in __all__]

"""
The following are instances of VICE's dataframe intended for both user 
lookup as well as customization, depending on the instance. 

atomic_number: 
==============
Atomic numbers of various elements included as a lookup function for the user's 
convenience. By default this does not allow user customization. We strongly 
discourage the user from modifying this struct, because elements are defined 
by their atomic number. 

ccsne_yields:
=============
Yields from core-collapse supernovae. By default, this instance does allow the 
user to set custom parameters, including functions of metallicity Z. 

sneia_yields:
=============
Yields from type Ia supernovae. By default, this instance does allow the user to 
set custom parameters, but does not allow functions of metallicity Z. 

solar_z:
========
Solar abundances by mass for given elements. By default, this dataframe 
does not support user specifications or functions of metallicity 

sources:
========
The sources of enrichment that VICE adopts for various elements. These are 
purely intended as lookup functions for the user's convenience ---> the true 
enrichment modeled in the singlezone and single_stellar_population subroutines 
involves yields for all channels. If an element is not modelled as coming from 
a particular source, it is simply set to have a zero net yield for that 
channel. The enrichment channels: 
	CCSNE:		core collapse supernovae
	SNEIA:		type Ia supernovae
	AGB: 		asymptotic giant branch stars 
	NSNS:		neutron star - neutron star mergers 
While some elements recognized here are believed to be enriched by mergers of 
binary neutron stars, this is not modeled in the current version of VICE. 
"""

#------------------------- ATOMIC NUMBER DATAFRAME -------------------------# 
atomic_number = _du._noncustomizable_dataframe({
	"c":		6, 
	"n":		7, 
	"o":		8, 
	"f":		9, 
	"ne":		10, 
	"na": 		11,  
	"mg":		12, 
	"al": 		13, 
	"si":		14, 
	"p": 		15, 
	"s":		16, 
	"cl": 		17, 
	"ar":		18, 
	"k": 		19, 
	"ca": 		20, 
	"sc":		21, 
	"ti": 		22, 
	"v": 		23, 
	"cr": 		24, 
	"mn": 		25, 
	"fe":		26, 
	"co": 		27, 
	"ni": 		28, 
	"cu": 		29, 
	"zn": 		30, 
	"ga": 		31, 
	"ge": 		32, 
	"as": 		33, 
	"se": 		34, 
	"br": 		35, 
	"kr": 		36, 
	"rb": 		37, 
	"sr":		38, 
	"y":		39, 
	"zr": 		40, 
	"nb": 		41, 
	"mo": 		42, 
	"ru": 		44, 
	"rh": 		45, 
	"pd": 		46, 
	"ag": 		47, 
	"cd": 		48, 
	"in": 		49, 
	"sn": 		50, 
	"sb": 		51, 
	"te": 		52, 
	"i": 		53, 
	"xe": 		54, 
	"cs": 		55, 
	"ba":		56, 
	"la":		57, 
	"ce": 		58, 
	"pr": 		59, 
	"nd": 		60, 
	"sm": 		62, 
	"eu":		63, 
	"gd": 		64, 
	"tb": 		65, 
	"dy": 		66, 
	"ho": 		67, 
	"er": 		68, 
	"tm": 		69, 
	"yb": 		70, 
	"lu": 		71, 
	"hf": 		72, 
	"ta": 		73, 
	"w": 		74, 
	"re": 		75, 
	"os": 		76, 
	"ir": 		77, 
	"pt": 		78, 
	"au": 		79, 
	"hg": 		80, 
	"tl":  		81, 
	"pb": 		82, 
	"bi": 		83 
})

#------------------------- SOLAR ABUNDANCE DATAFRAME -------------------------# 
solar_z = _du._noncustomizable_dataframe({
	"c":		2.36e-3,  
	"n":		6.91e-4,  
	"o":		5.72e-3,  
	"f":		5.04e-7, 
	"ne":		1.25e-3, 
	"na": 		2.92e-5, 
	"mg":		7.06e-4, 
	"al": 		5.55e-5, 
	"si":		6.63e-4, 
	"p": 		5.81e-6, 
	"s":		3.09e-4, 
	"cl": 		8.18e-6, 
	"ar":		7.33e-5, 
	"k": 		3.06e-6, 
	"ca": 		6.40e-5, 
	"sc":		4.64e-8, 
	"ti": 		3.11e-6, 
	"v": 		3.17e-7, 
	"cr": 		1.66e-5, 
	"mn": 		1.08e-5, 
	"fe":		1.29e-3, 
	"co": 		4.20e-6, 
	"ni": 		7.11e-5, 
	"cu": 		7.18e-7, 
	"zn": 		1.73e-6, 
	"ga": 		5.58e-8, 
	"ge": 		2.37e-7, 
	"as": 		5.47e-11, 
	"se": 		5.76e-11, 
	"br": 		5.83e-11, 
	"kr": 		1.09e-7, 
	"rb": 		2.07e-8, 
	"sr":		4.74e-8, 
	"y":		1.05e-8, 
	"zr": 		2.53e-8, 
	"nb": 		1.96e-9, 
	"mo": 		5.31e-9, 
	"ru": 		4.15e-9, 
	"rh": 		6.11e-10, 
	"pd": 		2.89e-9, 
	"ag": 		6.86e-10, 
	"cd": 		8.21e-11, 
	"in": 		5.29e-10, 
	"sn": 		9.50e-9, 
	"sb": 		8.89e-11, 
	"te": 		9.31e-11, 
	"i": 		9.26e-11,  
	"xe": 		1.67e-8, 
	"cs": 		9.70e-11, 
	"ba":		1.52e-8, 
	"la":		1.28e-9, 
	"ce": 		3.89e-9, 
	"pr": 		5.40e-10, 
	"nd": 		2.77e-9, 
	"sm": 		1.00e-9, 
	"eu":		3.67e-10, 
	"gd": 		1.35e-9, 
	"tb": 		2.31e-10, 
	"dy": 		1.49e-9, 
	"ho": 		3.64e-10, 
	"er": 		1.02e-9, 
	"tm": 		1.55e-10, 
	"yb": 		8.74e-10, 
	"lu": 		1.61e-10, 
	"hf": 		9.22e-10, 
	"ta": 		1.32e-10, 
	"w": 		9.50e-10, 
	"re": 		1.36e-10, 
	"os": 		3.49e-9, 
	"ir": 		3.37e-9, 
	"pt": 		1.42e-10, 
	"au": 		1.20e-9, 
	"hg": 		1.46e-10, 
	"tl":  		1.19e-9, 
	"pb": 		8.51e-9, 
	"bi": 		1.53e-10
}) 


#----------------------------- SOURCES DATAFRAME -----------------------------# 
sources = _du._noncustomizable_dataframe({
	"c":		["CCSNE", "AGB"], 
	"n":		["CCSNE", "AGB"], 
	"o":		["CCSNE"], 
	"f": 		["CCSNE"], 
	"ne":		["CCSNE"], 
	"na":		["CCSNE"], 
	"mg":		["CCSNE"], 
	"al":		["CCSNE"], 
	"si":		["CCSNE", "SNEIA"], 
	"p":		["CCSNE", "SNEIA"], 
	"s":		["CCSNE", "SNEIA"], 
	"cl":		["CCSNE", "SNEIA"], 
	"ar":		["CCSNE", "SNEIA"], 
	"k": 		["CCSNE", "SNEIA"], 
	"ca": 		["CCSNE", "SNEIA"], 
	"sc": 		["CCSNE", "SNEIA"], 
	"ti": 		["CCSNE", "SNEIA"], 
	"v": 		["CCSNE", "SNEIA"], 
	"cr": 		["CCSNE", "SNEIA"], 
	"mn": 		["CCSNE", "SNEIA"], 
	"fe":		["CCSNE", "SNEIA"], 
	"co": 		["CCSNE", "SNEIA"], 
	"ni": 		["CCSNE", "SNEIA"], 
	"cu": 		["CCSNE", "SNEIA"], 
	"zn": 		["CCSNE", "SNEIA"], 
	"ga": 		["CCSNE"], 
	"ge": 		["CCSNE"], 
	"as": 		["CCSNE"], 
	"se": 		["CCSNE"], 
	"br":		["CCSNE"], 
	"kr": 		["CCSNE"], 
	"rb": 		["CCSNE"], 
	"sr":		["CCSNE", "AGB"], 
	"y":		["CCSNE", "AGB"], 
	"zr": 		["CCSNE", "AGB"], 
	"nb": 		["AGB", "NSNS"], 
	"mo": 		["AGB", "NSNS"], 
	"ru": 		["AGB", "NSNS"], 
	"rh":		["AGB", "NSNS"], 
	"pd": 		["AGB", "NSNS"], 
	"ag": 		["AGB", "NSNS"], 
	"cd": 		["AGB", "NSNS"], 
	"in": 		["AGB", "NSNS"], 
	"sn": 		["AGB", "NSNS"], 
	"sb":		["AGB", "NSNS"], 
	"te": 		["AGB", "NSNS"], 
	"i": 		["AGB", "NSNS"], 
	"xe": 		["AGB", "NSNS"], 
	"cs": 		["AGB", "NSNS"], 
	"ba":		["AGB", "NSNS"],
	"la":		["AGB", "NSNS"], 
	"ce": 		["AGB", "NSNS"], 
	"pr": 		["AGB", "NSNS"], 
	"nd": 		["AGB", "NSNS"], 
	"sm": 		["AGB", "NSNS"], 
	"eu":		["AGB", "NSNS"], 
	"gd": 		["AGB", "NSNS"], 
	"tb": 		["AGB", "NSNS"], 
	"dy": 		["AGB", "NSNS"], 
	"ho": 		["AGB", "NSNS"], 
	"er": 		["AGB", "NSNS"], 
	"tm": 		["AGB", "NSNS"], 
	"yb": 		["AGB", "NSNS"], 
	"lu": 		["AGB", "NSNS"], 
	"hf": 		["AGB", "NSNS"], 
	"ta": 		["AGB", "NSNS"], 
	"w": 		["AGB", "NSNS"], 
	"re": 		["AGB", "NSNS"], 
	"os": 		["AGB", "NSNS"], 
	"ir": 		["AGB", "NSNS"], 
	"pt": 		["AGB", "NSNS"], 
	"au": 		["AGB", "NSNS"], 
	"hg":		["AGB", "NSNS"], 
	"tl": 		["AGB", "NSNS"], 
	"pb": 		["AGB", "NSNS"], 
	"bi": 		["AGB", "NSNS"] 
})



