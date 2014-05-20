## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
library(MASS)
makeCacheMatrix <- function(x=matrix()){
        m<-NULL
        set<-function(y){
                x<<-y
                m<<-NULL       
        }
        get<-function() x
        setinv<-function(ginv) m<<-ginv
        getinv<-function() m
        list(set=set, get=get, setinv=setinv, getinv=getinv)
}

## Write a short comment describing this function


cacheSolve<-function(x, ...){
        m<-x$getinv()
        if(!is.null(m)){
                message("getting cache data")
                return(m)
## Return a cache matrix that is the inverse of 'x'                          
        }
        data<-x$get()
        m<-ginv(data, ...)
        x$setinv(m)
        m
## Return a matrix that is the inverse of 'x'          
}