## We are trying to build a functions that are able to cache the values, because
## during smaller computations you wont see improvement in speed, but as the number
## of computations increases you need to cache the values for faster excecution

## The function is trying to maintain cache for our use

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y){
    x <<- y
    inv <<- NULL
  }
  get <- function() {x}
  setInverse <- function(inverse){
    inv <<- inverse
  }
  getInverse <- function(){inv}
  list(set = set , get = get , setInverse = setInverse, getInverse = getInverse)
  
}


## The function is trying to make cache for our use

cacheSolve <- function(x, ...) {
  inv <- x$getInverse()
  if(!is.null(inv)){
    message("getting cached data")
    return (inv)
  }
  mat <- x$get()
  inv <- solve(mat , ...)
  x$setInverse(inv)
  inv
  
}
