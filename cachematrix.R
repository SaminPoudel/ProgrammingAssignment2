## The function creates a matrix that can cache its inverse
## and computes the inverse returned by cache 

## The function creates a "matrix", which contains functions to set
## the value of matrix, get the value of matrix, set the inverse of 
## and get the inverse of matrix
makeCacheMatrix <- function(x = matrix()) {
i <- NULL
set <- function(y) {
  x <<- y
  i <<- NULL
}
get <- function () x
setinverse <- function(inverse) i <<- inverse
getinverse <- function() i
list(set = set, get = get,
     setinverse = setinverse,
     getinverse = getinverse)
}


## The function calculates the inverse if the "matrix" and also checks 
## if the inverse has been already calculated in cache to skip or calculate

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
i <- x$getinverse()
if(!is.null(i)) {
  message("getting cached data")
  return(i)
}
data <- x$get()
i <- solve(data, ...)
x$setinverse(i)
i
  }
