//StopWatch: Modulo-60 Counter
module stopwatch(
    input Enable,
    input Clock,
    input Reset,
    output Out,
    output [5:0] State //6-bits to represent the highest number 59
);
    
    wire [5:0] Connect;
    wire [5:0] DConnect;
    wire Connect1;
    wire Connect2;
    wire Connect3;
    wire Connect4;
    wire Connect5;
    wire Connect6;
    wire ConnectOut;
    wire CountOut;
    wire OutD;
    
    assign CountOut = (State[2] & ~State[1] & State[0]) | Reset;
    assign OutD = Out ^ CountOut;     

    dff dff1(
        .D(DConnect[0]),
        .Clock(Clock),
        .Reset(CountOut),
        .Q(State[0]),
        .NotQ(Connect[0])
    );
    
    dff dff2(
        .D(DConnect[1]),
        .Clock(Clock),
        .Reset(CountOut),
        .Q(State[1]),
        .NotQ(Connect[1])
    );

    dff dff3(
        .D(DConnect[2]),
        .Clock(Clock),
        .Reset(CountOut),
        .Q(State[2]),
        .NotQ(Connect[2])
    );

    dff dff4(
        .D(DConnect[3]),
        .Clock(Clock),
        .Reset(CountOut),
        .Q(State[3]),
        .NotQ(Connect[3])
    );
    
    dff dff5(
        .D(DConnect[4]),
        .Clock(Clock),
        .Reset(CountOut),
        .Q(State[4]),
        .NotQ(Connect[4])
    );

    dff dff6(
        .D(DConnect[5]),
        .Clock(Clock),
        .Reset(CountOut),
        .Q(State[5),
        .NotQ(Connect[5])
    );
    
    dff dffout(
        .D(OutD),
        .Clock(Clock),
        .Reset(Reset),
        .Q(Out),
        .NotQ(ConnectOut)
    );
    
    full_adder adder1(
        .A(State[0]),
        .B(1'b1),
        .Cin(1'b0),
        .Cout(Connect1),
        .Y(DConnect[0])
    );
    
    full_adder adder2(
        .A(State[1]),
        .B(1'b0),
        .Cin(Connect1),
        .Cout(Connect2),
        .Y(DConnect[1])
    );

    full_adder adder3(
        .A(State[2]),
        .B(1'b0),
        .Cin(Connect2),
        .Cout(Connect3),
        .Y(DConnect[2])
    );

    full_adder adder4(
        .A(State[3]),
        .B(1'b0),
        .Cin(Connect3),
        .Cout(Connect4),
        .Y(DConnect[2])
    );

    full_adder adder5(
        .A(State[4]),
        .B(1'b0),
        .Cin(Connect4),
        .Cout(Connect5),
        .Y(DConnect[2])
    );

     full_adder adder6(
        .A(State[5]),
        .B(1'b0),
        .Cin(Connect5),
        .Cout(Connect6),
        .Y(DConnect[2])
    );
   
endmodule




