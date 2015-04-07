## Put comments here that give an overall description of what your
## functions do

## This functions provides functions for setting and getting a matrix 
## as well as caching the inverse of the matrix. 
## An identity matrix is created during the caching of the inverse matrix for comparison purposes.

makeCacheMatrix <- function(x = matrix()) {
        
        ## create empty variables to store the inverted matrix and the id matrix
        invMtrx <- NULL
        idMtrx <- NULL
        
        ## set the matrix after instantiation, 
        ## clear the cache for the inverted matrix and the id matrix
        setMatrix <- function(y) {
                x <<- y
                invMtrx <<- NULL
                idMtrx <<- NULL
        }
        
        ## return the currently set Matrix
        getMatrix <- function() { 
                return x 
        }
        ## set the inverted matrix and calculate the id matrix
        setInvMatrix <- function(invMatrix) { 
                invMtrx <<- invMatrix 
                idMtrx <<- x %*% invMatrix
        }
        
        ## return the inverted matrix
        getInvMatrix <- function() { 
                return invMtrx 
        }
        
        list(setMatrix = setMatrix, 
             getMatrix = getMatrix, 
             setInvMatix = setInvMatrix, 
             getInvMatrix = getInvMatrix)

}


## This function takes the makeCacheMatrix funtion with an initial matrix, 
## looks for the cached matrix and if found, compares the identity matrix 
## of the current matrix with a cached identity matrix to determine if the 
## cached inverse matrix is the correct one and return it.
## If there is no cached inverse matrix, then one is created and cached in memory.

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
