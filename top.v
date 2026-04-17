module top(
    input sw, // w
    output [9:0] led, // see IO table
    input btnC, // clk
    input btnU // reset
);
    
    one_hot oneHot(
    .w(sw),
    .clk(btnC),
    .reset(btnU),
    .z(led[0]),
    .states(led[6:2])
    );
    
    binary binary(
    .w(sw),
    .clk(btnC),
    .reset(btnU),
    .z(led[1]),
    .states(led[9:7])
    );
    // Hook up binary and one-hot state machines

endmodule