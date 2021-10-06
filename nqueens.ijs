
NB. N Queens - Adjacency matrix attempt

am=: {{ (2$*:y) $ 0 }}
deg=: +/"1
an=:{{I.0=deg y}} NB. Available nodes. No queens on or attacking these nodes.
row=:{{y#~x e."1 y}}
n2i=:{{ (<.x%y), y|x }}"0 NB. node to index
i2n=:{{ (y*{.x) + {:x }}"1 NB. index to node

NB. TODO: Still broken for x on edges
diag=:{{
NB. return diagonal edges from node x on a y*y sized board
bl=.(#~ [: *./"1 >:&0) (x n2i y) -"1 (|.i:y) ,. i:y NB. bottom-left to top-right
tl=.(#~ [: *./"1 >:&0*.<&y) (x n2i y) -"1 ,.~ i:y NB. top-left to bottom-right
(~.bl,tl) i2n y
}}

qe=:{{
NB. queen edges, queen placed on node x of y*y grid reaches these edges
b=.i. 2$y
r=.x row b
c=.x row |:b
d=.x diag b
edges=.r,c,d
}} 

qstep=: dyad define
NB. x is current queens list in queensw form
NB. y is the current adjacency matrix
col=.#x NB. How many cols we have placed queens on.
clearnodes=.I.0=col}. deg y
NB. find current column nodes and check if any are clear
n=.col{|:i.2$%:#y
n=. n {~I. n e. clearnodes
NB. TODO add edges to adjacency matrix in y

NB. n qstep"0 1 y
n
)





