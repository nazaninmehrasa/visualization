
load('vw_commercial_vidinfo.mat')
load('/cs/vml2/nmehrasa/eccv16/code/similarities.mat')
load('allsegsvw_commercial.mat')
sup = 300
row20=similarities(sup,:);
%[row20,Index]=sort(row20);
uniq_row20=unique(row20);
normalizedrow=[];
maxx=max(row20);
minx=min(row20);

%for i=1:size(uniq_row20,2) 
%       normalizedRow[i]=uniq_row20(1,i)/uniq_row20(1,1)
%SpringColors=spring(size(uniq_row20,2));
SpringColors=spring(1002);
for frame = 1:19
seg10=labelledlevelvideo(:,:,frame);
img_seg10 = (cat(3,seg10,seg10,seg10));
temp=0;
minIdx=size(row20,2);
for i = 1:size(seg10,1)
for j = 1:size(seg10,2)
	if mapped(frame, seg10(i,j))==sup
		img_seg10(i,j,1)=0;
		img_seg10(i,j,2)=0;
		img_seg10(i,j,3)=0;
    else
        idx = mapped(frame, seg10(i,j));
        value=row20(idx);
        minIdx=min(minIdx, idx);
        value=ceil(1000*(value-minx)/(maxx-minx))+1;
      
        temp=temp+1;
		img_seg10(i,j,1)=SpringColors(value,1);
		img_seg10(i,j,2)=SpringColors(value,2);
		img_seg10(i,j,3)=SpringColors(value,3);

	end
end
end
figure
imshow(img_seg10);
title(strcat(strcat('min=',int2str(row20(minIdx))),strcat('max=',int2str(maxx))));


imwrite(img_seg10,['./test/',num2str(frame),'.jpg']);
end
figure;
histogram(row20);
