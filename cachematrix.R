## makeCacheMatrix :: This function is used to create a special "matrix" object 
## that can cache its inverse
## set and get the value of the matrix
## set and get the valiue of the inverse of the matrix
## matrix is called from cacheSolve function below which computes the inverse of the matrix


makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    set <- function(y) {
      x <<- y
      inv <<- NULL
    }
    get <- function() x
    setinv <- function(inverse) inv <<- inverse
    getinv <- function() inv
    list(set = set, get = get, setinv = setinv, getinv = getinv)
}
  

## cacheSolve is a function which computes the inverse of the special "matrix" 
## returned by makeCacheMatrix above. 
## If the inverse had been calculated then it should return it friom cache and not 
## compute it again

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  ##
  inv <- x$getinv()
  if(!is.null(inv)) {
    message("getting cached result")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data, ...)
  x$setinv(inv)
  inv
}  

m <- matrix(rnorm(16),4,4)
m1 <- makeCacheMatrix(m)
cacheSolve(m1)  


