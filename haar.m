%load the source directory
src = ’C:\Users\Satyajit Giri\Desktop\cohn-kanade-images\’;

%list of feature vectors
E_final = [];
for i = 1:100

	%find all images in a sample
	imagefiles = dir(strcat(src,’s’,num2str(i),’\sad_new\*.png’));
	nfiles = length(imagefiles);
	final_feature_vector = [];
	final_hor = zeros(48,48);
	final_ver = zeros(48,48);
	final_diag = zeros(48,48);
	for j=1:nfiles
		I= imread(strcat(imagefiles(j).folder,’\’,imagefiles(j).name));
		%wavelet transform
		[a,h,v,d] = haart2(I,2);
		horI = mat2gray(h{1});
		verI = mat2gray(v{1});
		diagI = mat2gray(d{1});
		%get MSA of results
		final_hor = sqrt(final_hor.^2 + horI.^2);
		final_ver = sqrt(final_ver.^2 + verI.^2);
		final_diag = sqrt(final_diag.^2 + diagI.^2);
	end

	%concatenate the horizontal, vertical and diaganol vectors
	feature_vector = cat(2, reshape(final_hor,[1,48*48]),...
	reshape(final_ver,[1,48*48]),reshape(final_diag,[1,48*48]));
	E_final = [E_final;feature_vector];
	disp(strcat(’Done with’, ’ S’, num2str(i)));
end
a=[]
for i=1:100
	a = [a;’Sad’];
end

save(’sad_haar_E_final_a.mat’,’E_final’,’a’);