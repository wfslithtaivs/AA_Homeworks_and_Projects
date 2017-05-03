require_relative "wordchains"

a = Time.now

worder = WordChainer.new("dictionary.txt")
worder.run("spur", "avid")

p Time.now - a

=begin
Set filter method
"spur"
"spar"
"sear"
"bear"
"bead"
"brad"
"grad"
"grid"
"arid"
"avid"
21.220601

Set lookup method
"spur"
"spar"
"sear"
"bear"
"bead"
"brad"
"grad"
"grid"
"arid"
"avid"
0.404385

Set lookup method with early break
"spur"
"spar"
"sear"
"bear"
"bead"
"brad"
"grad"
"grid"
"arid"
"avid"
0.398546
=end
