## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
    
    cachedInverseMatrix <- NULL #cache the inversed matrix
    originalMatrix <- x #save the original matrix passed in
    
    #get the original matrix
    get<-function() {
        originalMatrix
    }
    #update the original matrix
    set<-function(matrix) {
        originalMatrix<<-matrix
        cachedInverseMatrix<<-NULL
    }
    #get inversed matrix from the cache
    getInverse<-function() {
        cachedInverseMatrix
    }
    #update the cached inversed matrix
    setInverse<-function(inverse) {
        cachedInverseMatrix<<-inverse
    }
    
    list(
        set = set, 
        get = get,
        setInverse = setInverse,
        getInverse = getInverse
    )
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    #try to get the inversed matrix from cache
    #solve it if not solved
    cachedInverse = x$getInverse()
    if (is.null(cachedInverse)) {
        inverse <- solve(x$get())
        x$setInverse(inverse)
    }
    #in either case, return the solved matrix
    x$getInverse()
}
