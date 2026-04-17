`timescale 1ns / 1ps

module one_hot(
input w,
input clk,
input reset,
output z,
output [4:0]states
    );
    
    wire ANext, BNext, CNext, DNext, ENext;
    wire AState, BState, CState, DState, EState;
    
    dff Adff(
        .Default(1'b1),
        .D(ANext),
        .clk(clk),
        .Q(AState),
        .reset(reset)
    );
    
    dff Bdff(
        .Default(1'b0),
        .D(BNext),
        .clk(clk),
        .Q(BState),
        .reset(reset)
    );

    dff Cdff(
        .Default(1'b0),
        .D(CNext),
        .clk(clk),
        .Q(CState),
        .reset(reset)
    );
    
    dff Ddff(
        .Default(1'b0),
        .D(DNext),
        .clk(clk),
        .Q(DState),
        .reset(reset)
    );

    dff Edff(
        .Default(1'b0),
        .D(ENext),
        .clk(clk),
        .Q(EState),
        .reset(reset)
    );
    
    assign z = CState | EState;
    
    assign ANext = 1'b0;
    assign BNext = ((AState|DState)|EState) & ~w;
    assign CNext = (BState|CState) & ~w;
    assign DNext = ((AState|BState)|CState) & w;
    assign ENext = (DState|EState) & w;
    
    assign states[0] = AState;
    assign states[1] = BState;
    assign states[2] = CState;
    assign states[3] = DState;
    assign states[4] = EState;

endmodule
