using LinearAlgebra
avg(x) = (ones(length(x))'*x)/length(x)
Jclust(x,reps,assignment) = avg( [norm(x[i]-reps[assignment[i]])^2 for i=1:length(x)] )
x = [ [0,1], [1,0], [-1,1] ]
reps = [ [1,1], [0,0] ]
assignment = [1,2,1]
Jclust(x,reps,assignment)
assignment = [1,1,2];
Jclust(x,reps,assignment)

# The k-means algorithm
function kmeans(x, k; maxiters = 100, tol = 1e-5)
    N = length(x)
    n = length(x[1])
    distances = zeros(N) # used to store the distance of each point to the nearest representative.
    reps = [zeros(n) for j=1:k] # used to store representatives.
    # 'assignment' is an array of N integers between 1 and k.
    # The initial assignment is chosen randomly.
    assignment = [rand(1:k) for i in 1:N]
end