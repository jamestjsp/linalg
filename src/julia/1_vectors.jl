using Plots

# Vectors in Julia are represented by one-dimensional Array objects. A vector is constructed by giving the list of elements surrounded by square brackets, with the elements separated by commas or semicolons."

x = [ -1.1, 0.0, 3.6, -7.2 ]


# Using semicolons

y = [ -1.1; 0.0; 3.6; -7.2 ]

[1.3] == 1.3

# Block or stacked vectors.

# To construct a block vector in Julia, you can use vcat (vertical concatenate) or the semicolon (;) operator.

# Subvectors and slicing."

x = [ 9, 4, 3, 0, 5 ]


# Vector of first differences.

# Zero Vectors

zeros(3)

# Unit Vectors

begin
	i = 1; n = 4;
end

ei = zeros(n)

ei[i] = 1

ei

[zeros(i-1); 1 ; zeros(n-i)]

# One Vectors

ones(2)

rand(5)

# Ploting

temps = [ 71, 71, 68, 69, 68, 69, 68, 74, 77, 82, 85, 86,88, 86, 85, 86, 84, 79, 
		77, 75, 73, 71, 70, 70, 69, 69, 69, 69, 67, 68, 68, 73, 76, 77, 82, 84, 
		84, 81, 80, 78, 79, 78, 73, 72, 70, 70, 68, 67 ]

plot(temps, marker = :circle, legend = false, grid = false)

savefig("../../figs/temperature.svg")

# Vector Addition

[ 0, 7, 3 ] + [ 1, 2, 0 ]

[ 1, 9 ] - [ 1, 1]

# Scalar-vector multiplication

# Elementwise operations.

# "As an example of elementwise division, let’s find the 3-vector of asset returns from the (vectors of) initial and final prices of assets

p_initial = [ 22.15, 89.32, 56.77 ];

p_final = [ 23.05, 87.32, 57.13 ];

r = (p_final - p_initial) ./ p_initial

# Elementwise operations with a scalar

w = [1,2,2];

z = [1,2,3];

w == z

w .== z

# For example x[abs.(x) .> 1] gives the subvector of x consisting of the entries larger than one in magnitude

# Dot notation works with assignment too, allowing you to assign multiple entries of a vector to a scalar value. For example:

# Linear combination

vcat(a,b)

alpha = -0.5; 

beta = 1.5;
# Inner product

length(x)

x[4:5] = [ -2, -3 ];  # Re-assign the 4 and 5 entries of x
x

d = x[2:end] - x[1:end-1]
d

2.2 * x

x[abs.(x) .> 1]

x[1:2] = [-1,1];

x

x[2:3] .= 1.3;

x

length(y)

typeof(y)

x==y

x'*y


begin
a = [ 1, 2 ]; 
b = [ 3, 4 ];
end

x = [ -1, 2, 2 ];

╡
x = rand(4)

y = x[2:4]

begin
	a=[1,-2];
	b=[1,1,0];
end

x = [ 0, 2, -1 ];

c = alpha*a + beta*b

y = [ 1, 0, -3 ];


x = [ 1, 0, 0, -2, 2 ]

c = [a;b]
x = [1.1, .5, -1.5, -0.3]
# Net present value. As an example, the following code snippet finds the net
# present value (NPV) of a cash flow vector c, with per-period interest rate r.
c = [ 0.1, 0.1, 0.1, 1.1 ]; # Cash flow vector
n = length(c);
r = 0.05; # 5% per-period interest rate
d = (1+r) .^ -(0:n-1)
NPV = c'*d

# Total school-age population. Suppose that the 100-vector x gives the age distribution
# of some population, with xi the number of people of age i - 1, for
# i = 1; : : : ; 100. The total number of people with age between 5 and 18 (inclusive)
# is given by x6 + x7 + ... + x18 + x19
s = [zeros(5); ones(14); zeros(81)]

# Complexity of vector computations
# Floating point operations
a = rand(); b = rand();
lhs = (a+b) * (a-b)
rhs = a^2 - b^2
lhs - rhs
# Complexity
a = randn(10^5); b = randn(10^5);
@time a'*b

c = randn(10^6); d = randn(10^6);
@time c'*d	

# Sparse vectors
using SparseArrays
a = sparsevec( [ 123456, 123457 ], [ 1.0, -1.0 ], 10^6 )
length(a)
nnz(a)
b = randn(10^6);
@time 2*a; # Computed efficiently!
@time 2*b;
@time a'*b;
@time b'*b;
@time c = a + b;