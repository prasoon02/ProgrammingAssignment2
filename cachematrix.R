## R Programming : Assignment 2 - Lexical Scoping
## The functions below are used to create objects that stores a matrix & 
## caches its inverse

## The function creates a special matrix object that can cache its inverse
makeCacheMatrix <- function(x = matrix()) {
  invmatrix <-NULL
  set<- function(m1){
    x<<- m1
    invmatrix<<-NULL
  }
  get <- function()x
  setinverse<- function(solve)  invmatrix<<-solve
  getinverse<- function() invmatrix
  list(set=set,get=get,
       setinverse=setinverse,
       getinverse=getinverse)

}


## The function computes inverse of matrix created by the function 
## 'makeCacheMatrix'. It retrieves from cache if the inverse has already 
## been calculted given the matrix has not changed.


cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  invm<-x$getinverse()
  if(!is.null(invm)){
    message("getting cached data")
    return(invm)
  }
  data<-x$get()
  invm<-solve(data,...)
  x$setinvm(invm)
  invm
}
