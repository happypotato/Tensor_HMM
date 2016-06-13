This archive contains:

###################The file given by the author:####################
1 'matrix_ns_freq.txt'
  = frequency data for matrix of 10057 nouns x 1996 context words
  --> FORMAT: <nounid> <tab> <contextwordid> <tab> <frequency>

2 'tensor_vso_freq.txt'
  = frequency data for tensor of 989 verbs x 10057 subjects x 10057 objects
  --> FORMAT: <verbid> <tab> <nounid> <tab> <nounid> <tab> <frequency>

3 'so.10057', 'sems.1996', 'verbs.989'
  = actual wordlists, where the line number represents the id
  (counting starts at 0)


###############Code:#############################################
1. ‘betaNMF.m’ : function for NMF with KL divergence 
2. ‘code.m’ : Get W 
3. ‘getmat.R’ : Get word-context matrix
4. ‘PMI_2D.m’: function for get PMI value for two dimensional array
5. ‘simulation.R’: replicate the part 4 example in the paper
6. ‘tensor.py’: get reduced tensor of 989*300*300
7. ‘tensorcode.m’ : get PMI

############Data generated######################################
1. ‘mat.txt’: word-context matrix
2. ‘PMI.txt’: the fifth value is the 3d PMI multiplied by word frequency
3. ‘W.txt’: W
