## demo of k-means clustering...
 
## Step 1: make up some data
x <- rbind(
  matrix(rnorm(100, mean=0, sd = 0.3), ncol = 2), # cluster 1
  matrix(rnorm(100, mean = 1, sd = 0.3), ncol = 2), # cluster 2
  matrix(c(rnorm(50, mean = 1, sd = 0.3), # cluster 3
    rnorm(50, mean = 0, sd = 0.3)), ncol = 2))
colnames(x) <- c("x", "y")
 
## Step 2: show the data without clustering
plot(x)
 
## Step 3: show the data with the known clusters (this is just so we
## can see how well k-means clustering recreates the original clusters we
## created in step 1)
colors <- as.factor(c(
  rep("c1", times=50),
  rep("c2", times=50),
  rep("c3", times=50)))
plot(x, col=colors)
 
## Step 3: cluster the data
## NOTE: nstart=25, so kmeans() will cluster using 25 different starting points
## and return the best cluster.
(cl <- kmeans(x, centers=3, nstart=25)) 
 
## Step 4: plot the data, coloring the points with the clusters
plot(x, col = cl$cluster)
