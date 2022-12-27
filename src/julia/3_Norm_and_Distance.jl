# Norm
using LinearAlgebra
x = [2, -1, 2];
norm(x)
sqrt(x'*x)
sqrt(sum(x.^2))
# Triangle inequality
x = randn(10); y = randn(10);
lhs = norm(x+y)
rhs = norm(x) + norm(y)

# RMS value
# norm(x)/sqrt(length(x))
rms(x) = norm(x) / sqrt(length(x));
t = 0:0.01:1; # List of times
x = cos.(8*t) - 2*sin.(11*t);
avg(x) = (ones(length(x))'*x)/length(x)
avg(x)
rms(x)

using Plots
plot(t, x)
plot!(t, avg(x)*ones(length(x)))
plot!(t, (avg(x)+rms(x))*ones(length(x)), color = :green)
plot!(t, (avg(x)-rms(x))*ones(length(x)), color = :green)
plot!(legend = false)

# Chebyshev inequality

# Define Chebyshev bound function
cheb_bound(x,a) = floor(norm(x)^2/a);
a = 1.5;
cheb_bound(x,a)
# Number of entries of x with |x_i| >= a
sum(abs.(x) .>= a)

# Distance
u = [1.8, 2.0, -3.7, 4.7];
v = [0.6, 2.1, 1.9, -1.4];
w = [2.0, 1.9, -4.0, 4.6];
norm(u-v), norm(u-w), norm(v-w)

# Nearest neighbor
nearest_neighbor(x,z) = z[ argmin([norm(x-y) for y in z]) ];
z = ( [2,1], [7,2], [5.5,4], [4,8], [1,5], [9,6] );
nearest_neighbor([5,6], z)
nearest_neighbor([3,3], z)

# De-meaning a vector
de_mean(x) = x .- avg(x); # Define de-mean function
x = [1, -2.2, 3];
avg(x)
x_tilde = de_mean(x)
avg(x_tilde)

# Standard deviation
x = rand(100);
# VMLS definition of std
stdev(x) = norm(x .- avg(x)) / sqrt(length(x));
stdev(x)

# Return and risk
a = ones(10);
avg(a), stdev(a)
b = [ 5, 1, -2, 3, 6, 3, -1, 3, 4, 1 ];
avg(b), stdev(b)
c = [ 5, 7, -2, 2, -3, 1, -1, 2, 7, 8 ];
avg(c), stdev(c)
d = [ -1, -3, -4, -3, 7, -1, 0, 3, 9, 5 ];
avg(d), stdev(d)

# Standardizing a vector
# If a vector x isn’t constant (i.e., at least two of its entries are different),
# we can standardize it, by subtracting its mean and dividing by its standard deviation.
function standardize(x)
    x_tilde = x .- avg(x) # De-meaned vector
    return x_tilde / rms(x_tilde)
end
function standardize2(x)
    x_tilde = x .- avg(x) # De-meaned vector
    return x_tilde / stdev(x_tilde)
end
x = rand(100);
avg(x), rms(x)
z = standardize(x);
avg(z), rms(z)
z2 = standardize2(x);
avg(z2), rms(z2)

# Angle
# Define angle function, which returns radians
ang(x,y) = acos(x'*y/(norm(x)*norm(y)));
a = [1,2,-1]; b=[2,0,-3];
ang(a,b)
ang(a,b)*(360/(2*pi)) # Get angle in degrees