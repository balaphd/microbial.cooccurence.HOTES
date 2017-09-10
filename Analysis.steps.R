# Constructing microbial co-occurrence with phylum otu table
library(devtools)
install_github("zdk123/SpiecEasi")
library(SpiecEasi)
source('http://bioconductor.org/biocLite.R')
biocLite('phyloseq')
library(phyloseq)
install_github("hallucigenia-sparsa/seqtime") 
library(seqtime)
setwd('/Users/balathl/phd.work/cooccurence.phd.work/cooccurence/bacteria/network.phylum/R.directory/SPIECEASI/input/')
list.files()
input.path="/Users/balathl/phd.work/cooccurence.phd.work/cooccurence/bacteria/network.phylum/R.directory/SPIECEASI/input/"
output.path="/Users/balathl/phd.work/cooccurence.phd.work/cooccurence/bacteria/network.phylum/R.directory/SPIECEASI/output/"
biom.path=file.path(input.path,"bac.mdonly.otu.all.json.biom")
phyloseqobj=import_biom(biom.path)
otus=otu_table(phyloseqobj)
taxa=tax_table(phyloseqobj)
attributes(phyloseqobj)




filterobj=filterTaxonMatrix(otus,minocc=20,keepSum = TRUE, return.filtered.indices = TRUE)
otus.f=filterobj$mat
taxa.f=taxa[setdiff(1:nrow(taxa),filterobj$filtered.indices),]
dummyTaxonomy=c("k__dummy","p__","c__","o__","f__","g__","s__")
taxa.f=rbind(taxa.f,dummyTaxonomy)
rownames(taxa.f)[nrow(taxa.f)]="0"
rownames(otus.f)[nrow(otus.f)]="0"

updatedotus=otu_table(otus.f, taxa_are_rows = TRUE)
updatedtaxa=tax_table(taxa.f)
phyloseqobj.f=phyloseq(updatedotus, updatedtaxa)

spiec.out=spiec.easi(phyloseqobj.f, method="mb",icov.select.params=list(rep.num=20))

#spiec.graph=adj2igraph(spiec.out$refit, vertex.attr=list(name=taxa_names(phyloseqobj.f)))
#plot_network(spiec.graph, phyloseqobj.f, type='taxa', color="Rank2", label=NULL)
