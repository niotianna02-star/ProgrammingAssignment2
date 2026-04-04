## This code helps us save time by storing the inverse of a matrix
## so we don't have to calculate it again and again.

makeCacheMatrix <- function(x = matrix()) {
# 'inv' will store the inverse matrix, initially it is empty (NULL)
inv <- NULL

# This function changes the matrix
set <- function(y) {
x <<- y
inv <<- NULL # If the matrix changes, we must clear the cache
}

# This function returns the matrix
get <- function() x

# This function saves the inverse to the cache
setInverse <- function(solve_result) inv <<- solve_result

# This function gets the inverse from the cache
getInverse <- function() inv

# List of all the functions we created
list(set = set, get = get,
setInverse = setInverse,
getInverse = getInverse)
}


## This function calculates the inverse, but first it checks the cache.
cacheSolve <- function(x, ...) {
# Check if the inverse is already saved
inv <- x$getInverse()

# If it is found, return it and skip the calculation
if(!is.null(inv)) {
message("Getting from cache...")
return(inv)
}

# If not found, get the original matrix
data <- x$get()

# Calculate the inverse using the solve() function
inv <- solve(data, ...)

# Save the result to the cache for next time
x$setInverse(inv)

# Return the final result
inv
}
