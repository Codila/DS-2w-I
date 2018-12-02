data{
	int nY ; # no. of patients
	int nX ; # no. of groups
	int y[nY] ;
	matrix[nY,nX] x ; # x is the predictor in the matric
}
parameters{
	vector[nX] coef ;
}
model{
	coef ~ normal(0,10) ; # prior on the intercept with broad variance
	y ~ bernoulli_logit(x*coef ) ; # random coin which #has a bias associated with it reflected on the log odds #scale
}
generated quantities{
	int y2[nY] ;
	for(i in 1:nY){
		y2[i] = bernoulli_logit_rng( (x*coef)[i] ) ;# #predicting with bias for each case and working out what #is the bias for that case taht we get from the model part
	} 
}
