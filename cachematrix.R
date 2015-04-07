## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
        invMtrx <- NULL
        idMtrx <- NULL
        
        setMatrix <- function(y) {
                x <<- y
                invMtrx <<- NULL
                idMtrx <<- NULL
        }
        getMatrix <- function() { 
                return x 
        }
        
        setInvMatrix <- function(invMatrix) { 
                invMtrx <<- invMatrix 
                idMtrx <<- x %*% invMatrix
        }
        getInvMatrix <- function() { 
                return invMtrx 
        }
        
        list(setMatrix = setMatrix, 
             getMatrix = getMatrix, 
             setInvMatix = setInvMatrix, 
             getInvMatrix = getInvMatrix)

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        
        ##get the cached inverted matrix
        i < x$getInvMatrix()
        
        ## if inverted matrix exists and the stored id matrix is the same, return cached inverted matrix
        if(!is.null(i)) {
                tInputIdMatrx <- x$getMatrix %*% i
                if(all(tInputIdMtrx == idMtrx)) {
                        message("getting Cached data")
                        return i
                }
        }
        ## cache then return the inverse matrix
        m <- x$getMatrix()
        i <- solve(mtrx)
        x$setInvMatrix(i)
        i
}
