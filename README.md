# Microbial.Cooccurence.HOTES
### Title
Microbial co-occurrence network patterns in moisture damaged homes in Finland.
#Abstract

### Introduction


Previous knowledge (moisture damage microbial signatures upon damage vs renovation)


Knowledge gap (details missing on the interaction of microbes in the environment compared and also we dont know whether the interaction changes after renovation)

The main objective of the paper is to construct microbial co-occurrence network and identify signature co-occurence patterns in moisture damaged homes in Finland. Some of the specific aims include:

(1) how the microbes interacts between themself or with one another in moisture damaged environments 
(2) how the interaction is between different microbial kingdoms - Bacteria and Fungi in moistute damaged environments 
(3) Does the global and local network properties of microbial co-occurence network were unique to moisture damage and does it changes after renovation 
(4) What/How does the identified signatures in HOTES paper (first one) placed/explained in the microbial co-occurence network (5) Does renovation has an effect on the interaction of microbes with this signature microbes (from first paper) in the network? 
(6) Is it possible to identify signature co-occurence microbes specific to moisture damaged environment?

### Methods

- Constructing microbial co-occurence network from moisture damaged homes
- Constructing microbial co-occurence network from renovated homes
- Calculate the global and local prop[erties in each networks and compare them
- Doing the same with Fungal data too
- Constructing network combining both Bacteria and Fungi
- Doing the same with the combined network
- Locate the signature sequences in all the networks constructed

The otu table was splitted for moisture damaged samples only and renovated only.

Preliminary steps were 
- the OTU table was filtered for only closed reference OTUs only. The reasoning behind this is to address the problem regarding the denovo otu picking done by open reference approach. Since denovo otu picking is not robust as closed reference OTUIDs.  
$ sed '/New/d' bac.mdonly.otu.readable.txt > bac.mdonly.closed.otu.readable.txt
$ wc -l bac.mdonly.otu.readable.txt 
    4423 bac.mdonly.otu.readable.txt
$ wc -l bac.mdonly.closed.otu.readable.txt 
    3721 bac.mdonly.closed.otu.readable.txt
    
    CONET(Co-occurrence Network inference) network construction:

This otu table with 3721 OTUs were used as input into CONET application in Cytoscape software.
the resulting network was constructed with below 
Parameters such as 

PREPROCESSING AND FILTERING MENU:
Input filtering: row_minocc = 20.0
Keep sum of filtered rows: yes 
Standardization: col_norm: yes [column normalization]

METHODS:
Correlation threshold applies to both positive an d negative correlations (Pearson correlation and Spearman correlation)
Multiple-test corrections (none but bonferroni and benjaminihochberg can be applied)

Similarities (Mutual Information)

Distances (Bray Curtis dissimilarities and Kullback-Leibler dissimilarities)

Top edges (edgeNumber) edge selection parameter = 1000
Top and bottom

Randomization menu: 
Randomization options brown, filter unstable edges

Run randomization and create permutations.txt

Then use the permutation.txt as null distribution and do the bootstrap to create robust network.

Then the network was selected for only positive edges and negative edges seperately.

After that step, the positive edges (co-occurence) network was clustered with Cytocluster in cytoscape and the clusters in network were identified. They were analysed for taxa lineage within the cluster to infer some biological meaning in it.




### Results

### Discussion
