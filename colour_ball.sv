//Q.write a constraint to pick a colour ball from 10 different colour ball but it should not come for next 3 times the same
typedef enum bit[3:0]{ 
	c0,c1,c2,c3,c4,c5,c6,c7,c8,c9
}colour_t;
class sample;
rand colour_t a;
colour_t rm_colour;
  colour_t colour_Q[$:2];
constraint a_c{
	!(a inside {colour_Q});
}

function void post_randomize();
	if(colour_Q.size()==3) rm_colour=colour_Q.pop_front();
	colour_Q.push_back(a);
endfunction

endclass
`define COLOURS 18
module top ;
  sample s=new();

initial begin
  repeat(`COLOURS)begin
	assert(s.randomize());
	$write("%s--",s.a);
  end
end

endmodule
