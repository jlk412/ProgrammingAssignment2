#-------------------------------------------------------------
# J Kennedy - Assignment 2: Caching the Inverse of a Matrix
# 



makeCacheMatrix <- function(x = matrix()) 
{
#-------------------------------------------------------------
# Following the  example from the example makeVector function
# function makeCacheMatrix will create a matrix and cache the
# results of the inverse of that matrix 

#-------------------------------------------------------------
# set m to NULL
# and create a set function that will 
# have set matrix in the other environment to y  and NULL m
# from the other environment as well.
#
m <- NULL
set <- function(y)
	{
	x <<- y
	m <<- NULL
	}
# the next function will get the matrix x
get <- function() x


#-------------------------------------------------------------
#setMatrix will get the inverse - using function solve
#
setMatrix <- function(solve) m <<- solve

#-------------------------------------------------------------
#getMatrix returns the matrix
#
getMatrix <- function() m

#-------------------------------------------------------------
#returning the list of the functions into the object
#
list(set = set, get = get,
	setMatrix = setMatrix,
	getMatrix = getMatrix)
}

#-------------------------------------------------------------
#cacheMatrix
#
# the function cacheMatrix get a matrix object created from
# the makeMatrix function created earlier.  If the inverse
# of the matrix exists, it will return the inverse
# if it has not been created it will 
#
cacheMatrix <- function(x, ...) 
{
m <- x$getMatrix()
#-------------------------------------------------------------
# if the matrix returned is not null, return the cached matrix
#
if(!is.null(m))
	{
	message("getting cached data")
	return(m)
	}
#-------------------------------------------------------------
# if we did not find a value for the matrix then we have to
# get the data and put the inverse of it using solve()
data <- x$get()
m <- solve(data, ...)
x$setMatrix(m)
#-------------------------------------------------------------
# now to print out the inverse of the original matrix
#
m
}