# Linear functions
f(x) = x[1] + x[2] - x[4]^2
f([-1,0,1,2])
# Superposition
# f(a*x + b*y) = a*f(x) + b*f(y)
a = [-2, 0, 1, -3];
f(x) = a'*x # Inner product function
x = [2, 2, -1, 1]; y = [0, 1, -1, 0];
alpha = 1.5; beta = -3.7;
lhs = f(alpha * x + beta * y)
rhs = alpha * f(x) + beta * f(y)
e3 = [0, 0, 1, 0];
f(e3)

# Average funtion using innerproduct
avg(x) = (ones(length(x))'*x)/length(x)
x = [1, -3, 2, -1];
avg(x)

# Taylor approximation
f(x) = x[1] + exp(x[2]-x[1]); # A function
# And its gradient
grad_f(z) = [1-exp(z[2]-z[1]), exp(z[2]-z[1])];
z = [1, 2];
# Taylor approximation at z
f_hat(x) = f(z) + grad_f(z)'*(x-z);
# Let's compare f and f_hat for some specific x's
f([1,2]), f_hat([1,2])
f([0.96,1.98]), f_hat([0.96,1.98])
f([1.10,2.11]), f_hat([1.10,2.11])

# Regression model
# Parameters in regression model
beta = [148.73, -18.85]; v = 54.40;
y_hat(x) = x'*beta + v;
# Evaluate regression model prediction
x = [0.846, 1]; y = 115;
y_hat(x), y
x = [1.324,2]; y = 234.50;
y_hat(x), y

using VMLS
D = house_sales_data();
price = D["price"]
area = D["area"]
beds = D["beds"]
v = 54.4017;
beta = [ 148.7251, -18.8534 ];
predicted = v .+ beta[1] * area + beta[2] * beds;
using Plots
scatter(price, predicted, lims = (0,800))
plot!([0, 800], [0, 800], linestyle = :dash)
# make axes equal and add labels
plot!(xlims = (0,800), ylims = (0,800), size = (500,500))
plot!(xlabel = "Actual price", ylabel = "Predicted price")