## Caching the inverse of a matrix

## this function creates a special "matrix" that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
  i<-NULL
  set<-function(matrix){
    m<<-matrix
    i<<-NULL
  }
  get<-function(){
    m
  }
  setinverse<-function(inverse){
    i<<-inverse
  }
  getinverse<-function(){
    i
  }
  list(set=set,get=get,
       setinverse=setinverse,
       getinverse=getinverse)
}


## this function computes the inverse of the special "matrix" returned by makeCacheMatrix


cacheSolve <- function(x, ...) {
  m<-x$getinverse()
  if(!is.null(m)){
    message("getting cached data")
    return(m)
  }
  data<-x$get()
  m<-solve(data,...)
  x$setinverse(m)
  m
}
}
