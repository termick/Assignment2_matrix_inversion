## Two functions to create calculate the inverse matrix. 
## functions do

## The first function, makeCacheMAtrix creates a special matrix, which is really a list containing a function to



library(MASS) #load MASS library to use the matrix inverse function
makeCacheMatrix <- function(x=matrix()){
        m<-NULL
        set<-function(y){     #set the value of the matrix
                x<<-y
                m<<-NULL       
        }lil
        get<-function() x      #get the value of the matrix
        setinv<-function(ginv) m<<-ginv    #set the value of the inverse matrix
        getinv<-function() m       #get the value of the inverse matrix
        list(set=set, get=get, setinv=setinv, getinv=getinv)
}

## The second function  computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
#If the inverse has already been calculated (and the matrix has not changed), 
#then the cachesolve should retrieve the inverse from the cache.


cacheSolve<-function(x, ...){
        
        m<-x$getinv()
        if(!is.null(m)){
                message("getting cache data")
                return(m)
# Return a cache matrix that is the inverse of 'x'                          
        }
        data<-x$get()
        m<-ginv(data, ...)
        x$setinv(m)
        m
##Return a matrix that is the inverse of 'x'          
}

#input example:
#z<-matrix(1:4, nrow=2, ncol=2)
#a<-makeMatrix(x=z)
#a$get()
#cacheSolve(a)


