#TonD

TonD is a latex example for drawing circuit and also a place to summaries my knowledge in Electronic I, II and III

##List of Commands
###\TondComment
add an arrow point toward a node
###\TondNode
add node (little filled circle) at `position` where `position` is a node in TikZ

`TondNode{position}{caption}{direction}`

possible directions
- n: north
- e: east
- s: south
- w: west

###\TondOut
draw an output node (little circle) at `position` where `position` is a node in TikZ

`TondOut{position}`

