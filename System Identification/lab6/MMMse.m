MSE_VAL=0;
 Yp_val=Yp_val(1:length(val.u));

 mse=val.y-Yp_val; 
 MSE_VAL=sum(mse.^2)/length(Yp_val)
